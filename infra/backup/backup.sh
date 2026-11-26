#!/usr/bin/env bash
# Casama scheduled backups (D-197).
#
#   casama-backup schedule   run every day at BACKUP_TIME (UTC), forever (the container default)
#   casama-backup now        one backup, then exit (manual runs and tests)
#   casama-backup list       list the backups in the bucket
#   casama-backup fetch <timestamp> <folder> [--identity <age key file>]
#                            download one bucket backup into a folder `casama selfhost restore` takes
#
# Each backup is a folder <prefix>/<UTC timestamp>/ holding postgres.dump (pg_dump custom format),
# the computer archives (when BACKUP_OBJECTS=true; see below), library.tar.gz (the Library's kept
# files, D-276), and, only when encrypted, env and
# vault-key (the database's Vault root key: without it the secrets in the dump can't be read on
# another machine, D-267).
# With BACKUP_AGE_RECIPIENTS every file is encrypted with age (".age"); the .env holds every key of
# the installation, so it is never uploaded in plain text.
#
# Computer archives in a bucket are incremental (2026-11-24): each archive file never changes once
# written (snapshots/<computer>/<time>.tar.gz, checkpoints/<computer>/<id>.tar.gz), so it is
# uploaded once, encrypted on its own, to <prefix>/objects/<key>, and each night's folder holds
# objects-manifest.txt, the archive names that existed that night (names only: computer ids and
# times). An archive deleted on the server moves to <prefix>/objects-deleted/<YYYY-MM-DD>/<key> and
# goes after BACKUP_KEEP_DAYS, so every kept night can still be rebuilt. `fetch` puts one night back
# together as objects.tar.gz. Before this, every night uploaded the whole volume again (28 GB a
# night on Casama Cloud). Without a bucket the local backup keeps one objects.tar.gz per night.
#
# Settings (environment):
#   PGHOST, PGUSER, PGPASSWORD, PGDATABASE  the database (compose sets them)
#   BACKUP_S3_BUCKET            bucket name; empty = keep backups only in the local volume
#   BACKUP_S3_ENDPOINT          https://<account>.r2.cloudflarestorage.com for R2; empty for AWS
#   BACKUP_S3_REGION            auto for R2 (default), the bucket's region for AWS
#   BACKUP_S3_ACCESS_KEY_ID, BACKUP_S3_SECRET_ACCESS_KEY
#   BACKUP_S3_PREFIX            folder in the bucket (default casama)
#   BACKUP_TIME                 HH:MM in UTC (default 03:30)
#   BACKUP_KEEP_DAYS            remove backups older than this (default 30)
#   BACKUP_AGE_RECIPIENTS       comma-separated age (age1…) or ssh public keys
#   BACKUP_OBJECTS              true to include computer archives (/objects)
#   BACKUP_PING_URL             optional URL called after each success (healthchecks.io and similar),
#                               with /fail appended after a failure
set -euo pipefail

: "${PGHOST:=db}" "${PGUSER:=postgres}" "${PGDATABASE:=postgres}"
export PGHOST PGUSER PGDATABASE
BACKUP_TIME=${BACKUP_TIME:-03:30}
KEEP_DAYS=${BACKUP_KEEP_DAYS:-30}
PREFIX=${BACKUP_S3_PREFIX:-casama}
LOCAL=/backups
log() { printf '%s backup: %s\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)" "$*"; }

# Sets DEST (rclone path) and the rclone settings in this shell; returns 1 without a bucket.
DEST=""
remote() {
  [[ -n "${BACKUP_S3_BUCKET:-}" ]] || return 1
  export RCLONE_CONFIG_DEST_TYPE=s3
  export RCLONE_CONFIG_DEST_PROVIDER=${BACKUP_S3_PROVIDER:-$([[ "${BACKUP_S3_ENDPOINT:-}" == *r2.cloudflarestorage.com* ]] && echo Cloudflare || echo Other)}
  export RCLONE_CONFIG_DEST_ACCESS_KEY_ID=${BACKUP_S3_ACCESS_KEY_ID:?BACKUP_S3_ACCESS_KEY_ID is required}
  export RCLONE_CONFIG_DEST_SECRET_ACCESS_KEY=${BACKUP_S3_SECRET_ACCESS_KEY:?BACKUP_S3_SECRET_ACCESS_KEY is required}
  export RCLONE_CONFIG_DEST_REGION=${BACKUP_S3_REGION:-auto}
  export RCLONE_CONFIG_DEST_ENDPOINT=${BACKUP_S3_ENDPOINT:-}
  export RCLONE_CONFIG_DEST_NO_CHECK_BUCKET=true
  DEST="dest:$BACKUP_S3_BUCKET/$PREFIX"
}

# Fills ENC with age's -r arguments, one pair per recipient.
ENC=()
recipients() {
  local list=() r
  ENC=()
  IFS=',' read -r -a list <<<"${BACKUP_AGE_RECIPIENTS:-}"
  for r in ${list[@]+"${list[@]}"}; do
    r=$(echo "$r" | xargs)
    [[ -n "$r" ]] && ENC+=(-r "$r")
  done
  return 0
}

# The computer archives on disk now, one name per line, sorted; half-written files left out.
object_names() {
  (cd /objects && find . -type f ! -name '*.part-*' | sed 's#^\./##' | LC_ALL=C sort)
}

# Uploads archives the bucket doesn't have yet and moves the ones gone from disk to
# objects-deleted/<today>/. $1 = tonight's manifest. Archives are encrypted one by one, so the
# disk only ever holds one extra copy.
sync_objects() {
  local manifest=$1 suffix="" key tmp have day added=0 moved=0
  [[ ${#ENC[@]} -gt 0 ]] && suffix=.age
  have=$(mktemp)
  # A listing that fails is an error: guessing "empty" would upload everything again.
  if ! rclone lsf -R --files-only "$DEST/objects" >"$have.raw" 2>"$have.err"; then
    if grep -qi 'directory not found' "$have.err"; then : >"$have.raw"; else
      cat "$have.err" >&2; rm -f "$have" "$have.raw" "$have.err"; return 1
    fi
  fi
  sed "s/${suffix//./\\.}\$//" "$have.raw" | LC_ALL=C sort >"$have"
  rm -f "$have.raw" "$have.err"
  log "computer archives: $(wc -l <"$manifest") on disk, $(wc -l <"$have") already in the bucket"
  while IFS= read -r key; do
    [[ -n "$key" ]] || continue
    if [[ -n "$suffix" ]]; then
      tmp=$(mktemp -p "$LOCAL")
      age "${ENC[@]}" -o "$tmp" "/objects/$key" || { rm -f "$tmp" "$have"; log "encrypting $key failed"; return 1; }
      rclone copyto "$tmp" "$DEST/objects/$key$suffix" || { rm -f "$tmp" "$have"; return 1; }
      rm -f "$tmp"
    else
      rclone copyto "/objects/$key" "$DEST/objects/$key" || { rm -f "$have"; return 1; }
    fi
    added=$((added + 1))
  done < <(LC_ALL=C comm -13 "$have" "$manifest")
  day=$(date -u +%Y-%m-%d)
  while IFS= read -r key; do
    [[ -n "$key" ]] || continue
    rclone moveto "$DEST/objects/$key$suffix" "$DEST/objects-deleted/$day/$key$suffix" ||
      log "could not move $key to objects-deleted (left in place)"
    moved=$((moved + 1))
  done < <(LC_ALL=C comm -23 "$have" "$manifest")
  rm -f "$have"
  log "computer archives: $added uploaded, $moved moved to objects-deleted/$day"
}

# Removes objects-deleted/<day>/ folders older than BACKUP_KEEP_DAYS (by the folder's date: a
# moved file keeps its old time, so --min-age would remove it too early).
expire_deleted_objects() {
  local cutoff d
  cutoff=$(date -u -d "@$(($(date -u +%s) - KEEP_DAYS * 86400))" +%Y-%m-%d)
  while IFS= read -r d; do
    d=${d%/}
    [[ "$d" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]] || continue
    [[ "$d" < "$cutoff" ]] && { rclone purge "$DEST/objects-deleted/$d" || log "could not remove objects-deleted/$d"; }
  done < <(rclone lsf --dirs-only "$DEST/objects-deleted" 2>/dev/null || true)
  return 0
}

# Downloads one bucket backup into $2 as a folder `casama selfhost restore` takes. With an age
# identity every file is decrypted and the computer archives are packed into objects.tar.gz;
# without one, encrypted archives are left as objects/<key>.age for you to decrypt.
fetch() {
  local stamp=${1:?usage: casama-backup fetch <timestamp> <folder> [--identity <file>]} out=${2:?folder}
  local identity="" key src f n=0
  shift 2
  [[ "${1:-}" == --identity ]] && identity=${2:?--identity needs a file}
  remote || { echo "no bucket set (BACKUP_S3_BUCKET)" >&2; return 1; }
  mkdir -p "$out"
  log "downloading $DEST/$stamp to $out"
  rclone copy "$DEST/$stamp" "$out" || return 1
  if [[ -n "$identity" ]]; then
    for f in "$out"/*.age; do
      [[ -e "$f" ]] || continue
      age -d -i "$identity" -o "${f%.age}" "$f" && rm -f "$f" || { log "could not decrypt $f"; return 1; }
    done
  fi
  [[ -f "$out/objects-manifest.txt" ]] || { log "done (this backup has no incremental computer archives)"; return 0; }
  mkdir -p "$out/objects"
  while IFS= read -r key; do
    [[ -n "$key" ]] || continue
    src=""
    for f in "$DEST/objects/$key.age" "$DEST/objects/$key"; do
      rclone lsf "$f" >/dev/null 2>&1 && { src=$f; break; }
    done
    if [[ -z "$src" ]]; then
      src=$(rclone lsf -R --files-only --include "*/$key*" "$DEST/objects-deleted" 2>/dev/null | head -1)
      [[ -n "$src" ]] && src="$DEST/objects-deleted/$src"
    fi
    [[ -n "$src" ]] || { log "missing in the bucket: $key"; return 1; }
    mkdir -p "$out/objects/$(dirname "$key")"
    if [[ "$src" == *.age && -n "$identity" ]]; then
      rclone cat "$src" | age -d -i "$identity" -o "$out/objects/$key" || { log "could not decrypt $key"; return 1; }
    else
      rclone copyto "$src" "$out/objects/$(dirname "$key")/$(basename "$src")" || return 1
    fi
    n=$((n + 1))
  done <"$out/objects-manifest.txt"
  if [[ -n "$identity" || -z "$(find "$out/objects" -name '*.age' -print -quit)" ]]; then
    tar czf "$out/objects.tar.gz" -C "$out/objects" . && rm -rf "$out/objects" || return 1
    log "done: $n computer archives packed into objects.tar.gz"
  else
    log "done: $n computer archives in $out/objects (still encrypted: decrypt each, then tar them into objects.tar.gz)"
  fi
}

ping_status() { [[ -n "${BACKUP_PING_URL:-}" ]] && curl -fsS -m 10 "$BACKUP_PING_URL$1" >/dev/null 2>&1 || true; }

run_once() {
  local stamp dir f
  stamp=$(date -u +%Y-%m-%dT%H-%M-%SZ)
  dir="$LOCAL/$stamp"
  mkdir -p "$dir"
  recipients

  log "dumping database $PGDATABASE on $PGHOST"
  pg_dump -Fc --no-owner -f "$dir/postgres.dump" "$PGDATABASE" || { rm -rf "$dir"; log "pg_dump failed"; return 1; }
  local incremental=0
  if [[ "${BACKUP_OBJECTS:-false}" == true && -d /objects ]]; then
    if remote; then
      incremental=1
    else
      log "archiving computer archives"
      tar czf "$dir/objects.tar.gz" -C /objects --exclude='*.part-*' . || { rm -rf "$dir"; log "archiving computer archives failed"; return 1; }
    fi
  fi
  # The Library's kept files (D-276) are what people made: always backed up when present.
  if [[ -d /library ]] && [[ -n "$(ls -A /library 2>/dev/null)" ]]; then
    log "archiving the Library's files"
    tar czf "$dir/library.tar.gz" -C /library . || { rm -rf "$dir"; log "archiving the Library failed"; return 1; }
  fi
  if [[ ${#ENC[@]} -gt 0 ]]; then
    [[ -f /env ]] && cp /env "$dir/env"
    [[ -f /db-config/pgsodium_root.key ]] && cp /db-config/pgsodium_root.key "$dir/vault-key"
    for f in "$dir"/*; do
      # A failed encryption stops the backup: nothing unencrypted is ever uploaded.
      if ! age "${ENC[@]}" -o "$f.age" "$f"; then
        rm -rf "$dir"
        log "encryption failed; check BACKUP_AGE_RECIPIENTS"
        return 1
      fi
      rm -f "$f"
    done
  else
    [[ -f /env ]] && log "not uploading .env: set BACKUP_AGE_RECIPIENTS to include it (encrypted)"
    [[ -f /db-config/pgsodium_root.key ]] && log "WARNING: not uploading the Vault key: without it saved secrets (model keys, app sign-ins) can't be restored on another machine. Set BACKUP_AGE_RECIPIENTS, or keep a copy of the db-config volume's pgsodium_root.key"
  fi
  if [[ "$incremental" -eq 1 ]]; then
    object_names >"$dir/objects-manifest.txt" || { rm -rf "$dir"; log "listing computer archives failed"; return 1; }
  fi
  (cd "$dir" && sha256sum -- * >SHA256SUMS) || { log "checksums failed"; return 1; }

  if remote; then
    if [[ "$incremental" -eq 1 ]]; then
      sync_objects "$dir/objects-manifest.txt" || { rm -rf "$dir"; log "uploading computer archives failed"; return 1; }
    fi
    log "uploading to $DEST/$stamp"
    rclone copy "$dir" "$DEST/$stamp" || { log "upload failed (kept locally in $dir)"; return 1; }
    log "removing backups older than $KEEP_DAYS days"
    # The archive mirror is kept by name, not age: an old archive a computer still uses stays.
    rclone delete --min-age "${KEEP_DAYS}d" --exclude '/objects/**' --exclude '/objects-deleted/**' "$DEST" ||
      log "retention cleanup failed (kept everything)"
    expire_deleted_objects
    rclone rmdirs --leave-root "$DEST" >/dev/null 2>&1 || true
    rm -rf "$dir"
  else
    log "no bucket set: kept in the local volume ($dir)"
  fi
  find "$LOCAL" -mindepth 1 -maxdepth 1 -type d -mtime "+$KEEP_DAYS" -exec rm -rf {} + 2>/dev/null || true
  date -u +%Y-%m-%dT%H:%M:%SZ >"$LOCAL/last-success"
  log "done ($stamp)"
}

seconds_until() { # HH:MM UTC
  local now target
  now=$(date -u +%s)
  target=$(date -u -d "$(date -u +%Y-%m-%d) $1" +%s)
  ((target <= now)) && target=$((target + 86400))
  echo $((target - now))
}

case "${1:-schedule}" in
  now)
    run_once || exit 1
    ;;
  fetch)
    shift
    fetch "$@" || exit 1
    ;;
  list)
    remote || { ls -1 "$LOCAL"; exit 0; }
    rclone lsf --dirs-only "$DEST"
    ;;
  schedule)
    log "daily at $BACKUP_TIME UTC; keeping $KEEP_DAYS days$([[ -n "${BACKUP_S3_BUCKET:-}" ]] && echo " in s3://$BACKUP_S3_BUCKET/$PREFIX" || echo " locally (no bucket set)")"
    while true; do
      sleep "$(seconds_until "$BACKUP_TIME")"
      if run_once; then ping_status ""; else log "backup FAILED"; ping_status "/fail"; fi
    done
    ;;
  *)
    echo "usage: casama-backup [schedule|now|list|fetch <timestamp> <folder> [--identity <file>]]" >&2
    exit 2
    ;;
esac

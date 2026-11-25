#!/usr/bin/env bash
# Runs a command inside a private, headless GNOME Shell on Wayland with a Chinese input method
# switched on, for the Linux in-app browser's input-method tests (docs/LINUX-BROWSER-PLAN.md,
# Phase L1 result). Nothing touches the real desktop: its own D-Bus, runtime folder, settings,
# keyring and input-method daemon, all stopped again when the command ends.
#
#   client/integration_test/linux/ime_session.sh <mode> -- <command...>
#
# Modes (how people on GNOME Wayland actually run each one):
#   ibus       GNOME's own way: input source ('ibus','libpinyin'); GTK talks to GNOME Shell over
#              Wayland text-input-v3, and the shell talks to ibus. Needs ibus-libpinyin.
#   ibus-gtk   the same, with GTK_IM_MODULE=ibus (GTK talks to ibus over D-Bus itself).
#   fcitx5     fcitx5 with its pinyin engine on by default, GTK_IM_MODULE=fcitx (GNOME has no
#              input-method-v2, so fcitx5's own docs use the GTK module there). fcitx5 comes from
#              the system, or from CASAMA_FCITX_ROOT: a folder with the .debs unpacked
#              (`apt-get download fcitx5 fcitx5-modules fcitx5-data libfcitx5{core7,config6,utils2,
#              gclient2} fcitx5-frontend-gtk3 fcitx5-chinese-addons-{bin,data} fcitx5-pinyin
#              fcitx5-module-{pinyinhelper,punctuation} libime{core0,pinyin0,table0} libime-data
#              libime-data-language-model libxcb-{ewmh2,imdkit1,xinerama0}` and `dpkg -x` each),
#              laid over /usr for fcitx5 with bwrap, so nothing is installed.
#
# Inside the command: WAYLAND_DISPLAY, GDK_BACKEND=wayland, the private DBUS_SESSION_BUS_ADDRESS,
# and CASAMA_WL_INPUT (wl_input.py, which types through Mutter's remote desktop interface).
# Example, from client/ with the browser switched on (scripts/app-browser-switch.sh on):
#
#   CASAMA_TEST_IME=1 integration_test/linux/ime_session.sh ibus -- \
#     flutter test integration_test/app_browser_linux_test.dart -d linux \
#       --plain-name 'on Wayland an input method'
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
mode=${1:-}
[[ "${2:-}" == "--" ]] || { sed -n '2,27p' "$0" >&2; exit 2; }
shift 2
case "$mode" in ibus|ibus-gtk|fcitx5) ;; *) echo "unknown mode: $mode" >&2; exit 2 ;; esac

# Socket paths have a 108-byte limit, so the runtime folder is short and under /run/user.
base="/run/user/$(id -u)/casama-ime-$$"
mkdir -p "$base" && chmod 700 "$base"
prof="${CASAMA_IME_PROFILE:-$base/profile}"
mkdir -p "$prof"/{config,data,cache}
pids=()
cleanup() {
  for (( i=${#pids[@]}-1; i>=0; i-- )); do kill "${pids[$i]}" 2>/dev/null || true; done
  sleep 1
  for pid in "${pids[@]}"; do kill -9 "$pid" 2>/dev/null || true; done
  rm -rf "$base"
}
trap cleanup EXIT

export XDG_RUNTIME_DIR="$base"
export XDG_CONFIG_HOME="$prof/config" XDG_DATA_HOME="$prof/data" XDG_CACHE_HOME="$prof/cache"
export DBUS_SESSION_BUS_ADDRESS="unix:path=$base/bus"
unset DISPLAY WAYLAND_DISPLAY GTK_IM_MODULE QT_IM_MODULE XMODIFIERS SESSION_MANAGER
dbus-daemon --session --address="$DBUS_SESSION_BUS_ADDRESS" --nofork --nopidfile &
pids+=($!)
for _ in $(seq 50); do [[ -S "$base/bus" ]] && break; sleep 0.1; done

printf '' | gnome-keyring-daemon --unlock --components=secrets >/dev/null 2>&1 || true
keyring=$(pgrep -u "$(id -u)" -n -x gnome-keyring-d || true)
[[ -n "$keyring" ]] && [[ "$(tr '\0' '\n' < "/proc/$keyring/environ" | grep -c "casama-ime-$$")" -gt 0 ]] &&
  pids+=("$keyring")

gsettings set org.gnome.shell welcome-dialog-last-shown-version '999'

if [[ "$mode" == fcitx5 ]]; then
  gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us')]"
else
  gsettings set org.gnome.desktop.input-sources sources "[('ibus', 'libpinyin')]"
fi

export WAYLAND_DISPLAY=wayland-casama-ime
XDG_SESSION_ID=casama-ime-none gnome-shell --headless --wayland --no-x11 --wayland-display "$WAYLAND_DISPLAY" \
  --virtual-monitor 1440x900 >"$base/shell.log" 2>&1 &
pids+=($!)
for _ in $(seq 100); do
  [[ -S "$base/$WAYLAND_DISPLAY" ]] &&
    gdbus call --session -d org.freedesktop.DBus -o /org/freedesktop/DBus \
      -m org.freedesktop.DBus.NameHasOwner org.gnome.Mutter.RemoteDesktop 2>/dev/null | grep -q true &&
    break
  sleep 0.2
done
[[ -S "$base/$WAYLAND_DISPLAY" ]] || { echo "gnome-shell didn't start:" >&2; tail -20 "$base/shell.log" >&2; exit 1; }

python3 "$here/wl_input.py" hold >"$base/hold.log" 2>&1 &
pids+=($!)
for _ in $(seq 50); do grep -q holding "$base/hold.log" 2>/dev/null && break; sleep 0.1; done

case "$mode" in
  ibus|ibus-gtk)
    # GNOME Shell starts ibus-daemon itself and switches it to the input source above.
    for _ in $(seq 100); do
      [[ "$(ibus engine 2>/dev/null)" == libpinyin ]] && break
      sleep 0.2
    done
    [[ "$(ibus engine 2>/dev/null)" == libpinyin ]] ||
      { echo "ibus isn't on libpinyin: $(ibus engine 2>&1)" >&2; exit 1; }
    [[ "$mode" == ibus-gtk ]] && export GTK_IM_MODULE=ibus
    ;;
  fcitx5)
    mkdir -p "$XDG_CONFIG_HOME/fcitx5"
    cat > "$XDG_CONFIG_HOME/fcitx5/profile" <<'EOF'
[Groups/0]
Name=Default
Default Layout=us
DefaultIM=pinyin

[Groups/0/Items/0]
Name=keyboard-us
Layout=

[Groups/0/Items/1]
Name=pinyin
Layout=

[GroupOrder]
0=Default
EOF
    printf '[Behavior]\nActiveByDefault=True\n' > "$XDG_CONFIG_HOME/fcitx5/config"
    if [[ -n "${CASAMA_FCITX_ROOT:-}" ]]; then
      root=$(cd "$CASAMA_FCITX_ROOT" && pwd)
      LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu \
        bwrap --dev-bind / / --overlay-src /usr --overlay-src "$root/usr" --ro-overlay /usr \
        fcitx5 --disable=wayland,waylandim,ibusfrontend,xim >"$base/fcitx5.log" 2>&1 &
      pids+=($!)
      lib="$root/usr/lib/x86_64-linux-gnu"
      export LD_LIBRARY_PATH="$lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
      "$(ls /usr/lib/x86_64-linux-gnu/libgtk-3-0*/gtk-query-immodules-3.0 | head -1)" \
        /usr/lib/x86_64-linux-gnu/gtk-3.0/3.0.0/immodules/*.so \
        "$lib"/gtk-3.0/3.0.0/immodules/*.so > "$base/immodules.cache"
      export GTK_IM_MODULE_FILE="$base/immodules.cache"
    else
      fcitx5 --disable=wayland,waylandim,ibusfrontend,xim >"$base/fcitx5.log" 2>&1 &
      pids+=($!)
    fi
    for _ in $(seq 100); do
      gdbus call --session -d org.freedesktop.DBus -o /org/freedesktop/DBus \
        -m org.freedesktop.DBus.NameHasOwner org.fcitx.Fcitx5 2>/dev/null | grep -q true && break
      sleep 0.2
    done
    gdbus call --session -d org.freedesktop.DBus -o /org/freedesktop/DBus \
      -m org.freedesktop.DBus.NameHasOwner org.fcitx.Fcitx5 2>/dev/null | grep -q true ||
      { echo "fcitx5 didn't start:" >&2; tail -20 "$base/fcitx5.log" >&2; exit 1; }
    export GTK_IM_MODULE=fcitx
    ;;
esac

export GDK_BACKEND=wayland CASAMA_WL_INPUT="$here/wl_input.py"
echo "ime_session: $mode ready (WAYLAND_DISPLAY=$WAYLAND_DISPLAY, logs in $base)" >&2
set +e
"$@"
status=$?
if [[ $status -ne 0 ]]; then
  echo "--- shell log" >&2; tail -15 "$base/shell.log" >&2
  [[ -f "$base/fcitx5.log" ]] && { echo "--- fcitx5 log" >&2; tail -15 "$base/fcitx5.log" >&2; }
fi
exit $status

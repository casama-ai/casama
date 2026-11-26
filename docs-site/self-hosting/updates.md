# Updates and rollback

A new self-host release comes out with Casama Cloud's server updates, so a self-hosted server can run
what Cloud runs. A release pins every image by its digest.

## In the desktop app

The app checks for a new release every day. When there is one, choose **Update**. It:

1. Backs up the server.
2. Pulls the new images.
3. Applies database migrations and starts the new version.
4. Waits for the server to report that it's healthy.

If the health check fails, the app goes back to the images you ran before.

## On a server

```sh
casama selfhost update
```

It does the same: backup, pull, migrate, start, health check, and back to the previous images if the
check fails. Your settings in `.env` and your data are kept.

If you installed by hand and don't use the CLI, back up first, then unpack the newer release over
your install folder and run `./install.sh` again. It keeps `.env`. This way doesn't go back to the
old version by itself.

Runs survive the restart. Runs waiting for an approval, a key or a takeover pick up again, and time
spent waiting doesn't count toward a run's time limit.

## After an update

- Check the server with `casama selfhost status` and the admin console.
- Computers pick up new computer images, with their files and sign-ins, the next time they sleep and
  wake or restart.

## If an update rolled back

Your server runs the previous version again. A rollback puts back the previous images, not the database: database changes the update already made stay. If the previous version doesn't start on them, restore the backup taken before the update (below). Read the logs, fix what they report, and try again:

```sh
casama selfhost logs migrate api worker
```

The backup taken before the update stays on disk. To put the data back too, see
[Restore](/self-hosting/operations#restore).

## Versions

A version looks like `2026.11.26-c20edba`: the date and the commit it was built from. `images.env`
in your install folder records the one you run, as `CASAMA_ENGINE_VERSION`. The newest release is
listed at
`https://github.com/casama-ai/casama/releases/download/selfhost-latest/manifest.json`.

## Related

- [Operations](/self-hosting/operations)
- [Licenses](/self-hosting/licenses)
- [Troubleshooting](/self-hosting/troubleshooting)

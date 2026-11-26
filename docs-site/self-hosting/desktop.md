# Install on your computer

The Casama desktop app can run a server on your own computer in one click. You don't need a
terminal. A personal license is free for one person's personal use; work use needs a
[business license](/self-hosting/licenses).

## Which apps can do this

| App | Run on this computer |
| --- | --- |
| Mac, downloaded from [casama.ai/download](https://casama.ai/download) | Yes |
| Windows desktop app | Yes |
| Linux desktop app | Yes |
| Mac App Store | No |
| iPhone, iPad, Android, web | No. They connect to your server, see [Use your server on your phone](/self-hosting/remote-access) |

## What you need

- **Docker.** Docker Desktop on a Mac or on Windows (Windows uses WSL 2), or Docker with Compose v2
  on Linux. The app helps you install it.
- **About 10 GB of free disk.** The first download is about 2.5 GB; with what it unpacks to, the images take about 10 GB. Your bots' files take more over time.
- **8 GB of memory or more.** Plan on about 2 GB for each computer that's running.
- **A Casama account**, for your free personal license.
- **A model:** your own provider key, or a model you run yourself, such as one in Ollama.

## Set it up

1. Open the app. On the sign-in screen, choose **Run on This Mac** (**Run on This Computer** on
   Windows and Linux).
2. **Docker.** The app looks for Docker. If it's missing, it points you to the installer. The setup
   continues once Docker runs.
3. **Server.** The app downloads the newest self-host release, writes the settings and new secrets,
   pulls the images and starts the server. The first start takes a few minutes.
4. **License.** Sign in with your Casama account to get your free personal license. If you have a
   business key, enter it instead.
5. **Account and model.** Create the account you use on this server, then add a model key or a local
   model address.
6. **Phone (optional).** Turn on [Casama Link](/self-hosting/remote-access) and scan the code with
   your phone.

The server listens on this computer only. If a port it needs is taken, the app picks another one.

On Linux, if Docker runs but your user may not use it, run `sudo usermod -aG docker $USER`, then log
out and back in.

## Run it from the terminal instead

The CLI installs the same release:

```sh
casama selfhost install --local
```

See [Install on a server](/self-hosting/server) for every step.

## Keep it up to date

The app checks for a new release every day. **Update** backs up, installs the new version and goes
back to the old one if the new one doesn't start properly. See
[Updates and rollback](/self-hosting/updates).

## Related

- [Self-hosting](/self-hosting/)
- [Licenses](/self-hosting/licenses)
- [Use your server on your phone](/self-hosting/remote-access)
- [What goes home](/self-hosting/what-goes-home)
- [Troubleshooting](/self-hosting/troubleshooting)

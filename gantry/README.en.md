<p align="right"><a href="README.md">Português</a> · <b>English</b></p>

<p align="center">
  <img src="imagens/icone.png" width="112" alt="Gantry icon">
</p>

<h1 align="center">Gantry</h1>

<p align="center">
  Containers, VMs and Kubernetes clusters on this machine and your servers, in one window.<br>
  Made by <a href="https://gonserviceit.com.br">GonService</a>. Free, for macOS, Windows (experimental) and Linux servers.
</p>

<p align="center"><sub>The app itself is in Portuguese.</sub></p>

## Why it exists

Infrastructure work usually means Docker Desktop (or Portainer) for
containers, Lens for clusters, a VM manager and a terminal with an SSH session
to each server. Gantry puts that in one app, with nothing installed on the
servers: it talks straight to Docker, Podman or containerd on each machine
(over SSH, for servers) and to the Kubernetes API. What you create from the
terminal shows up right away, and projects are your own `compose.yaml` files.

## Install

<!-- downloads:gantry -->
| System | Download |
|---|---|
| macOS, with Homebrew | `brew install --cask gonservice/tap/gantry` |
| macOS (Intel and Apple Silicon) | [Gantry-0.42.1-macos.zip](https://github.com/GonService/homebrew-tap/releases/download/gantry-v0.42.1/Gantry-0.42.1-macos.zip) |
| Windows (experimental) | [Gantry-0.42.1-windows.zip](https://github.com/GonService/homebrew-tap/releases/download/gantry-v0.42.1/Gantry-0.42.1-windows.zip) |
| Headless Linux server (opens in the browser) | [amd64](https://github.com/GonService/homebrew-tap/releases/download/gantry-v0.42.1/gantry-servidor-0.42.1-linux-amd64.tar.gz) · [arm64](https://github.com/GonService/homebrew-tap/releases/download/gantry-v0.42.1/gantry-servidor-0.42.1-linux-arm64.tar.gz) |

Current version: **0.42.1** · [all versions](https://github.com/GonService/homebrew-tap/releases)
<!-- /downloads:gantry -->

### macOS

With [Homebrew](https://brew.sh):

```bash
brew install --cask gonservice/tap/gantry
```

To update: `brew upgrade --cask gantry`. The app tells you in its footer when
a new version is out and shows that command. Works on Intel and Apple Silicon.

Rather not use Homebrew? Download `Gantry-X.Y.Z-macos.zip` from the
[Releases page](https://github.com/GonService/homebrew-tap/releases), unzip it
and drag **Gantry** to Applications. The first time, right-click the app →
**Open** (it isn't signed with a paid Apple certificate).

For containers, Gantry uses the Docker or Podman already on your Mac; if
there is none, it helps you install one.

### Windows (experimental)

Download `Gantry-X.Y.Z-windows.zip`, unzip it and open `Gantry.exe`. Each WSL2
distribution shows up as a machine; install Docker or Podman inside it. If
you see "Windows protected your PC", click **More info → Run anyway**.

### Headless Linux server

To keep Gantry running on a server and use it from a browser: download
`gantry-servidor-X.Y.Z-linux-<amd64|arm64>.tar.gz`, unzip it and run
`./gantry -no-browser`. It listens only on `127.0.0.1:7777` and prints a link
with an access key. From your computer, open a tunnel and use that link:

```bash
ssh -L 7777:127.0.0.1:7777 user@server
```

## What it does

- **Machines:** this computer and servers over SSH, grouped in folders, with
  hardware and CPU, memory and disk usage. Docker, Podman and containerd on the
  same machine show up together.
- **Projects (compose):** up, stop, pull images, **Rebuild** (for services with
  `build:`), edit the files in the app, a notice when files change and what
  changes in each service, backup and restore of volumes and databases, export
  and deploy to another machine.
- **Containers:** live logs with a filter, shell, files (download and upload),
  edit and recreate, live resource limits, events, CPU and memory.
- **Templates:** Postgres, Redis, RabbitMQ, Kafka, Prometheus + Grafana,
  Keycloak, n8n, Ollama and dozens more, with free ports picked for you. Your own
  projects become templates too.
- **VMs (QEMU):** VMs in the same compose as the containers, with screen,
  console, SSH, snapshots, clones and OVA/VMDK/VHD import.
- **Kubernetes clusters**, Lens-style: workloads, network, config, nodes,
  events, CRDs and Helm; pod details with containers, env vars, volumes, logs
  (including the previous run) and shell; port forwarding, scale, restart,
  roll back, drain nodes, apply YAML, CPU and memory charts. Lists sort by any
  column, and buttons follow your account's permissions.
- **Shared services, secrets in the macOS Keychain, notices of newer images,
  Prometheus alerts** and an optional agent to keep metrics while the app is
  closed.

## FAQ

### Does it install anything on my servers?

No. Gantry uses the SSH you already use and talks to Docker, Podman or
containerd there. There's an optional agent, only if you want metrics kept
while the app is closed.

### Does it work with my `~/.kube/config`?

Yes: Configuração → Clusters lists its contexts, including the ones that log
in through a plugin (EKS, GKE, AKS) or a proxy.

### macOS (or Windows) says the app can't be verified

Gantry isn't signed with a paid Apple or Microsoft certificate. Through
Homebrew you won't notice. When downloading directly:

- **Mac:** right-click Gantry → **Open** → **Open**. Only the first time. If
  the option isn't there, go to *System Settings → Privacy & Security* and click
  **Open Anyway**.
- **Windows:** **More info → Run anyway**.

### Does my data go anywhere?

No. Gantry runs on your computer and only talks to the machines and clusters
you added. The only outside request is the releases page, to tell you about a
new version.

---

<sub>© 2026 GonService. Built with Go and Wails.</sub>

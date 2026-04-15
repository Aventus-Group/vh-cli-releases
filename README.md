# VibHost CLI

Command-line client for the [VibHost](https://vibhost.com) platform. Deploy, monitor, and manage web applications — all from your terminal.

## Install

### macOS (Homebrew)

```bash
brew tap Aventus-Group/tap
brew install vh
```

### macOS / Linux (one-liner)

```bash
curl -fsSL https://raw.githubusercontent.com/Aventus-Group/vh-cli-releases/main/install.sh | sh
```

### Windows (PowerShell)

```powershell
$v = (Invoke-RestMethod "https://api.github.com/repos/Aventus-Group/vh-cli-releases/releases/latest").tag_name
Invoke-WebRequest -Uri "https://github.com/Aventus-Group/vh-cli-releases/releases/download/$v/vh-windows-amd64.zip" -OutFile vh.zip
Expand-Archive vh.zip -DestinationPath .
Move-Item vh-windows-amd64.exe C:\Windows\vh.exe
vh version
```

### Go

```bash
go install github.com/Aventus-Group/vh-cli@latest
```

### Manual download

Pre-built binaries for all platforms: **[Releases](https://github.com/Aventus-Group/vh-cli-releases/releases)**

| Platform | File |
|----------|------|
| macOS Apple Silicon (M1–M4) | `vh-darwin-arm64.tar.gz` |
| macOS Intel | `vh-darwin-amd64.tar.gz` |
| Linux x64 | `vh-linux-amd64.tar.gz` |
| Linux ARM64 (RPi 4+, Graviton) | `vh-linux-arm64.tar.gz` |
| Linux ARM (RPi 2/3) | `vh-linux-arm.tar.gz` |
| Linux 32-bit | `vh-linux-386.tar.gz` |
| Windows x64 | `vh-windows-amd64.zip` |
| Windows ARM64 | `vh-windows-arm64.zip` |
| Windows 32-bit | `vh-windows-386.zip` |
| FreeBSD x64 | `vh-freebsd-amd64.tar.gz` |

## Quick start

```bash
# Log in
vh auth login

# List your projects
vh projects list

# Deploy from GitHub
vh deploy https://github.com/your/repo

# Check deploy status
vh projects get <project-id>

# Chat with AI agent
vh chat <project-id> -m "add SSL certificate"

# View usage
vh billing usage
```

## Commands

| Command | Description |
|---------|-------------|
| `vh auth login` | Log in with email & password |
| `vh auth status` | Show current user, plan, limits |
| `vh auth logout` | Log out |
| `vh projects list` | List all projects |
| `vh projects get <id>` | Project details + deploy steps |
| `vh projects create --git <url>` | Create project from Git repo |
| `vh projects delete <id>` | Delete project |
| `vh deploy <git-url>` | Deploy + real-time progress |
| `vh deploy --watch <id>` | Watch deployment live |
| `vh deploy report <id>` | AI deployment report |
| `vh chat <id> -m "msg"` | Send message to AI agent |
| `vh chat <id> --history` | Chat history |
| `vh billing usage` | Usage (deploys, projects, limits) |
| `vh billing subscription` | Current plan |
| `vh domains add <id> <domain>` | Attach custom domain |
| `vh groups list` | List groups |

## Output formats

```bash
vh projects list                 # table (default)
vh projects list -o json         # JSON (for scripts & AI agents)
vh projects list -o quiet        # IDs only (for piping)
```

## Configuration

```bash
# Environment variables
export VH_API_URL=https://api.vibhost.com
export VH_OUTPUT_FORMAT=json

# Config file
~/.vibhost/config.yaml
```

## For AI agents

Works as a tool for Claude Code, Cursor, Copilot, and other AI coding assistants:

```bash
vh projects list --json          # structured data
vh deploy <url> --json           # deploy + stream progress
vh chat <id> -m "fix it" --json  # command AI → get response
```

## Update

```bash
# Homebrew
brew upgrade vh

# curl
curl -fsSL https://raw.githubusercontent.com/Aventus-Group/vh-cli-releases/main/install.sh | sh
```

## Uninstall

```bash
rm /usr/local/bin/vh
rm -rf ~/.vibhost/
# or: brew uninstall vh && brew untap Aventus-Group/tap
```

## License

MIT

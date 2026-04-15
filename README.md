# VibHost CLI

CLI-клиент для платформы [VibHost](https://vibhost.com). Деплой, мониторинг, AI-чат — всё из терминала.

## Установка

### macOS (Homebrew)

```bash
brew tap Aventus-Group/tap
brew install vh
```

### macOS / Linux (curl)

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

### Ручная загрузка

Бинарники для всех платформ: [Releases](https://github.com/Aventus-Group/vh-cli-releases/releases)

| Платформа | Файл |
|-----------|------|
| macOS Apple Silicon (M1/M2/M3/M4) | `vh-darwin-arm64.tar.gz` |
| macOS Intel | `vh-darwin-amd64.tar.gz` |
| Linux x64 | `vh-linux-amd64.tar.gz` |
| Linux ARM64 (RPi 4+, AWS Graviton) | `vh-linux-arm64.tar.gz` |
| Linux ARM (RPi 2/3) | `vh-linux-arm.tar.gz` |
| Linux 32-bit | `vh-linux-386.tar.gz` |
| Windows x64 | `vh-windows-amd64.zip` |
| Windows ARM64 | `vh-windows-arm64.zip` |
| Windows 32-bit | `vh-windows-386.zip` |
| FreeBSD x64 | `vh-freebsd-amd64.tar.gz` |

## Быстрый старт

```bash
# Авторизация
vh auth login

# Проекты
vh projects list

# Деплой
vh deploy https://github.com/your/repo

# AI-чат
vh chat <project-id> -m "fix nginx"

# JSON вывод (для скриптов)
vh projects list --json
```

## Обновление

```bash
# Homebrew
brew upgrade vh

# curl
curl -fsSL https://raw.githubusercontent.com/Aventus-Group/vh-cli-releases/main/install.sh | sh
```

## Удаление

```bash
rm /usr/local/bin/vh
rm -rf ~/.vibhost/
```

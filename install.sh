#!/bin/sh
# VibHost CLI installer
# Usage: curl -fsSL https://raw.githubusercontent.com/Aventus-Group/vh-cli-releases/main/install.sh | sh
set -e

REPO="Aventus-Group/vh-cli-releases"
BINARY="vh"
INSTALL_DIR="/usr/local/bin"

# Detect OS
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
case "$OS" in
  linux*)  OS="linux" ;;
  darwin*) OS="darwin" ;;
  freebsd*) OS="freebsd" ;;
  mingw*|msys*|cygwin*) OS="windows" ;;
  *) echo "Unsupported OS: $OS" && exit 1 ;;
esac

# Detect arch
ARCH=$(uname -m)
case "$ARCH" in
  x86_64|amd64) ARCH="amd64" ;;
  aarch64|arm64) ARCH="arm64" ;;
  armv7*|armv6*) ARCH="arm" ;;
  i386|i686) ARCH="386" ;;
  *) echo "Unsupported architecture: $ARCH" && exit 1 ;;
esac

# Get latest version
VERSION=$(curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest" | grep '"tag_name"' | sed -E 's/.*"v([^"]+)".*/\1/')
if [ -z "$VERSION" ]; then
  echo "Could not determine latest version"
  exit 1
fi

echo "Installing VibHost CLI v${VERSION} (${OS}/${ARCH})..."

# Download
EXT="tar.gz"
[ "$OS" = "windows" ] && EXT="zip"
URL="https://github.com/${REPO}/releases/download/v${VERSION}/vh-${OS}-${ARCH}.${EXT}"

TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Downloading ${URL}..."
curl -fsSL "$URL" -o "${TMP_DIR}/vh.${EXT}"

# Extract
cd "$TMP_DIR"
if [ "$EXT" = "zip" ]; then
  unzip -q "vh.${EXT}"
else
  tar xzf "vh.${EXT}"
fi

# Install
BIN_NAME="vh-${OS}-${ARCH}"
[ "$OS" = "windows" ] && BIN_NAME="${BIN_NAME}.exe"

if [ -w "$INSTALL_DIR" ]; then
  mv "$BIN_NAME" "${INSTALL_DIR}/${BINARY}"
else
  echo "Need sudo to install to ${INSTALL_DIR}"
  sudo mv "$BIN_NAME" "${INSTALL_DIR}/${BINARY}"
fi

chmod +x "${INSTALL_DIR}/${BINARY}"

echo ""
echo "VibHost CLI v${VERSION} installed to ${INSTALL_DIR}/${BINARY}"
echo ""
echo "Get started:"
echo "  vh auth login"
echo "  vh projects list"
echo "  vh deploy https://github.com/your/repo"

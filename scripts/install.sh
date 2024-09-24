#!/bin/bash
set -e

REPO="spetrescu/echo-cli"
OS=$(uname | tr '[:upper:]' '[:lower:]')
ARCH="amd64"
BINARY_NAME="echo-cli"

# Get the latest release version from GitHub API
VERSION=$(curl -s "https://api.github.com/repos/$REPO/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

# Detect the OS and select the appropriate binary name
if [ "$OS" = "linux" ]; then
    BINARY="${BINARY_NAME}-linux"
elif [ "$OS" = "darwin" ]; then
    BINARY="${BINARY_NAME}-macos"
else
    echo "Unsupported OS: $OS"
    exit 1
fi

# Set the download URL for the binary from the GitHub release
URL="https://github.com/$REPO/releases/download/$VERSION/$BINARY"

# Download the binary to a temporary location
TMP_DIR=$(mktemp -d)
TMP_FILE="$TMP_DIR/$BINARY"

echo "Downloading $BINARY from $URL ..."
curl -L "$URL" -o "$TMP_FILE"

# Make the binary executable
chmod +x "$TMP_FILE"

# Rename the binary to echo-cli and move it to /usr/local/bin
sudo mv "$TMP_FILE" /usr/local/bin/$BINARY_NAME

# Clean up the temp directory
rm -rf "$TMP_DIR"

echo "$BINARY_NAME installed successfully!"

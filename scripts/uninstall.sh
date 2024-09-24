#!/bin/bash
set -e

BINARY_NAME="echo-cli"
INSTALL_PATH="/usr/local/bin/$BINARY_NAME"

# Check if the binary exists in the install location
if [ -f "$INSTALL_PATH" ]; then
    echo "Uninstalling $BINARY_NAME from $INSTALL_PATH..."
    
    # Remove the binary
    sudo rm -f "$INSTALL_PATH"
    
    echo "$BINARY_NAME uninstalled successfully!"
else
    echo "$BINARY_NAME is not installed at $INSTALL_PATH"
fi

# make sure the file is executable by running chmod +x uninstall.sh
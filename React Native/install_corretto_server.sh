#!/bin/bash

# Variables
JDK_URL="https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.tar.gz"
JDK_TAR="amazon-corretto-17-x64-linux-jdk.tar.gz"

# Determine the installation directory
if [ -n "$HOME" ]; then
    # HOME is set
    JDK_DIR="$HOME/.jdks"
else
    # HOME is not set
    echo "\$HOME is not set or empty. Using /usr/local/jdks as the installation directory."
    JDK_DIR="/usr/local/jdks"
fi

# Create the installation directory
echo "Creating installation directory at $JDK_DIR..."
mkdir -p "$JDK_DIR"
if [ $? -ne 0 ]; then
    echo "Failed to create directory $JDK_DIR. Check your permissions."
    exit 1
fi

# Change to the installation directory
cd "$JDK_DIR"
if [ $? -ne 0 ]; then
    echo "Failed to change directory to $JDK_DIR"
    exit 1
fi

# Download the JDK
echo "Downloading JDK from $JDK_URL..."
curl -L -o "$JDK_TAR" "$JDK_URL"
if [ $? -ne 0 ]; then
    echo "Failed to download JDK from $JDK_URL"
    exit 1
fi

# Extract the JDK
echo "Extracting JDK..."
tar -xzf "$JDK_TAR"
if [ $? -ne 0 ]; then
    echo "Failed to extract $JDK_TAR"
    exit 1
fi

# Determine the extracted directory name
EXTRACTED_DIR=$(tar -tf "$JDK_TAR" | head -1 | cut -f1 -d"/")
if [ -z "$EXTRACTED_DIR" ]; then
    # Fallback to listing directories
    EXTRACTED_DIR=$(ls -d */ | head -1 | cut -f1 -d"/")
    if [ -z "$EXTRACTED_DIR" ]; then
        echo "Failed to determine the extracted directory"
        exit 1
    fi
fi

# Remove the tar file
rm "$JDK_TAR"
if [ $? -ne 0 ]; then
    echo "Failed to remove $JDK_TAR"
    exit 1
fi

# Set JAVA_HOME and update PATH
echo "Setting JAVA_HOME and updating PATH..."
export JAVA_HOME="$JDK_DIR/$EXTRACTED_DIR"
export PATH="$JAVA_HOME/bin:$PATH"

if [ ! -d "$JAVA_HOME" ]; then
    echo "JAVA_HOME is set to an invalid directory: $JAVA_HOME"
    exit 1
fi

# Update .bashrc for persistence if possible
if [ -n "$HOME" ] && [ -w "$HOME/.bashrc" ]; then
    echo "Updating $HOME/.bashrc for persistence..."
    {
        echo "export JAVA_HOME=$JAVA_HOME"
        echo "export PATH=\$JAVA_HOME/bin:\$PATH"
    } >> "$HOME/.bashrc"
    if [ $? -ne 0 ]; then
        echo "Failed to update $HOME/.bashrc"
        exit 1
    fi
    # Source .bashrc to apply changes immediately
    source "$HOME/.bashrc"
else
    echo "$HOME/.bashrc not found or not writable. Skipping .bashrc update."
    echo "You may need to manually set JAVA_HOME and update PATH."
fi

echo "JDK installation and setup complete."
exit 0


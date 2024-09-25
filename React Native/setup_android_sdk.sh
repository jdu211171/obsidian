#!/bin/bash

# Define variables
ANDROID_SDK_DIR="$HOME/.android_sdk"
CMDLINE_TOOLS_ZIP="commandlinetools-linux-11076708_latest.zip" # Update this with the correct filename if different
CMDLINE_TOOLS_URL="https://dl.google.com/android/repository/$CMDLINE_TOOLS_ZIP" # Update this with the correct URL if different

# Function to handle errors
handle_error() {
    echo "Error: $1"
    exit 1
}

# Create the Android SDK directory
mkdir -p "$ANDROID_SDK_DIR" || handle_error "Failed to create Android SDK directory"

# Download the command line tools if not already downloaded
if [ ! -f "$CMDLINE_TOOLS_ZIP" ]; then
    echo "Downloading command line tools..."
    wget "$CMDLINE_TOOLS_URL" || handle_error "Failed to download command line tools"
fi

# Extract the command line tools
echo "Extracting command line tools..."
unzip -o "$CMDLINE_TOOLS_ZIP" -d "$ANDROID_SDK_DIR" || handle_error "Failed to extract command line tools"

# Set environment variables in .bashrc
echo "Setting environment variables in .bashrc..."
{
    echo 'export ANDROID_SDK_ROOT="$HOME/.android_sdk"'
    echo 'export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$PATH"'
    echo 'export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"'
    echo 'export PATH="$ANDROID_SDK_ROOT/emulator:$PATH"'
} >> "$HOME/.bashrc" || handle_error "Failed to set environment variables in .bashrc"

# Reload .bashrc
echo "Reloading .bashrc..."
source "$HOME/.bashrc" || handle_error "Failed to reload .bashrc"

# Install the latest cmdline-tools
echo "Installing the latest cmdline-tools..."
"$ANDROID_SDK_ROOT/cmdline-tools/bin/sdkmanager" --sdk_root="$ANDROID_SDK_ROOT" "cmdline-tools;latest" || handle_error "Failed to install the latest cmdline-tools"

# Install platforms, build-tools, and extras
echo "Installing platforms, build-tools, and extras..."
sdkmanager "platforms;android-33" "build-tools;33.0.2" || handle_error "Failed to install platforms and build-tools"
sdkmanager "extras;google;m2repository" "extras;android;m2repository" || handle_error "Failed to install extras"
sdkmanager "platform-tools" "tools" || handle_error "Failed to install platform-tools and tools"

# Install required SDK components for Android 14 (UpsideDownCake)
echo "Installing required SDK components for Android 14 (UpsideDownCake)..."
sdkmanager "platforms;android-34" "system-images;android-34;google_apis;x86_64" "build-tools;34.0.0" || handle_error "Failed to install required SDK components for Android 14"

# Accept licenses
echo "Accepting licenses..."
yes | sdkmanager --licenses || handle_error "Failed to accept licenses"

# Create local.properties file if it doesn't exist
LOCAL_PROPERTIES_FILE="/tmp/geek/eas-build-local-nodejs/7cb06647-7c22-4889-a472-76c2cb17aca2/build/parent-notification/android/local.properties"
if [ ! -f "$LOCAL_PROPERTIES_FILE" ]; then
    echo "Creating local.properties file..."
    mkdir -p "$(dirname "$LOCAL_PROPERTIES_FILE")" || handle_error "Failed to create directories for local.properties"
    echo "sdk.dir=$ANDROID_SDK_ROOT" > "$LOCAL_PROPERTIES_FILE" || handle_error "Failed to create local.properties file"
fi

# Set correct permissions
echo "Setting correct permissions..."
chmod -R 755 "$ANDROID_SDK_DIR" || handle_error "Failed to set correct permissions"

echo "Android SDK setup is complete. Please restart your terminal or run 'source ~/.bashrc' to apply the changes."
exit 0

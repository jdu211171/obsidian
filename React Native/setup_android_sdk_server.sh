#!/bin/bash

# Function to handle errors
handle_error() {
    echo "Error: $1"
    exit 1
}

# Determine the Android SDK directory
if [ -n "$HOME" ]; then
    # HOME is set
    ANDROID_SDK_DIR="$HOME/.android_sdk"
    SHELL_PROFILE="$HOME/.bashrc"
else
    # HOME is not set
    echo "\$HOME is not set or empty. Using /usr/local/android_sdk as the installation directory."
    ANDROID_SDK_DIR="/usr/local/android_sdk"
    SHELL_PROFILE="/etc/profile"
fi

# Variables for command line tools
CMDLINE_TOOLS_ZIP="commandlinetools-linux-11076708_latest.zip"  # Update this with the correct filename if different
CMDLINE_TOOLS_URL="https://dl.google.com/android/repository/$CMDLINE_TOOLS_ZIP"  # Update this with the correct URL if different

# Function to install Android SDK
install_android_sdk() {
    # Create the Android SDK directory
    echo "Creating Android SDK directory at $ANDROID_SDK_DIR..."
    mkdir -p "$ANDROID_SDK_DIR" || handle_error "Failed to create Android SDK directory. Check your permissions."

    # Change to the Android SDK directory
    cd "$ANDROID_SDK_DIR" || handle_error "Failed to change directory to $ANDROID_SDK_DIR"

    # Download the command line tools if not already downloaded
    if [ ! -f "$CMDLINE_TOOLS_ZIP" ]; then
        echo "Downloading command line tools from $CMDLINE_TOOLS_URL..."
        wget "$CMDLINE_TOOLS_URL" || handle_error "Failed to download command line tools"
    else
        echo "Command line tools ZIP already exists. Skipping download."
    fi

    # Extract the command line tools
    echo "Extracting command line tools..."
    unzip -o "$CMDLINE_TOOLS_ZIP" || handle_error "Failed to extract command line tools"

    # Clean up the ZIP file
    echo "Removing the ZIP file..."
    rm -f "$CMDLINE_TOOLS_ZIP" || handle_error "Failed to remove $CMDLINE_TOOLS_ZIP"

    # Move the extracted cmdline-tools to the correct location
    if [ -d "cmdline-tools" ]; then
        mkdir -p cmdline-tools/latest || handle_error "Failed to create cmdline-tools/latest directory"
        mv cmdline-tools/* cmdline-tools/latest/ || handle_error "Failed to move cmdline-tools"
        rm -rf cmdline-tools  # Remove the now-empty directory
    else
        handle_error "cmdline-tools directory not found after extraction"
    fi

    # Set environment variables
    echo "Setting environment variables..."
    export ANDROID_SDK_ROOT="$ANDROID_SDK_DIR"
    export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/emulator:$PATH"

    # Update shell profile for persistence
    if [ -w "$SHELL_PROFILE" ]; then
        echo "Updating $SHELL_PROFILE for environment variable persistence..."
        {
            echo "export ANDROID_SDK_ROOT=\"$ANDROID_SDK_ROOT\""
            echo "export PATH=\"\$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:\$ANDROID_SDK_ROOT/platform-tools:\$ANDROID_SDK_ROOT/emulator:\$PATH\""
        } >> "$SHELL_PROFILE" || handle_error "Failed to update $SHELL_PROFILE"

        # Reload shell profile
        echo "Reloading $SHELL_PROFILE..."
        source "$SHELL_PROFILE" || handle_error "Failed to reload $SHELL_PROFILE"
    else
        echo "Cannot update shell profile. $SHELL_PROFILE is not writable. Please set ANDROID_SDK_ROOT and update PATH manually."
    fi

    # Install the latest cmdline-tools
    echo "Installing the latest cmdline-tools..."
    sdkmanager --sdk_root="$ANDROID_SDK_ROOT" "cmdline-tools;latest" || handle_error "Failed to install the latest cmdline-tools"

    # Install platforms, build-tools, and extras compatible with android-34
    echo "Installing platforms, build-tools, and extras..."
    sdkmanager --sdk_root="$ANDROID_SDK_ROOT" \
        "platforms;android-34" \
        "build-tools;34.0.0" \
        "extras;google;m2repository" \
        "extras;android;m2repository" \
        "platform-tools" \
        "tools" || handle_error "Failed to install platforms, build-tools, and extras"

    # Accept licenses
    echo "Accepting licenses..."
    yes | sdkmanager --sdk_root="$ANDROID_SDK_ROOT" --licenses || handle_error "Failed to accept licenses"

    # Set correct permissions
    echo "Setting correct permissions for $ANDROID_SDK_DIR..."
    chmod -R 755 "$ANDROID_SDK_DIR" || handle_error "Failed to set correct permissions"

    echo "Android SDK installation is complete."
    echo "If you couldn't update the shell profile, please set ANDROID_SDK_ROOT and update PATH manually."
    exit 0
}

# Function to uninstall Android SDK
uninstall_android_sdk() {
    # Remove the Android SDK directory
    echo "Removing Android SDK directory at $ANDROID_SDK_DIR..."
    rm -rf "$ANDROID_SDK_DIR" || handle_error "Failed to remove Android SDK directory. Check your permissions."

    # Remove environment variables from shell profile
    if [ -w "$SHELL_PROFILE" ]; then
        echo "Removing environment variables from $SHELL_PROFILE..."
        sed -i '/export ANDROID_SDK_ROOT=/d' "$SHELL_PROFILE"
        sed -i '/export PATH=.*ANDROID_SDK_ROOT/d' "$SHELL_PROFILE"
        echo "Reloading $SHELL_PROFILE..."
        source "$SHELL_PROFILE" || handle_error "Failed to reload $SHELL_PROFILE"
    else
        echo "Cannot modify $SHELL_PROFILE. Please remove ANDROID_SDK_ROOT and PATH modifications manually."
    fi

    echo "Android SDK uninstallation is complete."
    exit 0
}

# Prompt user for action
echo "Do you want to (i)nstall or (u)ninstall the Android SDK? (i/u)"
read -r ACTION

case "$ACTION" in
    i|I)
        echo "Starting installation..."
        install_android_sdk
        ;;
    u|U)
        echo "Starting uninstallation..."
        uninstall_android_sdk
        ;;
    *)
        echo "Invalid option. Please run the script again and choose 'i' to install or 'u' to uninstall."
        exit 1
        ;;
esac


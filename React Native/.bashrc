me=${BASH_SOURCE[0]//\//_}; me=${me//./_}; if [[ ${SOURCED[${me}]} == "yes" ]]; then return; else declare -A SOURCED; SOURCED[${me}]=yes; fi # Only load once

# Use global profile when available
if [ -f /usr/share/defaults/etc/profile ]; then
	. /usr/share/defaults/etc/profile
fi

export JAVA_HOME=~/.jdks/corretto-17.0.10
export PATH=$PATH:$JAVA_HOME/bin
export DOTNET_HOME=~/.dotnet
export PATH=$PATH:$DOTNET_HOME
export ANDROID_SDK_ROOT="$HOME/.android_sdk"
export ANDROID_HOME="$HOME/.android_sdk"
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$PATH"
export PATH="$ANDROID_SDK_ROOT/emulator:$PATH"
export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"

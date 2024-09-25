# Android SDK install guide

This guide was created to assist in setting up the development environment for Android mobile applications. My current environment is based on GNU/Linux, but I believe the steps described here can be adapted to your reality on other operating systems.

If you have any questions or suggestions, feel free to contact me through my GitHub ([@mesaquen](https://github.com/mesaquen)).

## Command line tools

- Go to [android sdk download page](https://developer.android.com/studio#downloads)
- Look for "Command line tools only"
- Download the commandline tools for your operating system

### Extracting and setting up the environment variables

Create a directory named `.android_sdk` and extract the command line tools you downloaded earlier:

```bash
cd ~
mkdir .android_sdk
unzip ./Downloads/commandlinetools-linux-11076708_latest.zip -d ~/.android_sdk/
```

Export the following environment variables in your .bashrc file:

```bash
echo 'export JAVA_HOME=~/.jdks/corretto-17.0.11' >> ~/.bashrc
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.bashrc
# echo 'export DOTNET_HOME=~/.dotnet' >> ~/.bashrc
# echo 'export PATH=$PATH:$DOTNET_HOME' >> ~/.bashrc
echo 'export ANDROID_SDK_ROOT="$HOME/.android_sdk"' >> ~/.bashrc
echo 'export ANDROID_HOME="$HOME/.android_sdk"' >> ~/.bashrc
echo 'export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$ANDROID_SDK_ROOT/emulator:$PATH"' >> ~/.bashrc
echo 'export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### Install the latest cmdline-tools

```bash
$ANDROID_SDK_ROOT/cmdline-tools/bin/sdkmanager \
--sdk_root=$ANDROID_SDK_ROOT "cmdline-tools;latest"
```

Once you've installed the command line tools, the sdkmanager should be able to recognize the SDK location, and you won't need to provide the sdk_root flag anymore.

### Install the platforms, build-tools and extras

```bash
sdkmanager "platforms;android-34" "build-tools;34.0.0"
sdkmanager "extras;google;m2repository" "extras;android;m2repository"
# sdkmanager "system-images;android-34;google_apis;x86_64"
sdkmanager "platform-tools" "tools"
sdkmanager --licenses
```

## Installed packages

To see a list of the installed packages, run:

```code
sdkmanager --list_installed
```

## AVD: Android Virtual Device

Before creating an AVD, you'll need to download the system images. To see a list of available images, run:

```code
sdkmanager --list | grep system-images
```

### Install the chosen system image

```code
sdkmanager "system-images;android-34;google_apis_playstore;x86_64"
```

### Creating the AVD

Create an AVD using the following command:

```code
avdmanager create avd -n device \
--device pixel -k "system-images;android-33;google_apis;x86_64"
```

To get a list of available virtual devices, run:

```code
avdmanager list avd
```

## Emulator

You can start the emulator by passing the name of the AVD with the
command:

```code
emulator @device
```

Here "device" is the name of the AVD.

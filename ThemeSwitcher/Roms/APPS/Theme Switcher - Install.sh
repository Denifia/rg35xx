#!/bin/bash

# Check if coremappings.json includes '"Skins": "/bin/sh",'
if [[ ! -n "$(busybox sed -n '/"Skins": "\/bin\/sh",/p' /mnt/mmc/CFW/config/coremapping.json)" ]]; then
  # it was missing so we add it
  # spaces are to try and keep nice json formatting
  busybox sed -i '/{/ a\        "Skins": "\/bin\/sh",' /mnt/mmc/CFW/config/coremapping.json
fi

AppsDir=$(busybox dirname "$0")
AppName="Theme Switcher"
RomsDir="$(busybox dirname $AppsDir)"
RootDir="$(busybox dirname $RomsDir)"

$AppsDir/$AppName/Skins/.utils/printstr "    Installing...    " & sleep 1

# Rename the uninstaller so it shows up in APPS
mv "$AppsDir/$AppName/.$AppName - Uninstall.sh" "$AppsDir/$AppName - Uninstall.sh"
mv "$AppsDir/$AppName/$AppName - Hide.sh" "$AppsDir/$AppName - Hide.sh"

cleanup_old_versions() {
  # cleanup from previous versions of Theme Switcher
  if [ -n "$(busybox sed -n '/"Themes": "\/bin\/sh",/p' /mnt/mmc/CFW/config/coremapping.json)" ]; then
    # it was there so we remove it
    busybox sed -i '/"Themes": "\/bin\/sh",/d' /mnt/mmc/CFW/config/coremapping.json
  fi

  if [ -d "$RootDir/Themes/.garlicos" ]; then
    ThemesDir="$RootDir/Themes"
    rm -r "$ThemesDir/.garlicos"
    rm "$ThemesDir/.README.md"
    rm "$ThemesDir/! Refresh"
    rm $ThemesDir/*.sh
    rm -r $ThemesDir/Imgs
  fi
}

cleanup_old_versions

# Make folders for everything
mkdir -p "$RootDir/Themes"
mkdir -p "$RootDir/BootLogos"
mkdir -p "$RootDir/SystemIcons"

# Copy over the Skins directory to the correct path
mkdir -p "$RomsDir/Skins"
cp -r "$AppsDir/$AppName/Skins" "$RomsDir"

# Delete this installer file
rm "$AppsDir/$AppName - Install.sh"

# Delete this apps readme
rm "$AppsDir/.$AppName.txt"

# Delete the install dir
rm -r "$AppsDir/$AppName"

# Rumble success
echo 50 > "/sys/class/power_supply/battery/moto"
busybox sleep 0.2
echo 0 > "/sys/class/power_supply/battery/moto"
busybox sleep 0.1
echo 60 > "/sys/class/power_supply/battery/moto"
busybox sleep 0.2
echo 0 > "/sys/class/power_supply/battery/moto"
busybox sleep 0.1
echo 70 > "/sys/class/power_supply/battery/moto"
busybox sleep 0.2
echo 0 > "/sys/class/power_supply/battery/moto"
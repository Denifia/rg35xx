#!/bin/bash

AppsDir=$(busybox dirname "$0")
AppName="Theme Switcher"
RomsDir="$(busybox dirname $AppsDir)"
RootDir="$(busybox dirname $RomsDir)"
SkinsDir="$RomsDir/Skins"
jq="$AppsDir/$AppName/Skins/.utils/jq"
printstr="$AppsDir/$AppName/Skins/.utils/printstr"
coremapping="/mnt/mmc/CFW/config/coremapping.json"

$printstr "    Installing...    " & sleep 1

# Check if coremappings.json includes "Skins" node
if ! $("$jq" 'has("Skins")' $coremapping) ; then
  # it was missing so we add it
  "$jq" '.Skins = "/bin/sh"' $coremapping > $coremapping.temp && mv $coremapping.temp $coremapping
fi

# Rename the uninstaller so it shows up in APPS
mv "$AppsDir/$AppName/.$AppName - Uninstall.sh" "$AppsDir/$AppName - Uninstall.sh"
mv "$AppsDir/$AppName/$AppName - Hide.sh" "$AppsDir/$AppName - Hide.sh"

cleanup_old_versions() {
  # cleanup from previous versions of Theme Switcher
  if $("$jq" 'has("Themes")' $coremapping) ; then
    # it was there so we remove it
   "$jq" 'del(.Themes)' $coremapping > $coremapping.temp && mv $coremapping.temp $coremapping
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
mkdir -p "$SkinsDir"
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
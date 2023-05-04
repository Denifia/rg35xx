#!/bin/bash

# Check if coremappings.json includes '    "Skins": "/bin/sh",'
if [ -n "$(busybox sed -n '/"Skins": "\/bin\/sh",/p' /mnt/mmc/CFW/config/coremapping.json)" ]; then
  # it was there so we remove it
  busybox sed -i '/"Skins": "\/bin\/sh",/d' /mnt/mmc/CFW/config/coremapping.json
fi

AppsDir=$(busybox dirname "$0")
AppName="Theme Switcher"
SkinsDir="$(busybox dirname $AppsDir)/Skins"

$SkinsDir/.utils/printstr "    Uninstalling...    " & sleep 1

# Delete this uninstaller file
rm "$AppsDir/$AppName - Uninstall.sh"
rm "$AppsDir/$AppName - Hide.sh"
rm "$AppsDir/$AppName - Show.sh"

# Delete files from older versions
rm "$AppsDir/$AppName - Unhide.sh"

# remove /Roms/Skins because we made it
rm -r "$SkinsDir"

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
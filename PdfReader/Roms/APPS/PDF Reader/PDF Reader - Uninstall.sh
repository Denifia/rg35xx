#!/bin/bash

# Check if coremappings.json includes '        "Read": "/bin/sh",'
if [ -n "$(busybox sed -n '/        "Read": "\/bin\/sh",/p' /mnt/mmc/CFW/config/coremapping.json)" ]; then
  # it was there so we remove it
  busybox sed -i '/        "Read": "\/bin\/sh",/d' /mnt/mmc/CFW/config/coremapping.json
fi

AppsDir=$(busybox dirname "$0")
AppName="PDF Reader"
ReadDir="$(busybox dirname $AppsDir)/Read"

$ReadDir/.utils/printstr "    Uninstalling...    " & sleep 1

# Delete this uninstaller file
rm "$AppsDir/$AppName - Uninstall.sh"

# remove /Roms/Read because we made it
rm -r "$ReadDir"

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
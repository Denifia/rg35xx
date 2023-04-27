#!/bin/bash

# Check if coremappings.json includes '        "Themes": "/bin/sh",'
if [ -n "$(busybox sed -n '/        "Themes": "\/bin\/sh",/p' /mnt/mmc/CFW/config/coremapping.json)" ]; then
  # it was there so we remove it
  busybox sed -i '/        "Themes": "\/bin\/sh",/d' /mnt/mmc/CFW/config/coremapping.json
fi

AppsDir=$(busybox dirname "$0")

# Delete this uninstaller file
rm "$AppsDir/Uninstall Theme Switcher.sh"

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
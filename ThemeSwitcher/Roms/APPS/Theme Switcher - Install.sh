#!/bin/bash

# Check if coremappings.json includes '"Themes": "/bin/sh",'
if [ ! -n "$(busybox sed -n '/        "Themes": "\/bin\/sh",/p' /mnt/mmc/CFW/config/coremapping.json)" ]; then
  # it was missing so we add it
  busybox sed -i '/{/ a\        "Themes": "\/bin\/sh",' /mnt/mmc/CFW/config/coremapping.json
fi

AppsDir=$(busybox dirname "$0")
AppName="Theme Switcher"

# todo - check if /Themes exist and if it does, rename to /Themes_backup, do the normal stuff we do, then copy all content from /Themes_backup to /Themes

# Copy over the Themes directory to the correct path
mv "$AppsDir/$AppName/Themes" "$(busybox dirname $(busybox dirname $AppsDir))"

# Rename the uninstaller so it shows up in APPS
mv "$AppsDir/$AppName/.$AppName - Uninstall.sh" "$AppsDir/$AppName - Uninstall.sh"

# Delete this installer file
rm "$AppsDir/$AppName - Install.sh"

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
#!/bin/bash

AppsDir=$(busybox dirname "$0")
AppName="Theme Switcher"
SkinsDir="$(busybox dirname $AppsDir)/Skins"

# Check if coremappings.json includes '"Skins": "/bin/sh",'
if [[ ! -n "$(busybox sed -n '/        "Skins": "\/bin\/sh",/p' /mnt/mmc/CFW/config/coremapping.json)" ]]; then
  # it was missing so we add it
  busybox sed -i '/{/ a\        "Skins": "\/bin\/sh",' /mnt/mmc/CFW/config/coremapping.json
  $SkinsDir/.utils/printstr "    Showing skins tile...    " & sleep 1
  mv "$AppsDir/$AppName - Show.sh" "$AppsDir/$AppName - Hide.sh"
else 
  # it was there so we remove it
  busybox sed -i '/        "Skins": "\/bin\/sh",/d' /mnt/mmc/CFW/config/coremapping.json
  $SkinsDir/.utils/printstr "    Hiding skins tile...    " & sleep 1
  mv "$AppsDir/$AppName - Hide.sh" "$AppsDir/$AppName - Show.sh"
fi

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
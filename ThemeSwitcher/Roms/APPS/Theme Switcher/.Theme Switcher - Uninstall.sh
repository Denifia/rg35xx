#!/bin/bash

AppsDir=$(busybox dirname "$0")
AppName="Theme Switcher"
SkinsDir="$(busybox dirname $AppsDir)/Skins"
jq="$SkinsDir/.utils/jq"
printstr="$SkinsDir/.utils/printstr"
coremapping="/mnt/mmc/CFW/config/coremapping.json"

$printstr "    Uninstalling...    " & sleep 1

# Check if coremappings.json includes "Skins" node
if $("$jq" 'has("Skins")' $coremapping) ; then
  # it was there so we remove it
  "$jq" 'del(.Skins)' $coremapping > $coremapping.temp && mv $coremapping.temp $coremapping
fi

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
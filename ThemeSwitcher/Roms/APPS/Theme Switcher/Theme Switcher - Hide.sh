#!/bin/bash

AppsDir=$(busybox dirname "$0")
AppName="Theme Switcher"
SkinsDir="$(busybox dirname $AppsDir)/Skins"
jq="$SkinsDir/.utils/jq"
printstr="$SkinsDir/.utils/printstr"
coremapping="/mnt/mmc/CFW/config/coremapping.json"

# Check if coremappings.json includes "Skins" node
if ! $("$jq" 'has("Skins")' $coremapping) ; then
  # it was missing so we add it on a new line
  "$jq" '.Skins = "/bin/sh"' $coremapping > $coremapping.temp && mv $coremapping.temp $coremapping
  $printstr "    Showing skins tile...    " & sleep 1
  mv "$AppsDir/$AppName - Show.sh" "$AppsDir/$AppName - Hide.sh"
else 
  # it was there so we remove it
  "$jq" 'del(.Skins)' $coremapping > $coremapping.temp && mv $coremapping.temp $coremapping
  $printstr "    Hiding skins tile...    " & sleep 1
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
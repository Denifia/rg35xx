#!/bin/bash

# Check if coremappings.json includes '"Read": "/bin/sh",'
if [[ ! -n "$(busybox sed -n '/        "Read": "\/bin\/sh",/p' /mnt/mmc/CFW/config/coremapping.json)" ]]; then
  # it was missing so we add it
  busybox sed -i '/{/ a\        "Read": "\/bin\/sh",' /mnt/mmc/CFW/config/coremapping.json
fi

AppsDir=$(busybox dirname "$0")
AppName="PDF Reader"
RomsDir="$(busybox dirname $AppsDir)"
RootDir="$(busybox dirname $RomsDir)"

"$AppsDir/$AppName/Read/.utils/printstr" "    Installing...    " & sleep 1

# Rename the uninstaller so it shows up in APPS
mv "$AppsDir/$AppName/$AppName - Uninstall.sh" "$AppsDir/$AppName - Uninstall.sh"

# Make folders for everything
mkdir -p "$RootDir/PDFs"
mv "$AppsDir/$AppName/Sample PDF Document.pdf" "$RootDir/PDFs/Sample PDF Document.pdf"

# Copy over the Skins directory to the correct path
mkdir -p "$RomsDir/Read"
cp -r "$AppsDir/$AppName/Read" "$RomsDir"

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
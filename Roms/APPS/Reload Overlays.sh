#!/bin/bash

TF1=/mnt/mmc
TF2=/mnt/SDCARD

setup() {
  if [ ! -n "$(busybox sed -n '/"0VERLAY": "\/bin\/sh"/p' /mnt/mmc/CFW/config/coremapping.json)" ]; then
    # coremapping.json dosen't have a mapping for 0VERLAY
    busybox sed -i '/}/ i\ /"0VERLAY": "\/bin\/sh"' /mnt/mmc/CFW/config/coremapping.json
  fi 

  if [ ! -d "$1/Roms/0VERLAY" ]; then
    mkdir "$1/Roms/0VERLAY"
    mkdir "$1/Roms/0VERLAY/overlays"
  fi
}

clear_all_overlays() {
  # Delete all the existing theme "roms"
  for existingfile in $1/Roms/0VERLAY/*; do
    if [ -f "$existingfile" ]; then
      rm "$existingfile"
    fi
  done
}

generate_overlay_sh_files() {
  # Loop through all directories in SRC
  for overlayimg in $1/Roms/0VERLAY/overlays/*; do
    
    # Check if the current directory is a directory (not a file)
    if [ -f "$overlayimg" ]; then
      
      # Get the directory name
      imgname="$(busybox basename "$overlayimg")"
      
      # Create a new file in DEST with the same name as the directory
      overlaysh="$1/Roms/0VERLAY/${imgname%.*}.sh"

      echo "#!/bin/sh" > "$overlaysh"
      echo "cp $1/Roms/0VERLAY/overlays/$imgname /mnt/mmc/CFW/skin/notification-overlay.png" >> "$overlaysh"

    fi
  done
}

rumble_success() {
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
}

rumble_fail() {
  echo 60 > "/sys/class/power_supply/battery/moto"
  busybox sleep 0.4
  echo 0 > "/sys/class/power_supply/battery/moto"
  busybox sleep 0.1
  echo 40 > "/sys/class/power_supply/battery/moto"
  busybox sleep 0.4
  echo 0 > "/sys/class/power_supply/battery/moto"
}

reload_overlays()
{
  setup $1
  clear_all_overlays $1
  generate_overlay_sh_files $1
  rumble_success
}

if [ -d "$TF1/Roms" ]; then
  reload_overlays $TF1
elif [ -d "$TF2/Roms" ]; then
  reload_overlays $TF2
else
  rumble_fail
fi

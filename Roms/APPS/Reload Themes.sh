#!/bin/bash

TF1=/mnt/mmc
TF2=/mnt/SDCARD

setup() {
  if [ ! -n "$(busybox sed -n '/"THEMES": "\/bin\/sh",/p' /mnt/mmc/CFW/config/coremapping.json)" ]; then
    # coremapping.json dosen't have a mapping for themes
    busybox sed -i '/}/ i\ /"THEMES": "\/bin\/sh",' /mnt/mmc/CFW/config/coremapping.json
  fi 

  if [ ! -d "$1/Themes" ]; then
    mkdir $1/Themes
  fi

  if [ ! -d "$1/Roms/THEMES" ]; then
    mkdir $1/Roms/THEMES
  fi
}

clear_all_themes() {
  # Delete all the existing theme "roms"
  for themefile in $1/Roms/THEMES/*; do
    if [ -f "$themefile" ]; then
      rm "$themefile"
    fi
  done
}

generate_themes() {
  # Loop through all directories in SRC
  for dir in $1/Themes/*; do
    
    # Check if the current directory is a directory (not a file)
    if [ -d "$dir" ]; then
      
      # Get the directory name
      dirname="$(busybox basename "$dir")"
      
      # Create a new file in DEST with the same name as the directory
      themesh="$1/Roms/THEMES/$dirname.sh"

      echo "#!/bin/sh" > "$themesh"
      echo "FILE=\$0" >> "$themesh"
      echo "SRC=$1/Themes" >> "$themesh"
      echo "BASE=\$(busybox basename \"\$FILE\")" >> "$themesh"
      echo "THEME=\"\${BASE%.*}\"" >> "$themesh"

      # where to copy the themes too, always on TF1
      echo "LOC=$TF1/CFW" >> "$themesh"

      for folder in skin font lang rgui
      do
          if [ -d "$dir/$folder" ]; then
              echo "cp -rv \"\$SRC/\$THEME/$folder\" \"\$LOC\"" >> "$themesh"
          fi
      done

      if [ -f "$dir/boot_logo.bmp.gz" ]; then
          echo "cp -v \"\$SRC/\$THEME/\$THEME/boot_logo.bmp.gz" "\$LOC\"" >> "$themesh"
          # todo - remount something?
      fi
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

reload_themes()
{
  setup $1
  clear_all_themes $1
  generate_themes $1
  rumble_success
}

if [ -d "$TF1/Roms" ]; then
  reload_themes $TF1
elif [ -d "$TF2/Roms" ]; then
  reload_themes $TF2
else
  rumble_fail
fi

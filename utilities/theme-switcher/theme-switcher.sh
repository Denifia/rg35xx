#!/bin/sh

# remove any path information from file name
BASE=$(busybox basename "$FILE")

# theme name is name of script, minus the .sh
THEME="${BASE%.*}"

# where to write to
LOC="/mnt/mmc/CFW"

switch_theme()
{
    cp -rv "$SRC/$THEME/skin" "$LOC"
    cp -rv "$SRC/$THEME/font" "$LOC"
    cp -rv "$SRC/$THEME/lang" "$LOC"
    cp -rv "$SRC/$THEME/rgui" "$LOC/retroarch/.retroarch/assets/rgui"
    cp -v "$SRC/$THEME/$THEME/boot_logo.bmp.gz" "$LOC"
}
#!/bin/sh

# get file name
FILE=$0

# where the themes are located
SRC="/mnt/SDCARD/Themes"

# load the common methods
source $SRC/theme-switcher.sh

# switch the theme
switch_theme

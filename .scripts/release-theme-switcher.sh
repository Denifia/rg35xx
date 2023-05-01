#!/bin/bash

# Run from the root of the repo!

find ./ThemeSwitcher/Roms/APPS -printf "%P\n" | tar -czf ThemesSwitcherVnext.tar.gz --no-recursion -C ./ThemeSwitcher/Roms/APPS -T -

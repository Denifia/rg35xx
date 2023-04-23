# Theme Switcher

## Setup

- TF1 Card
  - Edit `/CFW/config/coremapping.json` to include `"THEMES": "/bin/sh"`
- TF2 Card
  - Make a `Themes` folder in the root of the drive
  - Copy `theme-switcher.sh` into `/Themes`
  - Copy your actual themes into `/Themes`
  - Make a `THEMES` folder in the `/Roms`
  - Copy `.theme.sh` into `/Roms/THEMES`
  - For each theme, copy-paste `.theme.sh` and rename it to `the theme folder name.sh` (spaces are ok)

For similar (and more than likely better) instructions, see the [reddit post by Standard-Pepper-6510](https://www.reddit.com/r/RG35XX/comments/12v7hri/themes_switcher_for_garlicos_and_system_icons/) that made me kick off this repo.

## Example folder structure

- TF1
  - OS Partition
    - `/CFW/config/coremapping.json` includes `"THEMES": "/bin/sh"`
- TF2
  - Partition
    - /Themes/theme-switcher.sh
    - /Themes/CatOS v1.0.4
    - /Roms/THEMES/.theme.sh
    - /Roms/THEMES/CatOS v1.0.4.sh

## Credits

- Idea from a [reddit post by Standard-Pepper-6510](https://www.reddit.com/r/RG35XX/comments/12v7hri/themes_switcher_for_garlicos_and_system_icons/)
- Scripts heavily inspired by [a comment from BitingChaos](https://www.reddit.com/r/RG35XX/comments/12v7hri/comment/jhc43yk/?context=3).

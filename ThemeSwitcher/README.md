# Reload Themes

Skin your device to your liking! Mix and match themes, boot logos and system icons on the fly.

## Setup

This works for 1 or 2 SD CARD setups and edits the coremapping.json for you make it all work.

1. Copy the files into `/Roms/APPS/`
2. On your device go to Consoles > APPS (the picture of a terminal) > open "Theme Switcher - Install"
3. Copy your themes into `/Themes` (next to your `/Roms`)
4. Copy your boot logos into `/BootLogos` (next to your `/Roms`)
5. Copy your system icons into `/SystemIcons` (next to your `/Roms`)
6. Launch Consoles > Themes > `! Refresh` on your device
7. ✨ Pick the one you want to swap to ✨

## Expected structure

- Roms
  - Skins
    - all the needed scripts are automagically created here
- Themes
  - "CatOS" (example theme - spaces are fine)
    - font
    - Imgs (for previews)
    - lang
    - misc
      - boot_logo.bmp.gz (the boot logo preview is pulled out of this)
    - skin
    - rgui (for retroarch themes)
- BootLogos
  - "Black Seraph" (example boot logo)
    - misc
      - boot_logo.bmp.gz (the preview is pulled out of this)
- SystemIcons
  - "Systems White" (example system icons)
    - Imgs (for previews)
    - system

## Notes

All the Theme, Boot Logo and System Icon downloads from [rg35xx.com](https://www.rg35xx.com/en/garlicos-themes/) should work just fine.

Presence of `/Roms/Themes/{name}/misc/boot_logo.bmp.gz` will make a "{name} - boot logo" option.

Any time you add/rename/remove folders in `/Themes` or `/BootLogos` or `/SystemIcons`, you'll need to run the "! Refresh" again.

## Uninstall

To remove it, run "Theme Switcher - Uninstall" from APPS. It doesn't delete `/Themes`, `/BootLogos` or `/SystemIcons`.

## Acknowledgements

- Idea from a theme switcher mod by [u/Standard-Pepper-6510](https://www.reddit.com/r/RG35XX/comments/12v7hri/themes_switcher_for_garlicos_and_system_icons/)
- Scripts heavily inspired by [u/BitingChaos](https://www.reddit.com/r/RG35XX/comments/12v7hri/comment/jhc43yk/?context=3)
- Use of `printstr` for some visual feedback stolen from [u/adixal](https://www.reddit.com/user/adixal/)
- ChatGPT for writing some of the harder parts of the scripts 😎

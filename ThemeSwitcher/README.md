# Reload Themes

Automation to help you hot swap themes by "playing" a theme as if it was a game rom. Includes retroarch theme (but doesn't select it) ~~and boot logo~~ if they're provided in the theme.

## Setup

This works for 1 or 2 SD CARD setups and edits the coremapping.json for you make it all work.

- Copy the files into `/Roms/APPS/`
- On your device go to Consoles > APPS (the picture of a terminal) > open "Theme Switcher - Install"
- Copy your themes into `/Themes` (will be next to your `/Roms` folder)
- On your device go to Consoles > Themes > open "! check for themes"
- Open any theme you want to switch to it

Any time you add/rename/remove themes in `/Themes`, you'll need to run the "! Check for themes" again.

To remove it, run "Theme Switcher - Uninstall" from APPS. It doesn't delete the theme folders you copied into `/Themes` because you may want to keep them.

## Credits

- Idea from a [reddit post by Standard-Pepper-6510](https://www.reddit.com/r/RG35XX/comments/12v7hri/themes_switcher_for_garlicos_and_system_icons/)
- Scripts heavily inspired by [a comment from BitingChaos](https://www.reddit.com/r/RG35XX/comments/12v7hri/comment/jhc43yk/?context=3)
- ChatGPD for writing some of the harder parts of the scripts 😎

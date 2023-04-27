# Reload Themes

Automation to help you hot swap themes by "playing" a theme as if it was a game rom. Includes retroarch theme (but doesn't select it) ~~and boot logo~~ if they're provided in the theme.

## Setup

This works for 1 or 2 SD CARD setups and edits the coremapping.json for you make it all work.

- Copy the files into `/Roms/APPS/`
- On your device go to Consoles > APPS (the picture of a terminal) > open "Install Theme Switcher"
- Copy your themes into `/Themes` (will be next to your `/Roms` folder)
- On your device go to Consoles > Themes > open "! Reload Themes"
- Open any theme you want to switch to it

Any time you add/rename/remove themes in `/Themes`, you'll need to run the "! Reload Themes" again.

To remove it, run "Uninstall Theme Switcher" from APPS. It doesn't delete the `/Themes` directory because I don't know what you've copied in there and may want to keep.

## Credits

- Idea from a [reddit post by Standard-Pepper-6510](https://www.reddit.com/r/RG35XX/comments/12v7hri/themes_switcher_for_garlicos_and_system_icons/)
- Scripts heavily inspired by [a comment from BitingChaos](https://www.reddit.com/r/RG35XX/comments/12v7hri/comment/jhc43yk/?context=3)

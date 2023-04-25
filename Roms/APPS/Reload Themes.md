# Reload Themes

Automation to help you hot swap themes by "playing" a theme as if it was a game rom. Includes retroarch theme (but doesn't select it) and boot logo if they're provided in the theme.

## Setup

This works for 1 or 2 SD CARD setups and edits the coremapping.json for you make it all work.

- Next to your `Roms` folder, create a new folder called `Themes`
- Copy any theme you want into that folder
- Copy [Reload Themes.sh](Reload%20Themes.sh) into `Roms/APPS` (make the `APPS` folder if it doesn't exist)
- Boot your device, go to Consoles > APPS (the picture of a terminal) > open "Reload Themes"
  - If all went well, you should get 3 ascending vibrations
  - If it failed, you'll get 2 descending vibrations
- Go to Consoles > THEMES > open any theme you want to switch to it

Any time you add/edit/remove themes on your card, you'll need to run the "Reload Themes" app again so it can generate the necessary scripts for you.

## Credits

- Idea from a [reddit post by Standard-Pepper-6510](https://www.reddit.com/r/RG35XX/comments/12v7hri/themes_switcher_for_garlicos_and_system_icons/)
- Scripts heavily inspired by [a comment from BitingChaos](https://www.reddit.com/r/RG35XX/comments/12v7hri/comment/jhc43yk/?context=3)

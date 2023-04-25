# Reload Overlays

Automation to help you swap overlays by "playing" an overlay as if it was a game rom.

## Setup

This works for 1 or 2 SD CARD setups and edits the coremapping.json for you make it all work.

- Copy any overlay pngs you want into `Roms\0VERLAY\overlays` (make that folder if you need to)
- Copy `Reload Overlays.sh` file from this repo into `Roms/APPS` (make the `APPS` folder if it doesn't exist)
- Boot your device, go to Consoles > APPS (the picture of a terminal) > open "Reload Overlays"
  - If all went well, you should get 3 ascending vibrations
  - If it failed, you'll get 2 descending vibrations
- Go to Consoles > 0VERLAY (starting with a zero) > open any overlay you want to switch to it

Any time you add/edit/remove overlay pngs on your card, you'll need to run the "Reload Overlays" app again so it can generate the necessary scripts for you.

## Credits

- Idea from [a reddit post by SorcererLeeSupreme](https://www.reddit.com/r/RG35XX/comments/124ifth/garlicos_with_changeable_overlays/) which also has a link to some overlays you can use
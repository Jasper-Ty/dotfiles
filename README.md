# dotfiles

![screenshot](img/screenshot2.png)

## About

This holds configs for my setup. My laptop (Thinkpad X13 Gen 2a) is the source of truth. I took lots of inspiration on the scripting side from [James Shackleford's dotfiles](https://github.com/tshack/dotfiles).

## Info

- **OS:** Debian 13
- **Font**: [Mononoki](https://github.com/madmalik/mononoki) [Nerd Font](https://www.nerdfonts.com/)
- **Window Manager:** [i3](https://i3wm.org/)
- **Status Bars:** [polybar](https://github.com/polybar/polybar)
- **Terminal:** [alacritty](https://github.com/alacritty/alacritty)
- **Shell:** [fish](https://fishshell.com/)
- **Text Editor:** [Neovim](https://neovim.io/)
- **PDF Viewer:** [zathura](https://pwmt.org/projects/zathura/)
- **Browser:** [Firefox](https://www.mozilla.org/en-US/firefox/)
- **App Launcher:** [rofi](https://github.com/davatorium/rofi)
- **Color Scheme:** Tokyo Night

### Misc

I use TeX Live as my LaTeX distribution

Command Line niceties:
- **cat**: bat
- **ls**: lsd
- **top**: bottom 
- **grep**: ripgrep
- **mc**: fx

I use starship.rs as my terminal prompt.

## Notes

- lock screen blurring needs `scrot` (screenshot utility) and `convert` (imagemagick utility for blurring)

## Installation

Starting with Debian, you'll need to install
- `git`, and
- `sudo`.

Then run `./install.sh`

## Todo

- fix monitor udev rule and script
- have a special workspace for external monitor
- customize notifications

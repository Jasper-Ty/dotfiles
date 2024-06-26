e dotfiles

![screenshot](img/screenshot.png)

## About

This holds configs for my setup. My laptop (Thinkpad X13 Gen 2a) is the source of truth. I took lots of inspiration on the scripting side from [James Shackleford's dotfiles](https://github.com/tshack/dotfiles).

This is still very much a work in progress! Hope to iron this out in grad school.

This setup is partially replicated on my Desktop PC, my Raspberry Pi, and on a VPS I maintain.

## Info

- **OS:** Ubuntu 22.04 LTS
- **Window Manager:** i3
- **Status Bars:** polybar
- **Terminal:** alacritty
- **Shell:** bash
- **Text Editor:** Neovim
- **PDF Viewer:** zathura
- **Multiplexer:** Zellij
- **Browser:** Firefox
- **App Launcher:** rofi
- **Color Scheme:** Tokyo Night

### Misc

I use TeX Live 2022 as my LaTeX distribution

Command Line niceties:
- **cat**: bat
- **ls**: lsd
- **top**: bottom 
- **grep**: ripgrep
- **mc**: fx

## Notes

- set a udev rule to chgrp and chmod /sys/class/backlight/amdgpu_bl0/backlight.

## Todo

- Change i3 code to use TOML instead of YAML
- Bash alias organization
- Use associative arrays in scripts/dotfiles
- TeX Live files
- Tmux / Zellij stuff
- Bash path organization
- Use starship
- fix system tray bug, unresponsive?
- fix monitor udev rule and script
- have a special workspace for external monitor

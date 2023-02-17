#!/bin/bash

set -euo pipefail

sudo pacman -S rofi rofimoji ttf-joypixels noto-fonts noto-fonts-emoji nautilus i3status-rust wireplumber iproute2 strace xautolock i3lock feh zsh curl tmux jack2 code tigervnc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

yay -S xrdp
# yay -S git-credential-manager-core
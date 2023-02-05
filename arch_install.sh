#!/bin/bash

set -euo pipefail

sudo pacman -S rofi rofimoji ttf-joypixels noto-fonts noto-fonts-emoji nautilus i3status-rust wireplumber iproute2 strace xautolock i3lock feh zsh curl tmux
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# yay -S git-credential-manager-core
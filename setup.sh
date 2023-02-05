#!/bin/bash

set -euo pipefail

ln -fs ~/scripts/.tmux.conf ~/.tmux.conf
ln -fs ~/scripts/.zshrc ~/.zshrc

mkdir -p ~/.config
if [ -e ~/.config/i3 ]; then mv ~/.config/i3 ~/.config/i3_old; fi
ln -Tfs ~/scripts/i3config ~/.config/i3
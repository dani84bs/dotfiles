#!/bin/bash
set -euo pipefail

# Installs zsh-autosuggestions and fast-syntax-highlighting.
install_plugin() {
    local name=$1 url=$2 dest="$HOME/.zsh/plugins/$1"
    if [ ! -d "$dest" ]; then
        git clone --depth=1 "$url" "$dest"
    fi
}

install_plugin zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions
install_plugin fast-syntax-highlighting https://github.com/zdharma-continuum/fast-syntax-highlighting

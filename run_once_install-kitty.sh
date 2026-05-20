#!/bin/bash
set -euo pipefail

for brew_prefix in /opt/homebrew /usr/local /home/linuxbrew/.linuxbrew; do
    if [ -x "${brew_prefix}/bin/brew" ]; then
        eval "$("${brew_prefix}/bin/brew" shellenv)"
        break
    fi
done

if [[ "$(uname)" == "Darwin" ]]; then
    brew install --cask kitty
else
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    mkdir -p "$HOME/.local/bin" "$HOME/.local/share/applications"
    ln -sf "$HOME/.local/kitty.app/bin/kitty" "$HOME/.local/bin/kitty"
    cp "$HOME/.local/kitty.app/share/applications/kitty.desktop" "$HOME/.local/share/applications/"
    cp "$HOME/.local/kitty.app/share/applications/kitty-open.desktop" "$HOME/.local/share/applications/"
    sed -i "s|Icon=kitty|Icon=$HOME/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" "$HOME/.local/share/applications/kitty.desktop" "$HOME/.local/share/applications/kitty-open.desktop"
    sed -i "s|Exec=kitty|Exec=env LIBGL_ALWAYS_SOFTWARE=1 $HOME/.local/kitty.app/bin/kitty|g" "$HOME/.local/share/applications/kitty.desktop" "$HOME/.local/share/applications/kitty-open.desktop"
fi

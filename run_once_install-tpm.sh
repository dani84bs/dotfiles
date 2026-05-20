#!/bin/bash
set -euo pipefail

for brew_prefix in /opt/homebrew /usr/local /home/linuxbrew/.linuxbrew; do
    if [ -x "${brew_prefix}/bin/brew" ]; then
        eval "$("${brew_prefix}/bin/brew" shellenv)"
        break
    fi
done

# Installs Tmux Plugin Manager if not already present.
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone --depth=1 https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

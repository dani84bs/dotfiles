#!/bin/bash
set -euo pipefail

# macOS gets fonts via Brewfile casks; nothing to do here
if [[ "$(uname)" != "Linux" ]]; then
    exit 0
fi

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

install_nerd_font() {
    local name="$1"
    # Idempotency: skip if any TTF for this family is already present
    if ls "$FONT_DIR/${name}NerdFont-"*.ttf >/dev/null 2>&1; then
        echo "${name} Nerd Font already installed, skipping"
        return 0
    fi

    echo "Installing ${name} Nerd Font..."
    local version
    version=$(curl -fsSL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
        | grep '"tag_name"' | head -1 \
        | sed 's/.*"tag_name": "\(.*\)".*/\1/')

    curl -fL "https://github.com/ryanoasis/nerd-fonts/releases/download/${version}/${name}.tar.xz" \
        | tar -xJ -C "$FONT_DIR"
}

install_nerd_font "JetBrainsMono"
install_nerd_font "FiraCode"

fc-cache -f "$FONT_DIR"

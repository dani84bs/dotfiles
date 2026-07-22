#!/bin/bash
set -euo pipefail

for brew_prefix in /opt/homebrew /usr/local /home/linuxbrew/.linuxbrew; do
    if [ -x "${brew_prefix}/bin/brew" ]; then
        eval "$("${brew_prefix}/bin/brew" shellenv)"
        break
    fi
done

# Installs fisher and fish plugins (tide, pytest.fish).
if ! command -v fish >/dev/null 2>&1; then
    echo "fish not found; skipping plugin install" >&2
    exit 0
fi

fish -c '
    if not functions -q fisher
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
        fisher install jorgebucaran/fisher
    end
    fisher install ilancosman/tide@v6
    fisher install ddoroshev/pytest.fish
'

#!/bin/bash

if [ "$SHELL" != "$(which fish)" ]; then
  chsh -s $(which fish)
else
  echo "✅ Fish is already the default shell"
fi

if command -v fish &>/dev/null; then

  # Check fisher
  if ! fish -c "type -q fisher"; then
    echo "🐟 Fisher not found, installing..."
    fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
  fi

  echo "🔄 Updating fisher plugin..."
  fish -c "fisher update"

else
  echo "⚠️ Fish not installed"
fi

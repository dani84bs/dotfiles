#!/bin/bash
if command -v fish &>/dev/null; then

  # Check fisher
  if ! fish -c "type -q fisher"; then
    echo "🐟 Fisher not found, installing..."
    fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
    echo "🔄 Updating fisher plugin..."
    fish -c "fisher update"
  fi

else
  echo "⚠️ Fish not installed"
fi

# dotfiles

Personal dotfiles managed with [chezmoi](https://chezmoi.io).

## Requirements

- macOS or Linux
- [chezmoi](https://chezmoi.io/install/) installed

## Install

```sh
chezmoi init --apply dani84bs
```

This will:

1. Install Homebrew (if missing) and run `brew bundle`
2. Install [fisher](https://github.com/jorgebucaran/fisher) + fish plugins (tide, pytest.fish)
3. Install [TPM](https://github.com/tmux-plugins/tpm) for tmux plugins
4. Install Nerd Fonts (Linux only; macOS gets them via Homebrew casks)

## What's managed

| Config     | Tool                          |
|------------|-------------------------------|
| `fish`     | shell + tide prompt + atuin   |
| `tmux`     | multiplexer + TPM             |
| `nvim`     | editor (lazy.nvim)            |
| `kitty`    | terminal emulator             |
| `lazygit`  | git TUI                       |
| `atuin`    | shell history                 |
| `lsd`      | `ls` replacement              |

## Post-install

The install script does **not** set fish as your login shell. Do it manually:

```sh
# macOS
chsh -s $(brew --prefix)/bin/fish

# Linux
chsh -s $(which fish)
```

Then open tmux and press `prefix + I` to install TPM plugins.

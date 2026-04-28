if status is-interactive
    set fish_greeting
    zoxide init fish | source
    atuin init --disable-up-arrow fish | source

    alias ls 'lsd '
    alias vim 'nvim '
    # Handle bat/batcat naming differences across systems
    if type -q batcat
        alias cat batcat
    else if type -q bat
        alias cat bat
    end
end

fish_add_path -g ~/.local/bin

# GhosTTY shell integration
if set -q TMUX; and test "$TERM_PROGRAM" = ghostty
    set -g fish_handle_reflow 1
end

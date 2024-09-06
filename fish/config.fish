if status is-interactive
    # configure vim keybinds
    fish_vi_key_bindings
    set fish_vi_force_cursor true
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore

    # Fuzzy file finder
    register_fzf_keybinds
    set -gx FZF_DEFAULT_COMMAND 'rg --files --ignore --hidden --follow --glob "!.git/*"'
    set -gx FZF_CTRL_T_COMMAND 'rg --files --ignore --hidden --follow --glob "!.git/*"'

    # Neat and fully-fledged prompt
    starship init fish | source

    # Better CD
    zoxide init fish | source

    # Per-project envars management
    direnv hook fish | source

    # Per-project version manager
    mise activate fish | source
end

if status is-interactive
    # Vi keybinds
    fish_vi_key_bindings
    set fish_vi_force_cursor true
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore

    # Custom fish theme
    setup_theme

    # Interactive file finder
    setup_fzf

    # Neat and fully-fledged prompt
    starship init fish | source

    # Better CD
    zoxide init --cmd cd fish | source

    # Per-project version and environment manager
    mise activate fish | source
end

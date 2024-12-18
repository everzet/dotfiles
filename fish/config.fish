if status is-interactive
    # Keybinds
    setup_keybinds

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

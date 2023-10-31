function wcd
    cd (git worktree list | awk 'NR>1{print $1}' | fzf-tmux -p --reverse)
end

function nv --wraps exa --description "list directory contents"
    fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim
end

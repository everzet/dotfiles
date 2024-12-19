function ls --wraps eza --description "list directory contents"
    eza --grid --width=90 --group-directories-first --icons=always --time-style 'relative' $argv;
end

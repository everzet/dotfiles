function ls --wraps eza --description "list directory contents"
    eza --long --group-directories-first --icons=always --time-style 'relative' $argv;
end

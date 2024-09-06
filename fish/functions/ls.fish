function ls --wraps eza --description "list directory contents"
    eza --long --group-directories-first --time-style 'relative' $argv;
end

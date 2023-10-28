function ls --wraps exa --description "list directory contents"
    lsd -lSF --date relative $argv;
end

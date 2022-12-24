function take --wraps mkdir --description "create and cd into directory"
    mkdir -p $argv;
    cd $argv;
end

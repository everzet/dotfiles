function watch --description "trigger command on filesystem change"
    fswatch --one-per-batch $argv[1] | xargs -n1 -I{} $argv[2];
end

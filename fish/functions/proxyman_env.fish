function proxyman_env --description "sets envars for different tools so that Proxyman can intersept their HTTP calls"
    set -a && source ~/.proxyman/proxyman_env_automatic_setup.sh && set +a
end

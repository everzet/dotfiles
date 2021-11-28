alias l='exa -lSF'
alias ll='exa -lSFa'

alias cp='cp -v'
alias mv='mv -v'
alias ln='ln -v'
alias rm='rm -v'

alias v='vim'
alias fm='vifm'

alias tn='tmux new -s ${PWD##*/}'
alias ta='tmux at -t'
alias tls='tmux list-sessions'

alias git='hub'
alias g='git s'

alias twex='fswatch -o {lib,test} | xargs -n1 -I{} mix test --stale'

function take {
    mkdir -p $1
    cd $1
}

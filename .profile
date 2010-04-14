# aliases
alias l='ls -lh'
alias ll='ls -lha'
alias sn='screen'
alias apache2ctl='sudo /opt/local/apache2/bin/apachectl'
alias mysqld='sudo /opt/local/etc/LaunchDaemons/org.macports.mysql5/mysql5.wrapper'

# macports
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH

# defaults
export EDITOR='mate -w'
export GIT_EDITOR='mate -wl1'

# bash-completion
export USER_BASH_COMPLETION_DIR=~/.bash_completion.d
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi

# console colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export TERM=xterm-color
export LANG=ru_RU.UTF-8

set meta-flag on
set input-meta on
set output-meta on
set convert-meta off

# user prompt
PS1='\[\033[0;40;32m\u\033[0m@\033[0;40;36m\h\033[0m: \033[01;47;30m\] ❝ \w ❞ \033[0m\n⚡ '

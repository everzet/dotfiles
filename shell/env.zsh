# paths
export PATH=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin:$PATH
export PATH=/usr/local/share/flutter/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=~/src/dotfiles/scripts:$PATH
export PATH=~/.asdf/shims:$PATH
export PATH=./node_modules/.bin:$PATH
export PATH=./vendor/bin:$PATH
export PATH=./bin:$PATH

# editor
export EDITOR='vim'
export GIT_EDITOR='vim'
export SHELL='/usr/local/bin/zsh'

# term
export TERM='xterm-256color-italic'
export TERM_PROGRAM='iTerm.app'

# terminal colors
export CLICOLOR=true
export LSCOLORS='exfxcxdxbxegedabagacad'

# encoding
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!_build/" --glob "!build/"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# GPG
GPG_TTY=$(tty)

# SDKMan
source "/Users/everzet/.sdkman/bin/sdkman-init.sh"

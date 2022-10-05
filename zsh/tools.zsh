# Homebrew
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Direnv
eval "$(direnv hook zsh)"

# ASDF version manager
if [ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ]; then
  . /opt/homebrew/opt/asdf/libexec/asdf.sh
fi

# FZF autocompleter
export FZF_DEFAULT_COMMAND='rg --files --ignore --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
[ -s "${HOME}/.fzf.zsh" ] && \. "${HOME}/.fzf.zsh"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# RVM
export RVM_DIR="$HOME/.rvm"
[ -s $RVM_DIR ] && export PATH="$PATH:$RVM_DIR/bin"

# PNPM
export PNPM_HOME="$HOME/Library/pnpm"
[ -s $PNPM_HOME ] && export PATH="$PATH:$PNPM_HOME"

# Dotnet
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

# GPG
export GPG_TTY=$(tty)

# Starship prompt
eval "$(starship init zsh)"

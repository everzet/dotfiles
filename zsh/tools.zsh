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
if [ -f "${HOME}/.fzf.zsh" ]; then
   . "${HOME}/.fzf.zsh"
   export FZF_DEFAULT_COMMAND='rg --files --ignore --hidden --follow --glob "!.git/*"'
   export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
fi

# Dotnet
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

# GPG
export GPG_TTY=$(tty)

# Starship prompt
eval "$(starship init zsh)"

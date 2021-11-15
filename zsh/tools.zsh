# iTerm2 shell integration
if [ -f ~/.iterm2_shell_integration.zsh ]; then
        source ~/.iterm2_shell_integration.zsh
fi

# Homebrew
if [ -f /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ASDF version manager
if [ -f ~/.asdf/asdf.sh ]; then
        source ~/.asdf/asdf.sh
        export PATH=~/.asdf/shims:$PATH
elif [ -f /usr/local/opt/asdf/asdf.sh ]; then
        source /usr/local/opt/asdf/asdf.sh
        export PATH=~/.asdf/shims:$PATH
fi

# SDKMan version manager
if [ -f ~/.sdkman/bin/sdkman-init.sh ]; then
        source ~/.sdkman/bin/sdkman-init.sh
fi

# Flutter
if [ -f /usr/local/share/flutter/bin/flutter ]; then
        export PATH=/usr/local/share/flutter/bin:$PATH
fi

# FZF autocompleter
if [ -f ~/.fzf.zsh ]; then
        source ~/.fzf.zsh
        export FZF_DEFAULT_COMMAND='rg --files --ignore --hidden --follow --glob "!.git/*"'
        export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
fi

# Direnv
eval "$(direnv hook zsh)"

# GPG
export GPG_TTY=$(tty)

# Starship prompt
eval "$(starship init zsh)"

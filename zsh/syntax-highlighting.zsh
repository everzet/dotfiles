if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

        # Syntax highligthing
        ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

        # Aliases and functions
        ZSH_HIGHLIGHT_STYLES[alias]='fg=yellow,bold'
        ZSH_HIGHLIGHT_STYLES[function]='fg=cyan,bold'

        # Commands and builtins
        ZSH_HIGHLIGHT_STYLES[command]="fg=green"
        ZSH_HIGHLIGHT_STYLES[hashed-command]="fg=green,bold"
        ZSH_HIGHLIGHT_STYLES[builtin]="fg=green,bold"
        ZSH_HIGHLIGHT_STYLES[precommand]="fg=green,underline"
        ZSH_HIGHLIGHT_STYLES[commandseparator]="none"

        # Paths
        ZSH_HIGHLIGHT_STYLES[path]='fg=white,underline'

        # Globbing
        ZSH_HIGHLIGHT_STYLES[globbing]='fg=yellow,bold'

        # Options
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue'
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue'

        # Arguments
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=green"
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=green"
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=green"
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=green"
        ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]="fg=green"

        # Patterns
        ZSH_HIGHLIGHT_PATTERNS+=('mv *' 'fg=white,bold,bg=red')
        ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
        ZSH_HIGHLIGHT_PATTERNS+=('sudo ' 'fg=white,bold,bg=red')
fi

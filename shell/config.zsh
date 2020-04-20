# change to dirs without cd
setopt autocd
# push to home directory when no argument is given.
setopt pushd_to_home
# push the old directory onto the stack on cd.
setopt auto_pushd
# do not store duplicates in the stack.
setopt pushd_ignore_dups

# do not run all background jobs at a lower priority.
setopt NO_BG_NICE
# do not send the HUP signal to running jobs when the shell exits.
# allows background tasks to keep running when we close the shell.
setopt NO_HUP

# ensure parameter expansion, command substitution and arithmetic
# expansion are performed in prompts.
setopt PROMPT_SUBST
# do not beep on an ambiguous completion.
setopt NO_LIST_BEEP
# try to correct the spelling of commands.
setopt CORRECT
# do not exit on end-of-file.
# Require the use of exit or logout instead.
setopt IGNORE_EOF

# the cursor stays where it was and completion is done from both ends.
setopt COMPLETE_IN_WORD
# if a completion is performed with the cursor within a word, and a
# full completion is inserted, the cursor is moved to the end of the
# word. That is, the cursor is moved to the end of the word if either
# a single match is inserted or menu completion is performed.
setopt ALWAYS_TO_END
# Prevents aliases on the command line from being internally
# substituted before completion is attempted.
setopt COMPLETE_ALIASES
# treat the '#', '~' and '^' characters as part of patterns for
# filename generation, etc.
setopt EXTENDED_GLOB
# do not show the type of each file with a trailing identifying mark.
setopt NO_LIST_TYPES
# automatically list choices on an ambiguous completion.
setopt AUTO_LIST
# try to make the completion list smaller (occupying less lines) by
# printing the matches in columns with different widths.
setopt LIST_PACKED
# append a trailing '/' to all directory names resulting from
# filename generation (globbing).
setopt MARK_DIRS

# case sensitive, partial word and substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending
# zsh auto rehash commands
zstyle ':completion:*' rehash true
# case sensitive, partial word and substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# activate menu selection
zstyle ':completion:*' menu select=2
# get zsh to color the completed part of the results when using tab completion.
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=34=36"

# speed up zsh completion
zstyle ':completion:*:paths' accept-exact '*(N)'
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# completion formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'%{\e[0;33m%} %B%d%b%{\e[0m%}'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*:default' list-prompt'%S%M matches%s'
zstyle ':completion:*:prefix:*' add-space true

# history size
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# whenever the user enters a line with history expansion, don't
# execute the line directly; instead, perform history expansion and
# reload the line into the editing buffer.
setopt HIST_VERIFY

# when searching history don't display results already cycled through
# twice.
setopt HIST_FIND_NO_DUPS

# allow multiple terminal sessions to all append to one zsh command history
setopt APPEND_HISTORY
# include more information about when the command was executed, etc
setopt EXTENDED_HISTORY
# add comamnds as they are typed, don't wait until shell exit'
setopt INC_APPEND_HISTORY
# Share command history data
setopt SHARE_HISTORY

# don't record dupes in history
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST

# keybindings
bindkey '^f' forward-word
bindkey '^b' backward-word

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

# report time details of the commands that took
# longer than 5s to run
# https://nuclearsquid.com/writings/reporttime-in-zsh/
REPORTTIME=5

# CLI prompt
export PROMPT="%(?.%F{green}0.%F{red}%?)%f %B%1~%f%b%f %# "

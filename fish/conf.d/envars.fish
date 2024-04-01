# editor
set -gx SHELL "/opt/homebrew/bin/fish"
set -gx EDITOR "/opt/homebrew/bin/vim"
set -gx GIT_EDITOR "/opt/homebrew/bin/vim"

# enable terminal colors
set -gx CLICOLOR true
set -gx CLICOLOR_FORCE true

# encoding
set -gx LANG "en_GB.UTF-8"
set -gx LC_CTYPE "en_GB.UTF-8"

# asdf
set -gx ASDF_GOLANG_MOD_VERSION_ENABLED true

# zk wiki
set -gx ZK_NOTEBOOK_DIR "$HOME/Library/CloudStorage/Dropbox/Wiki"

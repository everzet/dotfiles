# This fixes /usr/bin being prepended
# to PATH when under TMUX
if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

export PATH=/usr/local/bin:$PATH
export PATH=~/.mix/escripts:$PATH
export PATH=./node_modules/.bin:$PATH
export PATH=./vendor/bin:$PATH
export PATH=./bin:$PATH
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

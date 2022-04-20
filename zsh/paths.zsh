# This fixes /usr/bin being prepended
# to PATH when under TMUX
if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

export PATH=~/Dev/bin:$PATH
export PATH=~/.mix/escripts:$PATH
export PATH=~/.dotnet/tools:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=./node_modules/.bin:$PATH
export PATH=./vendor/bin:$PATH
export PATH=./bin:$PATH

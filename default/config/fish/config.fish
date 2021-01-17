set -gx PATH /home/sgm/.pyenv/bin /usr/local/go/bin /home/sgm/.local/bin $PATH

alias k='kubectl'
alias g='git'
alias l='ls'
alias vim='nvim'

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f /usr/share/autojump/autojump.fish ] && . /usr/share/autojump/autojump.fish


# exoscale functions
[ -e "$XDG_CONFIG_HOME/fish/exo.fish" ] && source "$XDG_CONFIG_HOME/fish/exo.fish"

#
# pyenv
#
source (pyenv init - |psub)
source (pyenv virtualenv-init -|psub)

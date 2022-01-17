set -gx PATH /home/sgm/.pyenv/bin /home/sgm/go/bin /usr/local/go/bin /home/sgm/.local/bin /home/sgm/.rbenv/bin  /home/sgm/.cargo/bin $PATH $PATH
set -gx PATH /home/sgm/.pyenv/shims  home/sgm/go/bin /home/.scripts $PATH
set -x GPG_TTY (tty)

set -gx PATH $PATH $HOME/.krew/bin

set -gx PATH /home/sgm/.local/share/node-v16.13.2-linux-x64/bin $PATH


# Cargo install required
set -x CARGO_NET_GIT_FETCH_WITH_CLI true

alias k='kubectl'
alias g='git'
alias l='ls'
alias vim='nvim'
alias df='df -x squashfs -x tmpfs'

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f /usr/share/autojump/autojump.fish ] && . /usr/share/autojump/autojump.fish


# triller functions
[ -e $HOME/.config/fish/triller.fish ] && source $HOME/.config/fish/triller.fish

#
# pyenv
#
source (pyenv init - |psub)
source (pyenv virtualenv-init -|psub)

# 
# ssh-agent
#

eval (ssh-agent -c) > /dev/null
ssh-add /home/sgm/.ssh/id_hetzner &>/dev/null

#
# battery
#

alias batl=' upower -i /org/freedesktop/UPower/devices/battery_BAT0'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sgm/src/google-cloud-sdk/path.fish.inc' ]; . '/home/sgm/src/google-cloud-sdk/path.fish.inc'; end
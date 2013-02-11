#!/bin/bash 

# Installing RBENV
printf "Installing rbenv....\n"
PLUGINS="${HOME}/.rbenv/plugins"
cd $HOME &&  [[ ! -d .rbenv ]] && git clone git://github.com/sstephenson/rbenv.git .rbenv 
[[ ! -d $PLUGINS ]] && mkdir ${PLUGINS} &&  cd $PLUGINS && git clone git://github.com/sstephenson/ruby-build.git

# Configuring RBENV
printf "Updating %s\n" $HOME/.bashrc
grep -Eiq 'rbenv' $HOME/.bashrc          || sed -i -e 's/\(export PATH="\)\(.*\)/\1$HOME\/\.rbenv\/bin:\2/g' $HOME/.bashrc
grep -Eiq 'rbenv' ${HOME}/.bash_profile  || echo 'eval "$(rbenv init -)"' >> ${HOME}/.bash_profile

# Back home and LOAD
cd 
exec bash

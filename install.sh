#!/bin/sh

shellPath=$(cd "$(dirname "$0")"; pwd)
echo cd $shellPath

cp -rf $shellPath/.vim* ~/
cp -rf $shellPath/.tmux.conf ~/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
mkdir -p ~/.oh-my-zsh/plugins/incr
cp $shellPath/incr-0.2.zsh ~/.oh-my-zsh/plugins/incr/
#echo "source ~/.oh-my-zsh/plugins/incr/incr-0.2.zsh" >> ~/.zshrc

echo cp done


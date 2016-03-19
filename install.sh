#!/bin/sh

# Install git and zsh if they are not yet installed.
sudo apt-get install git zsh

# Install git prompt for zsh.
git clone https://github.com/olivierverdier/zsh-git-prompt.git .zsh/git-prompt

# Change the default shell to zsh.
echo 'Your password might be needed to change the default shell.'
chsh -s /usr/bin/zsh

# Install bundles into vim.
git clone https://github.com/gmarik/Vundle.vim.git .vim/bundle/vundle
vim +BundleInstall +qall

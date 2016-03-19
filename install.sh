#!/bin/sh

# Install packages if they are not already.
sudo apt-get install git vim zsh

# Install git prompt for zsh.
git clone https://github.com/olivierverdier/zsh-git-prompt.git .zsh/git-prompt

# Change the default shell to zsh.
echo 'Your password might be needed to change the default shell.'
chsh -s /usr/bin/zsh

# Create a directory for temporary vim files.
mkdir -p ~/.vimtemp

# Install bundles into vim.
git clone https://github.com/gmarik/Vundle.vim.git .vim/bundle/vundle
vim +BundleInstall +qall

#!/bin/sh

# Initialize and update git submodules.
git submodule update --init

# Add symbolic links.
ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/vim ~/.vim
ln -s `pwd`/zshrc ~/.zshrc
ln -s `pwd`/zsh ~/.zsh

# Change the default shell to zsh.
chsh -s /usr/bin/zsh

# Install bundles into vim.
vim +BundleInstall +qall

#!/bin/sh

# Add symbolic links.
ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/vim ~/.vim
ln -s `pwd`/zshrc ~/.zshrc
ln -s `pwd`/zsh ~/.zsh

# Change the default shell to zsh.
chsh -s /usr/bin/zsh

# Install bundles into vim.
git clone https://github.com/gmarik/Vundle.vim.git vim/bundle/vundle
vim +BundleInstall +qall

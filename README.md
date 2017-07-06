# Dot Files

This repository contains settings I commonly use for various programs.
Right now, these "various programs" include:

- git
- vim
- zsh


## Download

To download and install, run the following:

    cd ~
    git init
    git remote add origin https://github.com/rjoleary/dotfiles.git
    git pull origin master
    ./install.sh

There is a reason this is different from the typical `git clone`. It is
impossible to clone into a non-empty directory, so the above work-around is
used.


## TODO

- Better caching for git-prompt-cache or use the haskell version
- Automatic paste mode plugin for vim
- Tune the settings for c/c++ autocomplete
- "z=" autocorrect when spell check is not enabled


## License

The license is found in the `LICENSE.txt` file. The license only applies
to this repository, submodules may be under a different license.

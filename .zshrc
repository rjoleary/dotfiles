# Trap for tmux
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

# Variables
export ZSHRC="~/.zshrc"
export VIMRC="~/.vimrc"
export EDITOR="vim"

# General Options
setopt auto_cd          # if a command cannot be executed, perform cd command
setopt pushd_to_home    # pushd without arguments becomes pushd $home
#setopt vi               # use vi keymappings
setopt print_exit_value # print non-zero exit status
setopt no_beep          # disable beeping
unsetopt flow_control   # disable ^s from stopping terminal

# Git Prompt
source ~/.zsh/git-prompt/zshrc.sh
#ZSH_THEME_GIT_PROMPT_NOCACHE="Y"

# Prompt
autoload -U colors && colors
setopt prompt_subst # variable substitution in the prompt
# %B - begin bold
# %b - end bold
# %h - event number
# %n - username
# %m - machine name
# %# - prompt symbol (becomes % for non-priviledged user)
PROMPT='%B[%h] \
%{$fg[red]%}%n@%m \
%{$fg[blue]%}%.%b\
%{$reset_color%} \
%B%#%b '
RPROMPT='$(git_super_status)'

# History
export HISTSIZE=2000
export SAVEHIST=2000
export HISTFILE=$HOME/.zsh_history
setopt hist_ignore_all_dups # ignore adjacent duplicate entries
setopt hist_ignore_space    # don't save command if preceded by a space
setopt hist_reduce_blanks   # remove extra whitespace from commands saved to history file
setopt share_history        # history is shared across terminals
setopt INC_APPEND_HISTORY   # history is continously appeneded

# Completion
autoload -U compinit
compinit
setopt always_to_end  # completion moves cursor to end of word
setopt list_ambiguous # automatically show hints for ambigous completion
setopt auto_list      #
setopt list_types     # add indentifying file type marks to the suggestions
setopt auto_menu      # show a menu if tab is pressed repeatedly

# Smarter completion
setopt auto_param_keys
setopt auto_param_slash
setopt auto_remove_slash

# Expansion
setopt rm_star_wait      # using rm with a glob has a safe wait
setopt bad_pattern       # show an error if a glob is badly formed
setopt numeric_glob_sort # sort filenames containing numbers numerically
setopt rc_expand_param   # 'foo${xx}bar', where xx is 'a b c', expands to 'fooabar foobbar foocbar'

# Correction
#setopt correctall

# Grep color
#  This turns on color output for grep.
alias grep="grep --color=auto"

# Aliases
alias ls='ls --color=auto --classify' # Color is disabled when piping
alias clang++='clang++ -std=c++11 -Wall -pedantic'
alias zshrc="$EDITOR $ZSHRC && source $ZSHRC" # reloads .zshrc after editing
alias vimrc="$EDITOR $VIMRC"
alias g='git' # .gitconfig contains additional aliases
alias ws='python -m SimpleHTTPServer' # web server
alias disableautomount='gsettings set org.gnome.desktop.media-handling automount false'
alias enableautomount='gsettings set org.gnome.desktop.media-handling automount true'


# I have some private configurations I like to keep secret. ;)
if [ -n "$PRIVATE" ]; then
    if [ -e "$PRIVATE" ]; then
        source "$PRIVATE"
    else
        echo 'Error: could not source private configurations'
    fi
fi

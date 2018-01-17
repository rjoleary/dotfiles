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
setopt no_beep          # disable beeping
unsetopt flow_control   # disable ^s from stopping terminal

# Git Prompt - now done asynchronously
#ZSH_THEME_GIT_PROMPT_CACHE="Y"
#source ~/.zsh/git-prompt/zshrc.sh

# Prompt
autoload -U colors && colors
setopt prompt_subst # variable substitution in the prompt
# %B - begin bold
# %b - end bold
# %n - username
# %m - machine name
# %# - prompt symbol (becomes % for non-privileged user)
PROMPT='%B%(0?..[%?] )\
%{$fg[red]%}%n@%m \
%{$fg[blue]%}%.%b\
%{$reset_color%} \
%B%#%b '
RPROMPT_PREV=''
RPROMPT=''

mkdir -p "$TMPPREFIX"
function precmd {
    function build_rprompt {
		source ~/.zsh/git-prompt/zshrc.sh
        sleep 1
        echo -n "$(git_super_status)" > "$TMPPREFIX/rprompt.$$"
        kill -s USR2 $$
    }
    RPROMPT="*$RPROMPT_PREV"
    build_rprompt &!
}

function TRAPUSR2 {
    RPROMPT=$(cat "$TMPPREFIX/rprompt.$$")
    RPROMPT_PREV="$RPROMPT"
    zle && zle reset-prompt
}


# History
export HISTSIZE=2000
export SAVEHIST=2000
export HISTFILE=$HOME/.zsh_history
setopt hist_ignore_all_dups # ignore adjacent duplicate entries
setopt hist_ignore_space    # don't save command if preceded by a space
setopt hist_reduce_blanks   # remove extra whitespace from commands saved to history file
setopt INC_APPEND_HISTORY   # history is continuously appended

# Completion
autoload -U compinit
compinit
setopt always_to_end  # completion moves cursor to end of word
setopt list_ambiguous # automatically show hints for ambiguous completion
setopt auto_list      #
setopt list_types     # add identifying file type marks to the suggestions
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

# Graveyard
# This was over-eager in finding mistakes (ex: mv hello1.txt hello2.txt):
#setopt correctall
# This makes it difficult to access the most recently entries in the history
# when rapidly switching between terminals:
#setopt share_history        # history is shared across terminals

# Grep color
#  This turns on color output for grep.
alias grep="grep --color=auto"

# Aliases
alias ls='ls --color=auto --classify' # Color is disabled when piping
alias zshrc="$EDITOR $ZSHRC && source $ZSHRC" # reloads .zshrc after editing
alias vimrc="$EDITOR $VIMRC"
alias g='git' # .gitconfig contains additional aliases
alias ws='python -m SimpleHTTPServer' # web server
alias disableautomount='gsettings set org.gnome.desktop.media-handling automount false'
alias enableautomount='gsettings set org.gnome.desktop.media-handling automount true'

# Sudo, but keep path env variable
function sudop() {
    sudo "PATH=$PATH" sh -c "$*"
}

# I have some private configurations I like to keep secret. ;)
if [ -n "$PRIVATE" ]; then
    if [ -e "$PRIVATE" ]; then
        source "$PRIVATE"
    else
        echo 'Error: could not source private configurations'
    fi
fi

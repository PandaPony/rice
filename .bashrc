#Vi mode in Bash
set -o vi

stty -ixon

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

#Set bash historysize from 500 to:
HISTSIZE=5000
# Needed for ruby > https://wiki.archlinux.org/index.php/ruby#Setup
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
# Dynamic terminal colors https://github.com/sos4nt/dynamic-colors
export PATH="$HOME/.dynamic-colors/bin:$PATH"
source $HOME/.dynamic-colors/completions/dynamic-colors.bash

if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi

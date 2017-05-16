# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History size and behavior control
export HISTCONTROL=ignoredups:ereasedups
export HISTSIZE=10000
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# Danger, dragons and so on
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Prompt color
NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
BLUE="\[\e[1;34m\]"

if [ "$USER" = root ]; then
        PS1="$RED\h$NORMAL $BLUE\w # $NORMAL"
else
        PS1="$GREEN\u@\h$NORMAL $BLUE\w \$ $NORMAL"
fi

# Source vaariables for different shells
[ -r ~/.ownsh ] && source ~/.ownsh

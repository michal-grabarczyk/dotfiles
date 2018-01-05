#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export VISUAL="vim"

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias config='/usr/bin/git --git-dir=/home/misza/.cfg/ --work-tree=/home/misza'
alias git-branchs='/usr/bin/git branch --sort=committerdate'

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.mpd/pid ] && mpd

set -o vi

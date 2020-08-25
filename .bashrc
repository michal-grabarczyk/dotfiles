#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$PATH:/opt/idea/bin"

export VISUAL="vim"

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
LOCAL_PATH=~/.local/bin
export PATH=$LOCAL_PATH:$PATH

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias git-branchs='/usr/bin/git branch --sort=committerdate'
alias dc='docker-compose'
alias rclone-gdisk='rclone mount google-drive: ~/docs/gdrive --vfs-cache-mode writes'

# MPD daemon start (if no other user instance exists)
#[ ! -s ~/.mpd/pid ] && mpd

#for steam
export VERSION_ID=$(uname -r)

set -o vi

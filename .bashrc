#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$PATH:/opt/idea/bin:$HOME/bin:/home/michal/.local/share/gem/ruby/2.7.0/bin"

export VISUAL="vim"

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
LOCAL_PATH=~/.local/bin
export PATH=$LOCAL_PATH:$PATH

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias git-branchs='/usr/bin/git branch --sort=committerdate'
alias dc='docker-compose'
alias rclone-gdisk='rclone mount google-drive: ~/docs/gdrive --vfs-cache-mode writes'
alias grabit-sync='rsync --dry-run -Prcvh ~/docs/grabit/ILVGoV_CWScY_2/ ~/.local/share/Cryptomator/mnt/Vault'

WORK_FILE=~/.workaliases && test -f $WORK_FILE && source $WORK_FILE

# MPD daemon start (if no other user instance exists)
#[ ! -s ~/.mpd/pid ] && mpd

#for steam
export VERSION_ID=$(uname -r)

set -o vi

# get current branch in git repo
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    echo "[${BRANCH}${STAT}]"
  else
    echo ""
  fi
}

# get current status of git repo
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
}

function nonzero_return() {
  RETVAL=$?
  [ $RETVAL -ne 0 ] && echo "$RETVAL " 
}

export PS1="\[\e[31m\]\`nonzero_return\`\[\e[m\]\[\e[m\]\h\[\e[m\]:\[\e[38;5;178m\]\`parse_git_branch\`\[\e[m\]\[\e[38;5;67m\]\w\[\e[m\]\\$ "

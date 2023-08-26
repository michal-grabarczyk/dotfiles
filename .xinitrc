#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# start ssh-agent
eval $(ssh-agent)

# layout
setxkbmap -layout pl

# start locking screen
#xautolock -time 12 -locker "systemctl suspend" -detectsleep &
xidlehook --not-when-fullscreen  --not-when-audio \
  --timer 300 'slock' '' \
  --timer 1200 'systemctl suspend' '' &
# after 5 min lock, after next 10 min sleep

# pcmanfm file manager daemon
pcmanfm -d &

# disabled rxvt deamon
#urxvtd -q -o -f
# selection copying
# autocutsel -fork &
# seams not needed anymore xrandr --dpi 140 # for java older apps (before also for intellij)
exec /usr/bin/awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
#exec gnome-session
#exec dbus-launch --exit-with-session awesome

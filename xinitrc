#!/bin/sh

. "$HOME/.bash_aliases"
xrdb ~/.Xresources

export XDG_MENU_PREFIX="lxde-"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

setxkbmap -option ctrl:nocaps
if [ -s ~/.Xmodmap ]
then
    xmodmap ~/.Xmodmap
fi

if [ -e ~/.xinitrc.local ]
then
    ~/.xinitrc.local
fi

if [ -x /usr/bin/dunst ]
then
    killall notification-daemon &> /dev/null
    /usr/bin/dunst &
fi

if [ -x /usr/bin/parcellite ]
then
    /usr/bin/parcellite &
fi

if [ -x /usr/bin/nextcloud ]
then
    /usr/bin/nextcloud &
fi

if [ -x /usr/bin/urxvt ]
then
    /usr/bin/urxvt -name term-scratchpad &
fi

if [ -x /usr/bin/xautolock ]
then
    /usr/bin/xautolock -locker 'i3lock-fancy' &
fi

if [ -x /usr/bin/redshift ]
then
    /usr/bin/redshift &
fi

exec i3 --force-xinerama

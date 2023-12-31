#!/bin/bash

killall wificheck.sh &> /dev/null

if ping -w 1 archlinux.org &> /dev/null
then
  #1
  if ! updates_arch=$(checkupdates 2> /dev/null | wc -l )
  then
    updates_arch=0
  fi
  #1

  ##2
  if ! updates_aur=$(paru -Qum | wc -l)
  then
    updates_aur=0
  fi
  ##2

  ###3
  updates=$(("$updates_arch" + "$updates_aur"))
  if [ "$updates" -gt 0 ]
  then
    echo "$updates"
  else
    echo ""
  fi
  ###3
else
  echo "!!"
  ~/.scripts/wificheck.sh &> /dev/null & disown:
fi

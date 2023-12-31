#!/usr/bin/env sh

case "$(printf "  Lock  \n  Shutdown  \n  Reboot  \n  Logout  \n  Suspend  " | dmenu -h 33 -i -p '  System  ')" in
#  "  Lock  ")     i3lock -i /usr/share/backgrounds/i3lock.png;;
   "  Lock  ")     betterlockscreen --lock;;
   "  Shutdown  ") systemctl -i poweroff;;
   "  Reboot  ")   systemctl reboot;;
   "  Logout  ")   i3-msg exit;;
   "  Suspend  ")  systemctl suspend;;
   *)               exit 0
esac

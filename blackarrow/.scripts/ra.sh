#!/bin/sh

r="$(printf "\033[0;31m")"
g="$(printf "\033[0;32m")"
z="$(printf "\033[0m")"
w_bg="$(printf "\033[1;47;30m")"

printf "W schowku jest: ${w_bg}$(xclip -o -sel clip)${z} %s\n"
printf %s"Jesteś pewny że chcesz kontynuować? <${g}t${z}/${r}N${z}> "
read -r prompt

if echo "$prompt" | grep -Eiq "(t(ak)?$|y(es)?$)"
then
	rename -- '' "$(xclip -o -sel clip) - " *
  echo "${g}Gotowe${z}"
else
  echo "${r}Anulowano${z}"
  exit 0
fi

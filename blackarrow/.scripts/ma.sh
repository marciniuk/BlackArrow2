#!/bin/sh

b="$(printf "\033[1;34m")"
r="$(printf "\033[0;31m")"
g="$(printf "\033[0;32m")"
z="$(printf "\033[0m")"

printf "W środku są: \n${b}$(ls)${z} %s\n"
printf "Jesteś pewny że chcesz kontynuować? <${g}t${z}/${r}N${z}> %s"
read -r prompt

if echo "$prompt" | grep -Eiq "(t(ak)?$|y(es)?$)"
then
	for f in *; do mv "$f"/*/* "$f" 2> /dev/null; done
	if echo "$?" | grep -qn 0
	then
	  echo "${g}Gotowe${z}"
	else
		# shellcheck disable=2066
		for f in "$(pwd)"; do mv "$f"/*/* "$f" 2> /dev/null; done
    echo "${g}Gotowe${z}"
	fi
else
  echo "${r}Anulowano${z}"
  exit 0
fi

#!/usr/bin/env sh

if pgrep -x firefox
then
	case "$(printf " Yes\n No\n Chrome" | dmenu -i -p 'Do you want to open another window?')" in
		" Yes")    case "$(printf "龜 Firefox\n Firefox Incognito\n Cancel" | dmenu -i -p ' Run: ')" in
		                "龜 Firefox")          firefox;;
		                " Firefox Incognito") firefox -private-window;;
		                *)                     exit 0
		            esac;;
		" Chrome") google-chrome-stable;;
		*)          exit 0
	esac
else
	case "$(printf "龜 Firefox\n Chrome\n Firefox Incognito\n Cancel" | dmenu -i -p ' Run: ')" in
		"龜 Firefox")          firefox;;
		" Chrome")            google-chrome-stable;;
		" Firefox Incognito") firefox -private-window;;
		*)                     exit 0
	esac
fi
#!/bin/bash
console=$1

if [[ "$console" == "xbox" ]]; then
	sudo somagic-capture | mplayer -vf yadif,screenshot -demuxer rawvideo -rawvideo "pal:format=uyvy:fps=25" -aspect 4:3 -
else
	sudo -S somagic-capture --ntsc-4.43-50 --sync=1 | mplayer -ontop -xy 640 -geometry +100+100 -nocache -vf yadif,crop=708:478:4:2 -demuxer rawvideo -rawvideo "ntsc:format=uyvy:fps=30000/1001" -aspect 1.7777 -
fi



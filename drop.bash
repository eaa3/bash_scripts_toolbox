#!/bin/bash

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)" #$(basename "$0")

WORKING_DIR=`pwd`

PICK_FILE=$ROOT_DIR/.picktmp

PICKED_FILE=$(cat $PICK_FILE)

# if [ -d "$1" ]; then
# 	mv
if [[ $1 == "c" ]];
then
	if [[ -d $PICKED_FILE ]];
	then
		cp -rf $PICKED_FILE $WORKING_DIR
	else
		cp $PICKED_FILE $WORKING_DIR
	fi
else
	if [[ -d $PICKED_FILE ]];
	then
		if [[ "$OSTYPE" == "linux-gnu" ]]; then
			mv $PICKED_FILE $WORKING_DIR
		else
			mv -rf $PICKED_FILE $WORKING_DIR
		fi
	else
		mv $PICKED_FILE $WORKING_DIR
	fi
fi

rm $PICK_FILE 2> /dev/null
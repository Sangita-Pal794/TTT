#!/bin/bash -x
declare -a gameBoard
gameBoard=(- - - - - - - - -)
#toss=$(($RANDOM%2))
if [ $(($RANDOM%2)) -eq 0 ]
  then
    echo X\'s TURN
 else
	echo O\'s TURN
 fi

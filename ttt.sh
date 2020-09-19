#!/bin/bash

COL_SIZE=3
CENTER=4
BOARD_SIZE=9
WIN_SET=(012 345 678 036 147 258 048 246)

#variables
declare -a gameBoard
gameBoard=(- - - - - - - - -)
toss=$(($RANDOM%2))
winStatus=0
insertStatus=0
colCount=0

displayBoard(){
	for((cell=0;cell<$BOARD_SIZE;cell++))
	do
		if [[ $colCount -eq $COL_SIZE ]]
		then
			echo ""
			colCount=0
		fi
		echo -e "${gameBoard[$cell]}\t \c"
		((colCount++))
	done
	echo ""
}

displayBoard


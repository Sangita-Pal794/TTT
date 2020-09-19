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

winCheck(){
	for pos in ${WIN_SET[@]}
	do
		first=${pos:0:1}
		second=${pos:1:1}
		third=${pos:2:1}
		if [ ${gameBoard[$first]} != "-" ] && [ ${gameBoard[$first]} == ${gameBoard[$second]} ] && [ ${gameBoard[$second]} == ${gameBoard[$third]} ] 
		then
    		winStatus=1
		fi
	done
}

tieCheck(){
	if [[ ! ${gameBoard[@]} =~ [-] ]]
    	then
		echo -e "TIE! GAME ENDS\nEND BOARD"
        	displayBoard
        exit
    	fi
}
statusCheck(){
	winCheck
	if [[ $winStatus -eq 1 ]]
	then
		displayBoard
		echo "$1 wins"
		exit
	fi
	tieCheck
	return 1
}

play(){
	while [[ $winStatus != 1 ]]
	do
		if [[ $1 == $PLAYER ]]
		then
			playerPlay
			compPlay
		else
			compPlay
			playerPlay
		fi
	done
}
read -p "ENTER PLAYER NAME " PLAYER
startGame(){
	if [[ $toss -eq 0 ]]
	then
		echo -e "$PLAYER's turn"
		read -p "WHICH WOULD YOU LIKE TO CHOOSE (X/O)? " playerChoice
		displayBoard
		[ $playerChoice == "X" ] && compChoice="O" || compChoice="X"
		play $PLAYER
	else
		compChoice="X"
		playerChoice="O"
		play
	fi
}

startGame


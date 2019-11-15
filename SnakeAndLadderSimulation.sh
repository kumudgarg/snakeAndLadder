#!/bin/bash -x
PLAYER=1
position=0
WINNING_POSITION=100
DEFAULT_POSITION=0
SNAKE=2
LADDER=1
NO_PLAY=0
function playGame()
{ 
	

	while [ $position -lt $WINNING_POSITION ]
	do
		dice=$(( RANDOM%6 + 1 ))
		checkOptions=$(( RANDOM%3 ))
		case $checkOptions in
		$SNAKE)
			position=$(( position - dice ));;
		$LADDER)
			position=$(( position + dice ));;
		$NO_PLAY)
			position=$position;;
		esac
			reachToWinningPosition
	done
}
function reachToWinningPosition()
{
	if [ $position -lt $DEFAULT_POSITION ]
   	then
		position=$DEFAULT_POSITION
	elif [ $position -gt $WINNING_POSITION ]
        then
                 position=$(( position - dice ))

	else
		echo "be continued"
	fi
}

playGame
echo "welcome to snake and Ladder"
echo $player $position
echo $dice
echo $position


#!/bin/bash -x

#<-----Constants-------------->
PLAYER=1
WINNING_POSITION=100
DEFAULT_POSITION=0
SNAKE=2
LADDER=1
NO_PLAY=0
#<-----Global variables-------->
position=0
count=0
counter=0
playerPosition1=0
playerPosition2=0
declare -A playerResultInfo
function playGame()
{ 
	
	while [ $position -lt $WINNING_POSITION ]
	do
		dice
		case $checkOptions in
		$SNAKE)
			position=$(( position - dice ));;
		$LADDER)
			position=$(( position + dice ));;
		$NO_PLAY)
			position=$position;;
		esac
			swichPlayer
			reachToWinningPosition
			wonPlayer
	done
}
function reachToWinningPosition()
{
	playerResultInfo[$count]=$position
	count=$(( count+1 ))
	if [ $position -lt $DEFAULT_POSITION ]
	then
		position=$DEFAULT_POSITION
	elif [ $position -gt $WINNING_POSITION ]
   then
      position=$(( position - dice ))
	fi
}
function dice()
{
	dice=$(( RANDOM%6 + 1 ))
   checkOptions=$(( RANDOM%3 ))
}
function wonPlayer()
{
	if [ $playerPosition1 -eq $WINNING_POSITION ]
	then
		echo "player 1 win "
	elif [ $playerPosition2 -eq $WINNING_POSITION ]
	then
		echo "player 2 win "
	fi
}
function swichPlayer()
{
  	if [ $(( counter%2 )) -eq 0 ]
	then
		playerPosition1=$position
	else
		playerPosition2=$position
	fi 
		counter=$(( counter + 1 ))
}
playGame
echo "welcome to snake and Ladder"
echo "to won the game dice was rolled $count times "
echo "position occupied by the players are ${playerResultInfo[@]}"

#!/bin/bash -x

#<-----Constants-------------->
PLAYER=1
WINNING_POSITION=100
DEFAULT_POSITION=0
SNAKE=2
LADDER=1
NO_PLAY=0
#<-----Global variables-------->
playersPosition=0
positionCount=0
playersTurn=0
declare -A playerResultInfo
function playingGame()
{ 
	
	while [ $playersPosition -lt $WINNING_POSITION ]
	do
		rollDice
		case $checkOptions in
		$SNAKE)
			playersPosition=$(( playersPosition - dice ));;
		$LADDER)
			playersPosition=$(( playersPosition + dice ));;
		$NO_PLAY)
			playersPosition=$playersPosition;;
		esac
			switchPlayer
			reachToWinningPosition
			wonPlayer
	done
}
function reachToWinningPosition()
{
	if [ $playersPosition -lt $DEFAULT_POSITION ]
	then
		playersPosition=$DEFAULT_POSITION
	elif [ $playersPosition -gt $WINNING_POSITION ]
	then
		playersPosition=$(( playersPosition - dice ))
	fi
	playerResultInfo[$positionCount]=$playersPosition
  	positionCount=$(( positionCount+1 ))

}
function rollDice()
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
function switchPlayer()
{
  	if [ $(( playersTurn%2 )) -eq 0 ]
	then
		playerPosition1=$playersPosition
	else
		playerPosition2=$playersPosition
	fi 
		playersTurn=$(( playersTurn + 1 ))
}
playingGame
echo "welcome to snake and Ladder"
echo "to won the game dice was rolled $positionCount times "
echo "position occupied by the players are ${playerResultInfo[@]}"

#!/bin/bash -x
PLAYER=1
position=0
WINNING_POSITION=100
DEFAULT_POSITION=0
SNAKE=2
LADDER=1
NO_PLAY=0
count=0
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
			reachToWinningPosition
	done
}
function reachToWinningPosition()
{
	playerResultInfo[$count]=$position
        count=$(( $count + 1 ))
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
function dice()
{
	 dice=$(( RANDOM%6 + 1 ))
         checkOptions=$(( RANDOM%3 ))
}
playGame
echo "welcome to snake and Ladder"
echo $player $position
echo $dice
echo $position
echo ${playerResultInfo[@]}
echo "to won the game dice was rolled ${#playerResultInfo[@]} times "
 

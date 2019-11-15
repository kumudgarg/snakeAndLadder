#!/bin/bash -x
player=1
position=0
snake=1
ladder=0
noPlay=2
dice=$(( RANDOM%6 + 1 ))
checkOptions=$(( RANDOM%3 ))
function playGame()
{
	case $checkOptions in
	$sanke)
		position=$(( $position - $dice ));;
	$ladder)
		position=$(( $position + $dice ));;
	$noplay)
		position=$position;;
	esac
}
playGame
echo "welcome to snake and Ladder"
echo $player $position
echo $dice
echo $position


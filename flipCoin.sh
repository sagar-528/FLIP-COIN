#!/bin/bash -x

#->Author: Sagar Gupta 
#->Date: Mar 2020 

#Constants
HEADS=0
TAILS=1

declare -A Coin

Coin=([H]=0 [T]=0)		#Declare Dictionary.

#Times of Fliping for singlet combination
read -p "How many times you want to flip the coin = " noTimeFlip

for ((flipcount=1; flipcount<=noTimeFlip; flipcount++))
do
	case $((RANDOM%2)) in
		0)
		  Coin[H]=$((${Coin[H]}+1)) ;;
		1)
		  Coin[T]=$((${Coin[T]}+1)) ;;
	esac
done

#Printing the singlet combination
for key in "${!Coin[@]}"
do
	echo "${key} = ${Coin[$key]}"
done

#Percentage of singlet combination
Percentage=`echo " scale=4 ; (${Coin[H]}*100)/$noTimeFlip" | bc -l`
echo "The percentage of head occurance is :" $Percentage


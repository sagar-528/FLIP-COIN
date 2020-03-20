#!/bin/bash -x

#->Author: Sagar Gupta 
#->Date: Mar 2020 

#Constants
HEADS=0
TAILS=1

declare -A Coin

Coin=([HH]=0 [HT]=0 [TH]=0 [TT]=0)		#Declare Dictionary.

function Singlet(){
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
}

function doublet(){
#Doublet Combination as well as percentage
#Times of Fliping for dobulet combination
read -p "How many times you want to flip the coin = " noTimeFlip2

for ((flipcount=1; flipcount<=noTimeFlip2; flipcount++))
do
   case $((RANDOM%4)) in
	0)
	  Coin[HH]=$((${Coin[HH]}+1)) ;;
	1)
	  Coin[HT]=$((${Coin[HT]}+1)) ;;
	2)
	  Coin[TH]=$((${Coin[TH]}+1)) ;;
	3)
	  Coin[TT]=$((${Coin[TT]}+1)) ;;
   esac
done

#Printing the doublet combination
for key in "${!Coin[@]}"
do
   echo "${key} = ${Coin[$key]}"
done

#Percentage of doublet combination
HHPercentage=`echo " scale=4 ; (${Coin[HH]}*100)/$noTimeFlip2" | bc -l`
THPercentage=`echo " scale=4 ; (${Coin[TH]}*100)/$noTimeFlip2" | bc -l`
HTPercentage=`echo " scale=4 ; (${Coin[HT]}*100)/$noTimeFlip2" | bc -l`
TTPercentage=`echo " scale=4 ; (${Coin[TT]}*100)/$noTimeFlip2" | bc -l`


echo "The percentage of HH occurance is :" $HHPercentage
echo "The percentage of TH occurance is :" $THPercentage
echo "The percentage of HT occurance is :" $HTPercentage
echo "The percentage of TT occurance is :" $TTPercentage
}

doublet

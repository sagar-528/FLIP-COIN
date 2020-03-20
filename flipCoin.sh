#!/bin/bash -x

#->Author: Sagar Gupta 
#->Date: Mar 2020 

#Constants
HEADS=0
TAILS=1

declare -A Coin

Coin=([TTT]=0 [HTT]=0 [THH]=0 [THT]=0 [HTH]=0 [TTH]=0 [HHT]=0 [HHH]=0)		#Declare Dictionary.

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

function Doublet(){
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

function Triplet(){

#Times of Fliping for triplet combination
read -p "How many times you want to flip the coin = " noTimeFlip3

for ((flipcount=1; flipcount<=noTimeFlip3; flipcount++))
do
   case $((RANDOM%8)) in
        0)
	  Coin[TTT]=$((${Coin[TTT]}+1)) ;;
        1)
	  Coin[HTT]=$((${Coin[HTT]}+1)) ;;
	2)
	  Coin[THH]=$((${Coin[THH]}+1)) ;;
	3)
	  Coin[THT]=$((${Coin[THT]}+1)) ;;
	4)
	  Coin[HTH]=$((${Coin[HTH]}+1)) ;;
	5)
	  Coin[TTH]=$((${Coin[TTH]}+1)) ;;
	6)
	  Coin[HHT]=$((${Coin[HHT]}+1)) ;;
	7)
	  Coin[HHH]=$((${Coin[HHH]}+1)) ;;
   esac
done

#Printing the triolet combination
for key in "${!Coin[@]}"
do
   echo "${key} = ${Coin[$key]}"
done

#Percentage of triplet combination
TTTPercentage=`echo " scale=4 ; (${Coin[TTT]}*100)/$noTimeFlip3" | bc -l`
HTTPercentage=`echo " scale=4 ; (${Coin[HTT]}*100)/$noTimeFlip3" | bc -l`
THHPercentage=`echo " scale=4 ; (${Coin[THH]}*100)/$noTimeFlip3" | bc -l`
THTPercentage=`echo " scale=4 ; (${Coin[THT]}*100)/$noTimeFlip3" | bc -l`
HTHPercentage=`echo " scale=4 ; (${Coin[HTH]}*100)/$noTimeFlip3" | bc -l`
TTHPercentage=`echo " scale=4 ; (${Coin[TTH]}*100)/$noTimeFlip3" | bc -l`
HHTPercentage=`echo " scale=4 ; (${Coin[HHT]}*100)/$noTimeFlip3" | bc -l`
HHHPercentage=`echo " scale=4 ; (${Coin[HHH]}*100)/$noTimeFlip3" | bc -l`

echo "The percentage of TTT occurance is :" $TTTPercentage
echo "The percentage of HTT occurance is :" $HTTPercentage
echo "The percentage of THH occurance is :" $THHPercentage
echo "The percentage of THT occurance is :" $THTPercentage
echo "The percentage of HTH occurance is :" $HTHPercentage
echo "The percentage of TTH occurance is :" $TTHPercentage
echo "The percentage of HHT occurance is :" $HHTPercentage
echo "The percentage of HHH occurance is :" $HHHPercentage
}
Triplet

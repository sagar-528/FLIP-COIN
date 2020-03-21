#!/bin/bash -x

#->Author: Sagar Gupta 
#->Date: Mar 2020 

#Constants
HEADS=0
TAILS=1
Choice=0

#Declare Dictionary.
declare -A Coin1
declare -A Coin2
declare -A Coin3

Coin1=([T]=0 [H]=0)
Coin2=([TT]=0 [TH]=0 [HT]=0 [HH]=0)
Coin3=([TTT]=0 [HTT]=0 [THH]=0 [THT]=0 [HTH]=0 [TTH]=0 [HHT]=0 [HHH]=0)

#Singlet Combination function
function Singlet(){
#Times of Fliping for singlet combination
read -p "How many times you want to flip the coin = " noTimeFlip

for ((flipcount=1; flipcount<=noTimeFlip; flipcount++))
do
	case $((RANDOM%2)) in
		0)
		  Coin1[H]=$((${Coin1[H]}+1)) ;;
		1)
		  Coin1[T]=$((${Coin1[T]}+1)) ;;
	esac
done

#Printing the singlet combination
for key in "${!Coin1[@]}"
do
	echo "${key} = ${Coin1[$key]}"
done

#Percentage of singlet combination
Percentage=`echo " scale=4 ; (${Coin1[H]}*100)/$noTimeFlip" | bc -l`
echo "The percentage of head occurance is :" $Percentage
}

#Doublet Combination as well as percentage
function Doublet(){
#Times of Fliping for dobulet combination
read -p "How many times you want to flip the coin = " noTimeFlip2

for ((flipcount=1; flipcount<=noTimeFlip2; flipcount++))
do
   case $((RANDOM%4)) in
	0)
	  Coin2[HH]=$((${Coin2[HH]}+1)) ;;
	1)
	  Coin2[HT]=$((${Coin2[HT]}+1)) ;;
	2)
	  Coin2[TH]=$((${Coin2[TH]}+1)) ;;
	3)
	  Coin2[TT]=$((${Coin2[TT]}+1)) ;;
   esac
done

#Printing the doublet combination
for key in "${!Coin2[@]}"
do
   echo "${key} = ${Coin2[$key]}"
done

#Percentage of doublet combination
HHPercentage=`echo " scale=4 ; (${Coin2[HH]}*100)/$noTimeFlip2" | bc -l`
THPercentage=`echo " scale=4 ; (${Coin2[TH]}*100)/$noTimeFlip2" | bc -l`
HTPercentage=`echo " scale=4 ; (${Coin2[HT]}*100)/$noTimeFlip2" | bc -l`
TTPercentage=`echo " scale=4 ; (${Coin2[TT]}*100)/$noTimeFlip2" | bc -l`


echo "The percentage of HH occurance is :" $HHPercentage
echo "The percentage of TH occurance is :" $THPercentage
echo "The percentage of HT occurance is :" $HTPercentage
echo "The percentage of TT occurance is :" $TTPercentage
}

#Triplet Combination as well as percentage
function Triplet(){
#Times of Fliping for triplet combination
read -p "How many times you want to flip the coin = " noTimeFlip3

for ((flipcount=1; flipcount<=noTimeFlip3; flipcount++))
do
   case $((RANDOM%8)) in
        0)
	 Coin3[TTT]=$((${Coin3[TTT]}+1)) ;;
        1)
	 Coin3[HTT]=$((${Coin3[HTT]}+1)) ;;
	2)
	 Coin3[THH]=$((${Coin3[THH]}+1)) ;;
	3)
	  Coin3[THT]=$((${Coin3[THT]}+1)) ;;
	4)
	  Coin3[HTH]=$((${Coin3[HTH]}+1)) ;;
	5)
	  Coin3[TTH]=$((${Coin3[TTH]}+1)) ;;
	6)
	  Coin3[HHT]=$((${Coin3[HHT]}+1)) ;;
	7)
	  Coin3[HHH]=$((${Coin3[HHH]}+1)) ;;
   esac
done

#Printing the triolet combination
for key in "${!Coin3[@]}"
do
   echo "${key} = ${Coin3[$key]}"
done

#Percentage of triplet combination
TTTPercentage=`echo " scale=4 ; (${Coin3[TTT]}*100)/$noTimeFlip3" | bc -l`
HTTPercentage=`echo " scale=4 ; (${Coin3[HTT]}*100)/$noTimeFlip3" | bc -l`
THHPercentage=`echo " scale=4 ; (${Coin3[THH]}*100)/$noTimeFlip3" | bc -l`
THTPercentage=`echo " scale=4 ; (${Coin3[THT]}*100)/$noTimeFlip3" | bc -l`
HTHPercentage=`echo " scale=4 ; (${Coin3[HTH]}*100)/$noTimeFlip3" | bc -l`
TTHPercentage=`echo " scale=4 ; (${Coin3[TTH]}*100)/$noTimeFlip3" | bc -l`
HHTPercentage=`echo " scale=4 ; (${Coin3[HHT]}*100)/$noTimeFlip3" | bc -l`
HHHPercentage=`echo " scale=4 ; (${Coin3[HHH]}*100)/$noTimeFlip3" | bc -l`

echo "The percentage of TTT occurance is :" $TTTPercentage
echo "The percentage of HTT occurance is :" $HTTPercentage
echo "The percentage of THH occurance is :" $THHPercentage
echo "The percentage of THT occurance is :" $THTPercentage
echo "The percentage of HTH occurance is :" $HTHPercentage
echo "The percentage of TTH occurance is :" $TTHPercentage
echo "The percentage of HHT occurance is :" $HHTPercentage
echo "The percentage of HHH occurance is :" $HHHPercentage
}

#Function of Sorting and Winning Combination for singlet
function Sort1(){
echo "Combination in Sort form :"
for element in "${!Coin1[@]}"
do
	echo "$element = ${Coin1["$element"]}"
done | sort -rn -k3

	echo "Winning Combination is :"
		for element in "${!Coin1[@]}"
		do
			echo "$element = ${Coin1["$element"]}"
		done | sort -rn -k3 | head -1
}

#Function of Sorting and Winning Combination for doublet
function Sort2(){
echo "Combination in Sort form :"
for element in "${!Coin2[@]}"
do
   echo "$element = ${Coin2["$element"]}"
done | sort -rn -k3

   echo "Winning Combination is :"
      for element in "${!Coin2[@]}"
      do
         echo "$element = ${Coin2["$element"]}"
      done | sort -rn -k3 | head -1
}

#Function of Sorting and Winning Combination for triplet
function Sort3(){
echo "Combination in Sort form :"
for element in "${!Coin3[@]}"
do
   echo "$element = ${Coin3["$element"]}"
done | sort -rn -k3

   echo "Winning Combination is :"
      for element in "${!Coin3[@]}"
      do
         echo "$element = ${Coin3["$element"]}"
      done | sort -rn -k3 | head -1
}

#Function call ing all in case
while(($Choice<4))
do
	echo "Enter the number for flip coin simulation given below : "
	echo "1.Flip coin for singlet combination"
	echo "2.Flip coin for doublet combination"
	echo "3.Flip coin for triplet combination"
	read -p "Choose the option : " Choice
	case $Choice in
		1)
		 Singlet
		 Sort1
		 break ;;
		2)
		 Doublet
		 Sort2
		 break ;;
		3)
		 Triplet
		 Sort3
		 break ;;
		*)
		 echo "Invalid choice" ;;
	esac
done

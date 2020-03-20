#!/bin/bash -x

#->Author: Sagar Gupta 
#->Date: Mar 2020 

#Constants
HEADS=0
TAILS=1

if ((RANDOM%2 == 0))
then
	echo "Head"
else
	echo "Tail"
fi

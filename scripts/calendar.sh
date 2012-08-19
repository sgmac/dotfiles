#!/bin/bash

 cal[1]=31
 cal[2]=28
 cal[3]=31
 cal[4]=30
 cal[5]=31
 cal[6]=30
 cal[7]=31
 cal[8]=31
 cal[9]=30
 cal[10]=31
 cal[11]=30
 cal[12]=31


for ((i=1; i <= 12; i++))
do
    echo "Month: $i has ${cal[$i]} days"
done



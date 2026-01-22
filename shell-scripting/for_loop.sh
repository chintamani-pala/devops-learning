#!/bin/bash

<<info

loops: anything that you want to repeat again and again again based on conditions
for loop conditions

1..10

start point = 1
end point = 10 
increment/decrement = ++ / --

reverse loop
5..1

info

for (( num=1 ; num<=10 ; num++ )) 
do 
	echo $num
	echo "hello its $num"
done

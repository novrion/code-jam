#!/bin/bash

exe="./data/.run"
exedir="data/.run"
infile="data/in/in"
ansfile="data/ans/ans"
usrfile="data/.usr"
usrsrc="data/usr.cpp"
result="data/result"

> $result

n_tests=$(cat data/.ntests)
max_time=1000000000
score=0
total_time=0



function time_exec() {
	
	start_t=$(date +%s%N)
	$exe < $1 > $usrfile
	end_t=$(date +%s%N)

	echo $((end_t - start_t))
}



# Fetch && Compile usr Code
mv $1 $usrsrc
g++ -O2 -std=c++17 -o $exedir $usrsrc



i=0
while [ $i -lt $n_tests ]; do

	# Time Executable
	t=$(time_exec "$infile$i")
	total_time=$((total_time + t))


	# TLE
	if [ $t -gt $max_time ]; then
        	echo "[$i] Time Limit Exceeded" >> $result
        	echo "$i / $n_tests" >> $result
        	break
    	fi


	# Compare Answer
	in="$infile$i"
	ans=$(diff -wB "$in" "$usrfile")
	

	# Accepted & Wrong Answer
	if [ $? -eq 0 ]; then
        	echo "[$i] Accepted     [$t]" >> $result
        	score=$((score + 1))
    	else
        	echo "[$i] Wrong Answer" >> $result
		echo "$i / $n_tests" >> $result
        	break
    	fi


    	((i++))
done



# Extra Score
if [ $score -gt 0 ]; then
	score=$(awk "BEGIN { printf \"%.2f\", $score + (1 - ($total_time / $score) / $max_time) }")
fi



echo "score : $score" >> $result


# Delete bin
rm $exedir

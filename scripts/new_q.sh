#!/bin/bash

cd ..

# Input
echo -n "Directory Name: "
read dir

echo -n "Question Name: "
read question

echo -n "Number Of Test Cases: "
read n_tests

# Create Files
mkdir $dir
mkdir $dir/data
mkdir $dir/data/in
mkdir $dir/data/ans

touch $dir/data/.usr
touch $dir/data/result

# In
touch $dir/data/in/comp_test.cpp
touch $dir/data/in/comp_test.sh
tmp="$(cat scripts/comp_test.sh)"
echo "$tmp" > $dir/data/in/comp_test.sh

# Ans
touch $dir/data/ans/comp_ans.cpp
touch $dir/data/ans/comp_ans.sh
tmp="$(cat scripts/comp_ans.sh)"
echo "$tmp" > $dir/data/ans/comp_ans.sh

# Script
touch $dir/exec.sh
tmp="$(cat scripts/exec.sh)"
echo "$tmp" > $dir/exec.sh

# N Tests
touch $dir/data/.ntests
echo $n_tests > $dir/data/.ntests

# Max Time
touch $dir/data/.maxtime
echo $"1000000000" > $dir/data/.maxtime

# Question
touch $dir/$question.txt

# In && Ans
i=0
while [ $i -lt $n_tests ]; do
	touch "$dir/data/in/in$i"
	touch "$dir/data/ans/ans$i"
	i=$((i + 1))
done

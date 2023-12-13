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
touch $dir/data/in/comptest.cpp
touch $dir/data/in/comptest.sh
tmp="$(cat .scripts/comptest.sh)"
echo "$tmp" > $dir/data/in/comptest.sh

# Ans
touch $dir/data/ans/answer.cpp
touch $dir/data/ans/answer.sh
tmp="$(cat .scripts/answer.sh)"
echo "$tmp" > $dir/data/ans/answer.sh

# Script
touch $dir/exec.sh
tmp="$(cat .scripts/exec.sh)"
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

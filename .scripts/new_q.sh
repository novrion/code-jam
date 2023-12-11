#!/bin/bash

cd ..

# Input
echo -n "Directory Name: "
read dir

echo -n "Question Name: "
read question

echo -n "Number Of Test Cases: "
read n_questions

# Create Files
mkdir $dir
mkdir $dir/data
mkdir $dir/data/in
mkdir $dir/data/ans

touch $dir/data/usr
touch $dir/data/result

touch $dir/$question.txt
touch $dir/answer.cpp

# In & Answers
i=0
while [ $i -lt $n_questions ]; do
	touch "$dir/data/in/in$i"
	touch "$dir/data/ans/ans$i"
	i=$((i + 1))
done

# Script
touch $dir/exec.sh
tmp="$(cat .scripts/exec.sh)"
echo "$tmp" > $dir/exec.sh

#!/bin/bash

cd ..
n_tests=$(cat .ntests)
cd in

g++ -O2 -o run comp_test.cpp

i=0
while [ $i -lt $n_tests ]; do
	./run $i > "in$i"
	i=$((i + 1))
done

rm run

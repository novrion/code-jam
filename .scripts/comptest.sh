#!/bin/bash

cd ..
n_tests=$(cat .ntests)
cd in

g++ -O2 -o run comptest.cpp

i=0
while [ $i -lt $n_tests ]; do
    ./run > "in$i"
done

rm run
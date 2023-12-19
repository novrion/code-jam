#!/bin/bash

cd ..
n_tests=$(cat .ntests)

g++ -O2 -o ans/run ans/comp_ans.cpp

i=0
while [ $i -lt $n_tests ]; do
    ./ans/run < "in/in$" > "ans/ans$i"
done

rm ans/run
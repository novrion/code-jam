# #!bin/bash

# exe="./run"
# infile="data/in"
# ansfile="data/ans"
# usrfile="data/usr"
# result="data/result"

# score=0
# n_tests=5
# max_time=1
# total_time=0



# function time_exec {
#     time=$(/usr/bin/time -f "%S" -p "$exe" < "$1" > "$usr")
#     return $time
# }



# i=0
# while [ $i -le $n_tests ]
# do

#     # time exe
#     time=$(time_exec "./run.exe")
#     total_time=$((total_time + time))

#     # TLE
#     if [ $(echo "$time > $max_time" | bc) -eq 1 ]; then
#         echo -e "[$i] Time Limit Exceeded\n" >> $result
#         echo "$i / $n_tests" >> $result
#         break
#     fi

#     # cmp ans
#     in=$"$ins$i"
#     usr=$"$usr$i"
#     ans=$(diff -wB $in $usr)

#     if [ $ans -eq 0 ]; then
#         echo -e "[$i] Accepted     [$time]\n" >> $result
#         total_time=$((total_time + time))
#         ((score++))
#     else
#         echo -e "[$i] Wrong Answer\n" >> $result
#         break
#     fi

#     ((i++))
# done



# # extra score
# if [ $score -gt 0 ]; then
#     score=$((score + (1 - (total_time / score) / max_time)))
# fi



# echo "score : $score" >> $result



#!/bin/bash

exe="./run"
infile="data/in"
ansfile="data/ans"
usrfile="data/usr"
result="data/result"

score=0
n_tests=5
max_time=1
total_time=0

function time_exec {
    time=$(/usr/bin/time -f "%S" -p "$exe" < "$1" > "$usrfile")
    echo $time
}

i=0
while [ $i -le $n_tests ]; do

    # time exe
    time=$(time_exec "$infile$i")
    total_time=$(echo "$total_time + $time" | bc)

    # TLE
    if [ $(echo "$time > $max_time" | bc) -eq 1 ]; then
        echo -e "[$i] Time Limit Exceeded\n" >> "$result"
        echo "$i / $n_tests" >> "$result"
        break
    fi

    # cmp ans
    in="$infile$i"
    usr="$usrfile$i"
    ans=$(diff -wB "$in" "$usr")

    if [ $? -eq 0 ]; then
        echo -e "[$i] Accepted     [$time]\n" >> "$result"
        score=$((score + 1))
    else
        echo -e "[$i] Wrong Answer\n" >> "$result"
        break
    fi

    ((i++))
done

# extra score
if [ $score -gt 0 ]; then
    score=$(echo "scale=2; $score + (1 - ($total_time / $score) / $max_time)" | bc)
fi

echo "score : $score" >> "$result"

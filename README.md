# Bash scripts for hosting code jams
**Host must write:** \
    **1)** Code for test cases in **data/test/comp_test.cpp** (executed with **comp_test.sh**) \
    **2)** Code for answers to test cases in **data/ans/comp_ans.cpp** (executed with **comp_ans.sh**) \
    **3)** Question \
\
Run **new_q.sh** to generate a new code jam question \
\
Run **exec.sh** with submission file path as argument to evaluate submission \
Submission results are written to **data/result** \
\
Edit **data/.maxtime** to alter time limit in nanoseconds (default = 1s)\
\
**Only C/C++** compilation is supported. Tweakes are necessary for testing other languages.

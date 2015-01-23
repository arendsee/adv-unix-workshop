#!/bin/bash

# This example uses AWK in a context unrelated to text processing.

# AWK implementation of the Box-Muller normal random number generator

# Each transform uses two uniform random variables and outputs two normal
# random variables

# Two variables are passed to AWK 
#    n - the number of random normal variables to output
#    s - the initial random seed, see note below
echo | awk -v n=$1 -v s=$RANDOM$RANDOM '
    BEGIN {
        pi = 4 * atan2(1,1)
        srand(s)
    }

    function rnorm(pi){
        r1 = rand()
        r2 = rand()
        a = sqrt(-2 * log(r1)) * cos(2 * pi * r2)
        b = sqrt(-2 * log(r1)) * sin(2 * pi * r2)
        return
    }

    END {
        if(n == 1){
            rnorm(pi)
            print a
        }
        for (i=1; i <= n/2; i++){
            rnorm(pi)
            print a "\n" b
        }
    }
'

# $RANDOM environmental variable:
#    The system collects noise which it feeds into a pool of true random bits.
#    Each time $RANDOM is called, two bytes from this pool are returned and
#    removed form the pool.
#    If we did not provide AWK a random seed, it would seed its
#    pseudorandom number generator with system time. Try running this script
#    repeatedly: 
# echo | awk 'BEGIN{srand()} {print rand()}'
#    in my implementation of AWK (GNU AWK 4.0.1) calls witin the same second
#    have the same output.

#!/bin/bash

#-----------------------------------------------------------------------------
# This is an option you should use whenever you write a Bash script which
# might use variables. It prevents use of undefined variables, avoiding
# many hard-to-catch (and sometimes devastating) bugs.
#-----------------------------------------------------------------------------
set -u

# Comment out this line
# echo 'Hello World!'


#-----------------------------------------------------------------------------
# Exercise 1.1 - variables and quotes
# 1) Assign the names 'Jess', 'Jack', and 'Jenn' to the variables a, b, and c
# 2) Add a line that uses these variables to print the sentence:
#    "Jess, Jack and Jenn say hi!"
#-----------------------------------------------------------------------------

a=Jess
b=Jack
c=Jenn
echo "$a, $b, and $c say hi!"


#-----------------------------------------------------------------------------
# Exercise 1.2 - parameter expansion, command and arithmetic substitution
# 1) Use parameter expansion and the variables from Exercise 1.1 to print the
#    sentence:
#    "Many Jesses, Jacks, and Jenns say bye!
# 2) The command `whoami` prints your username.
#    The command `date` prints the current time.
#    Use command substitution to print the sentence:
#    "I am <username> and today is <date>"
#    Replacing <username> and <date> with output of `whoami` and `date`
# 3) Assign 4.5 and 2.1 to the variables x and y. Then use arithmetic
#    substitution to print the sentence:
#    "x + y = 6.6"
#-----------------------------------------------------------------------------

echo "Many ${a}es, ${b}s, and ${c}s say bye!"

echo "I am $(whoami) and today is $(date)"

# This last question is actually not possible with straight BASH. Running

# $ x=4.5
# $ y=2.1
# $ echo "x + y = $(( x + y ))"

# outputs an error. The reason is simply that Bash can't handle float
# (non-integer) operations. I did not know this when I wrote the tutorial,
# because I hardly ever do math in Bash. I added it here because I thought
# summing would be a nice practice of general substitution principles. If you
# did want to do this in Bash, you would would need to pipe to an external
# program, e.g.

x=4.5
y=2.1
echo "x + y = $( echo $x '+' $y | bc -l )"

# Or more succinctly:
# echo "x + y = $( bc <<< $x'+'$y )"

# Moral of the story, don't do math or extensive logic in Bash. That is better
# done in a programming language like Python. Bash is wonderful for controlling
# the flow of data between programs and into/from files. It is not designed to
# be a full programming language.



#-----------------------------------------------------------------------------
# Exercise 1.3 - arguments
# 1) Write a line to print arguments 0, 1 and 2
# 2) Rerun the program with two arguments (e.g. ./script.sh Jack Jill)
# 3) Write a line that sums two input arguments
# 4) What happens when you feed it a non-numeric argument?
#-----------------------------------------------------------------------------

echo $0 $1 $2 

echo "$1 + $2 = $(( $1 + $2 ))"

# Say you call the script as so:
# $ bash solutions.sh 15 asdf
# Here is what happens:
# 1. Variable expansion within the arithmetic expansion, resulting in:
#    echo "$1 + $2 = $(( 15 + asdf ))
# 2. Now within the arithmetic expansion, Bash tries to find the variable
#    'asdf'. This variable is not defined so, because `set -u` appears at
#    the top of the script, we get the error:
# solutions.sh: line 83: asdf: unbound variable
#    If `set -u` is not present, then 'asdf' will be interpreted as 0,
#    resulting in:
# 1 + asdf = 1


#-----------------------------------------------------------------------------
# Exercise 1.4 - for-loops
# 1) Write a for-loop that prints (using the variables from 1.1)
#    Hello Jess
#    Hello Jack
#    Hello Jenn
# 2) Write a for-loop that uses command substitution to loop over the first
#    three names in names.txt (hint: use `head -3`). Output should be:
#    Hello Alice
#    Hello Bob
#    Hello Carl
# 3) Adapt the for-loop from 2) to write the output for each name to a file
#    named <name>.txt
#-----------------------------------------------------------------------------


# `echo` used all alone will produce an empty line
echo
for name in $a $b $c; do
    echo "Hello $name"
done

echo
for name in $(head -3 a.txt); do
    echo "Hello $name"
done

for name in $(head -3 a.txt); do
    # The {} around 'name' are actually optional, since '.' is illegal in
    # variable names and thus Bash understands $name is the variable. However
    # it is perhaps clearer to leave the brackets in.
    echo "Hello $name" > ${name}.txt
done

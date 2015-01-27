#!/bin/bash

#-----------------------------------------------------------------------------
# This is an option you should use whenever you write a Bash script which
# might use variables. It prevents use of undefined variables, avoiding
# many hard-to-catch (and sometimes devastating) bugs.
#-----------------------------------------------------------------------------
set -u

echo 'Hello World!'



#-----------------------------------------------------------------------------
# Exercise 1.1 - variables and quotes
# 1) Assign the names 'Jess', 'Jack', and 'Jenn' to the variables a, b, and c
# 2) Add a line that uses these variables to print the sentence:
#    "Jess, Jack and Jenn say hi!"
#-----------------------------------------------------------------------------




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
#-----------------------------------------------------------------------------



#-----------------------------------------------------------------------------
# Exercise 1.3 - arguments
# 1) Write a line to print arguments 0, 1 and 2
# 2) Write a line that sums two input arguments
# 3) What happens when you feed it a non-numeric argument?
#-----------------------------------------------------------------------------



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

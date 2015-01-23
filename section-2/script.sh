#!/bin/bash
set -u

#-----------------------------------------------------------------------------
# Advanced UNIX workshop Section 2 - Parsing Hamlet
#-----------------------------------------------------------------------------


# Introductory header for the final report
echo 'Parsing Hamlet'



#-----------------------------------------------------------------------------
# Exercise 2.1
# 1) Open h1.txt (with less, more, or vi)
# 2) Familiarize yourself with the format
# 3) Complete (with simple commands) the code below
#-----------------------------------------------------------------------------

echo "Word counts:"
# Replace the line below with a command that writes word counts for each file
echo -e "\t<word count per file>"

echo "Scenes:"
# Use grep to list the scenes in all five h*.txt files with one command
echo -e "\t<Scenes>"



#-----------------------------------------------------------------------------
# Exercise 2.2
# 1) Count the number of words that end with 'ly', sort by frequency. The
#    top 3 lines should be:
#      6 only
#      7 fly
#      4 truly
# 2) Count words that are used only once
#-----------------------------------------------------------------------------

echo "'ly' words:"
echo -e "\t<'*ly' word counts>"

echo "Number of words used only once: <number>"

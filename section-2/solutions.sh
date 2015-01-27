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
wc -w h*.txt
# Or to be more specific:
# wc -w h[1-5].txt

echo "Scene"
# Use grep to list the scenes in all five h*.txt files with one command
grep 'Scene.' h*.txt



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
# Building a command like this is a complicated process, best to do it in
# steps. Here is how I would build the command:
# 1. start with the simplest possible search
#    $ grep ly h*.txt
# 2. note that I am only matching the ends of words, so add an expression
#    $ grep -E '[a-z]+ly' h*.txt
# 3. but now I am missing capitals, so I can do one of the following
#    $ grep -iE '[a-z]+ly' h*.txt
#    $ grep -E '[A-Za-z]+ly' h*.txt
# 4. now to check all cases (I can get color in less with the following):
#    $ grep --color=always -iE '[a-z]+ly' h*.txt | less -R
# 5. ahh, this reveals a problem: words like 'dallying' or 'Olympus' are
#    also matched. Adding -w solves this problem by requiring matches to
#    whole words.
#    $ grep -iwE '[a-z]+ly' h*.txt
# 6. now that I am pretty confident in my results, I will drop the context
#    with -o
#    $ grep -iowE '[a-z]+ly' h*.txt
# 7. annoying filenames are still around, so I kill those with -h
#    $ grep -hiowE '[a-z]+ly' h*.txt
# 8. now I can sort and count them
#    $ grep -hiowE '[a-z]+ly' h*.txt | sort | uniq -c
# 9. finally I sort by the count column (with -r so highest counts are on top)
     grep -hiowE '[a-z]+ly' h*.txt | sort | uniq -c | sort -rn

# There is one remaining problem: I am currently counting capitalized words
# like 'Truly' as being separate from uncapitalized words, like 'truly'. There
# are a couple ways to convert upper to lowercase, here are a few (for brevity,
# I have dropped the last 3 commands of the pipe):
     # grep -hiowE '[a-z]+ly' h*.txt |  sed 's/.*/\L&/'
     # grep -hiowE '[a-z]+ly' h*.txt |  perl -pe 'tr/A-Z/a-z/'
     # grep -hiowE '[a-z]+ly' h*.txt |  tr [:upper:] [:lower:]


n=$(grep -hiowE '[a-z]+' h*.txt | sort | uniq -u | wc -l)
# # or if you want to convert to lowercase before counting (which you really should):
# n=$(grep -hiowE '[a-z]+' h*.txt | sed 's/.*/\L&/' | sort | uniq -u | wc -l)
echo "Number of words used only once: $n"



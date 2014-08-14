#!/bin/bash

# If the file is ASCII, then use normal less
if [[ $(file $1) =~ 'ASCII text' ]]; then
    less $1
# Otherwise run preprocessor
else
    lesspipe $1 | less
fi

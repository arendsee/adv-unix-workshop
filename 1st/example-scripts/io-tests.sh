#!/bin/bash

if [ ! -s $1 ]; then
    echo 'File exists but is empty'
elif [ -f $1 ]; then
    echo 'File exists'
fi

if [ -r $1 ]; then
    echo 'File is readable'
fi

if [ -d $1 ]; then
    echo 'This is a diretory'
fi

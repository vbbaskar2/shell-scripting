#!/bin/bash

##if we assign a name to a set of data, then that is called as variable
#SYNTAX: VAR=DATA

#Number
a=100

#string
b=abc

#But in bash shell everything is considered as a string. Because there are no data types in Bash shell
#we will Access the variables with $ prefixing the variable name.

echo value of a is $a
echo value of b is $b

echo value of a is ${a}


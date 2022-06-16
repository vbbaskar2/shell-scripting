#!/bin/bash
#To print text onto the screen while executing the shell script echo or printf
#For our comfort we will be using echo

echo Hi This is vijay
echo Hi
echo hello \n hello again

#for suppose if i want to use escape sequences then i will be using ""
# \n, \t
echo -e "hello\nhello again"
echo -e "hello\thello again\n hell0 3rd time"

#colored output
#syntax: echo -e "\[COLm Message"

##COLOR  CODE
#RED      31
#GREEN    32
#Yellow   33
#Blue     34
#Magenta  35
#Cyan     36

echo -e "\[31m This is Red"
echo -e "\[32m This is Green"
echo -e "\[33m This is Yellow"
echo -e "\[34m This is Blue"
echo -e "\[35m This is Magenta"
echo -e "\[36m This is Cyan"






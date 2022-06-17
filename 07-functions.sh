#!/bin/bash

#Functions should always be declared before using it, same like varibales
function abc(){
  echo I am From function abc
  a=100
  echo a in function = $a
  echo hi this is $1
  return 20
  echo this is second time a = $a
}

xyz(){
  echo i am from xyz
}

##Main Program
abc
echo exit status of abc is $?
a=10
echo a in Main program $a
xyz
echo hi this is $1
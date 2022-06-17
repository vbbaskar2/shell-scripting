#!/bin/bash

#Functions should always be declared before using it, same like varibales
function abc(){
  echo I am From function abc
  a=100
  echo a in function = $a
}

xyz(){
  echo i am from xyz
}

##Main Program
abc
#a=10
echo a in Main program $a
xyz

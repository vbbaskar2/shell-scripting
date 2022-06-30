#!/bin/bash
print(){
  echo -e  "\e[1;32m $1\e[0m"
}

stat(){
    if [ "$1" -eq 0 ]; then
    echo -e "\e[1;31m success\e[0m"
    else
    echo -e  "\e[;33m Failure \e[0m"
    echo -e "Script failed go and check the log file"
    exit 1
    fi
}

 LOG=/tmp/roboshop.log
 rm -f $LOG

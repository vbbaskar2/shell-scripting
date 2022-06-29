#!/bin/bash
print(){
  echo -e  "\e[1m$1\e[0m"
}

stat(){
    if [ "$1" -eq 0 ]; then
    echo -e "\e[1m success\e[0m" &>>$LOG
    else
    echo -e  "\e[1m Failure \e[0m" &>>$LOG
    exit 1
    fi
}

 LOG=/tmp/roboshop.log
 rm -f $LOG

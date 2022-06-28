#!/bin/bash

print(){
  echo -e  "\e[1m$1\e[0m"
}

stat(){
    if [ "$1" -eq 0 ]; then
    echo -e "\e[1m success\e[0m" &>>$LOG
    else
    echo -e  "\e[1m is not completed\e[0m" &>>$LOG
    fi
}
 LOG=/tmp/roboshop.log
 rm -f $LOG

print "Installing nginx"
yum install nginx -y &>>$LOG
stat $?

print "Enabling nginx"
systemctl enable nginx &>>$LOG
stat $?

print "Starting nginx"
systemctl start nginx &>>$LOG
stat $?

exit 1

curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"

cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-master static README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf



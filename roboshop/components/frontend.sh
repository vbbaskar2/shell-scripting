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

print "Installing nginx"
yum install nginx -y &>>$LOG
stat $?

print "Enabling nginx"
systemctl enable nginx &>>$LOG
stat $?

print "Starting nginx"
systemctl start nginx &>>$LOG
stat $?

print "Download HTML pages"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
stat $?

print "Remove old HTML Pages"
rm -rf  /usr/share/nginx/html/* &>>$LOG
stat $?

print "Extracting the archives"
unzip -o -d /tmp /tmp/frontend.zip &>>$LOG
stat $?


print "Copy files to Nginx path"
mv /tmp/frontend-main/static/* /usr/share/nginx/html/. &>>$LOG
stat $?

exit 1
mv static/* .
rm -rf frontend-master static README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf



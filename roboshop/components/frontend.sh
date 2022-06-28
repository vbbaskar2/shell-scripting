#!/bin/bash

source components/common.sh

 LOG=/tmp/roboshop.log
 rm -f $LOG

print "Installing nginx"
yum install nginx -y &>>$LOG
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

print "Copy nginx Roboshop Conf"
cp /tmp/frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG
stat $?



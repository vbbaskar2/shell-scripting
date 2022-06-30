#!/bin/bash

source components/common.sh

print "Installing NodeJs"
yum install nodejs make gcc-c++ -y &>>$LOG
stat $?


print "Add Roboshop user"
id roboshop &>>$LOG
if [ $? -eq 0 ]; then
  echo "User already exists"
  else
    useradd roboshop &>>$LOG
fi
stat $?

print "Download Schema"
 curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
stat $?


print "Extract schema"
unzip -o -d /home/roboshop /tmp/catalogue.zip &>>$LOG
stat $?


print "Copy content"
 mv  /home/roboshop/catalogue-main /home/roboshop/catalogue
stat $?

#stat $?
## cd /home/roboshop/catalogue
## npm install
#
##mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
## systemctl daemon-reload
## systemctl start catalogue
## systemctl enable catalogue

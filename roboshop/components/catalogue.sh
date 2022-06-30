#!/bin/bash

source components/common.sh

print "Installing NodeJs"
yum install nodejs make gcc-c++ -y &>>$LOG
stat $?


print "Add Roboshop user"
useradd roboshop
stat $?

print "Download Schema"
 curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
stat $?


print "Extract schema"
unzip -o -d /home/centos /tmp/catalogue.zip &>>$LOG
stat $?


#print "Copy content"
# mv catalogue-main catalogue
#stat $?
## cd /home/roboshop/catalogue
## npm install
#
##mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
## systemctl daemon-reload
## systemctl start catalogue
## systemctl enable catalogue

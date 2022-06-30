#!/bin/bash

source components/common.sh

print "Download Repo"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG
stat $?

print "Install MongoDB"
 sudo yum install -y mongodb-org  &>>$LOG
stat $?

print "Update the Mongodb config"
sed  -i -e "s/127.0.0.1/0.0.0.0/g" /etc/mongod.conf &>>$LOG
stat $?


print "Enable the Mongodb"
systemctl enable mongod &>>$LOG
stat $?

print "Start Mongodb"
systemctl start mongod &>>$LOG
stat $?

DOWNLOAD "/tmp"

print "Load schema"
cd "/tmp/mongodb-main"
 mongo < catalogue.js
 mongo < users.js
stat $?

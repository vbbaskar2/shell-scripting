#!/bin/bash

source components/common.sh

print "Download Repo"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo
stat $?

print "Install MongoDB"
 yum install -y mongodb-org  &>>LOG
stat $?

sed  -i -e "s/127.0.0.1/0.0.0.0/g" /etc/mongod.conf &>>$LOG



# print "Enable MongoDB"
# systemctl enable mongod
# systemctl start mongod

# systemctl restart mongod

# curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"

# cd /tmp
# unzip mongodb.zip
# cd mongodb-main
# mongo < catalogue.js
# mongo < users.js

#!/bin/bash

source components/common.sh

print "Installing NodeJs"
yum install nodejs npm make gcc-c++ -y &>>$LOG
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
 curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$LOG
stat $?



print "Extract schema"
unzip -o -d /home/roboshop /tmp/catalogue.zip &>>$LOG
stat $?

print "Remove Older schema"
rm -rf /home/roboshop/catalogue &>>$LOG
stat $?

print "Copy content"
 mv  /home/roboshop/catalogue-main /home/roboshop/catalogue
stat $?

print "install nodejs Dependencies"
cd /home/roboshop/catalogue
npm install --unsafe-perm &>>$LOG
stat $?

print "Fix APP permissions"
chown -R roboshop:roboshop /home/roboshop
stat $?

print "Updata MongoDB DNS Config"
sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/roboshop/catalogue/systemd.service &>>$LOG
stat $?

print "Copy SystemD file"
mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
stat $?

print "start catalogue service"
systemctl daemon-reload &>>$LOG && systemctl start catalogue &>>$LOG && systemctl enable catalogue &>>$LOG
stat $?

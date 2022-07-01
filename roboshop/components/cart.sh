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
 curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip" &>>$LOG
stat $?



print "Extract schema"
unzip -o -d /home/roboshop /tmp/cart.zip &>>$LOG
stat $?

print "Remove Older schema"
rm -rf /home/roboshop/cart &>>$LOG
stat $?

print "Copy content"
 mv  /home/roboshop/cart-main /home/roboshop/cart
stat $?

print "install nodejs Dependencies"
cd /home/roboshop/cart
npm install --unsafe-perm &>>$LOG
stat $?

print "Fix APP permissions"
chown -R roboshop:roboshop /home/roboshop
stat $?

print "Update MongoDB DNS Config"
sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/roboshop/cart/systemd.service &>>$LOG
stat $?

print "Copy SystemD file"
mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service
stat $?

print "start Cart service"
systemctl daemon-reload &>>$LOG && systemctl start cart &>>$LOG && systemctl enable cart &>>$LOG
stat $?

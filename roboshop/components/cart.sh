#!/bin/bash

print "Install node "
 yum install nodejs make gcc-c++ -y
stat $?

# useradd roboshop


 curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip"
 cd /home/roboshop
 unzip /tmp/cart.zip
 mv cart-main cart
 cd cart
 npm install


# mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service
# systemctl daemon-reload
# systemctl start cart
# systemctl enable cart
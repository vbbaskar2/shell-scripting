#!/bin/bash

print(){
  echo -e  "\e[1m$1\e[0m"
}

stat(){
    if [ "$1" -eq 0 ]; then
    echo -e "\e[1m $1 successfully\e[0m"
    else
    echo -e  "\e[1m $1 is not completed\e[0m"
    fi
}

print "Installing nginx"
yum install nginx -y
stat $?

exit 1

print "Enabling nginx"
systemctl enable nginx
stat $?

print "Starting nginx"
systemctl start nginx
stat $?




curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"

cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-master static README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf



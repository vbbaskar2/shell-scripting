#!/bin/bash

echo "Installing Nignx"
yum install nginx -y

echo "Enabling Nginx"
systemctl enable nginx

echo "start nginx"
systemctl start nginx

exit 1

curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"

cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-master static README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf

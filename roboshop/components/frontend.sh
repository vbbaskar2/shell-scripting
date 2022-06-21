#!/bin/bash

echo -e  "\e[1mInstalling Nignx\e[0m"
yum install nginx -y

echo -e  "\e[1m Enabling Nignx\e[0m"
systemctl enable nginx

echo -e  "\e[1m starting Nignx\e[0m"
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

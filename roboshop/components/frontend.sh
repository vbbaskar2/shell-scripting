#!/bin/bash

print(){
  echo -e  "\e[1m$1\e[0m"
}

print "Installing nginx"
yum install nginx -y
if [ $? == 0 ]; then
  echo -e "Nginx installed successfully"
  else
  echo "Nginx installation is not completed"
fi

exit 1

print "Enabling nginx"
systemctl enable nginx
if [ $? == 0 ]; then
  "Nginx enabled successfully"
fi

print "Starting nginx"
systemctl start nginx




curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"

cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-master static README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf



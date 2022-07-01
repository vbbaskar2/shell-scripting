#!/bin/bash

source components/common.sh

print "Install Redis Repos"
yum install epel-release http://rpms.remirepo.net/enterprise/remi-release-7.rpm yum-utils -y &>>$LOG
stat $?

print "Enable Redis Repo"
yum-config-manager --enable remi &>>$LOG
stat $?

print "Install Redis Repo"
yum install redis -y
stat &?

print "Update Redis Address"
sed  -i -e "s/127.0.0.1/0.0.0.0/g" /etc/redis.conf /etc/redis/redis.conf  &>>$LOG
stat $?

print "Start and Enable DB"
start Redis Database && systemctl enable redis && systemctl start redis
stat $?
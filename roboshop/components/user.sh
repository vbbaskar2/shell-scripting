#!/bin/bash

source components/common.sh

#!/bin/bash
#print(){
#  echo -e  "\e[1;32m $1\e[0m"
#}
#
#stat(){
#    if [ "$1" -eq 0 ]; then
#    echo -e "\e[1;31m success\e[0m"
#    else
#    echo -e  "\e[;33m Failure \e[0m"
#    echo -e "Script failed go and check the log file"
#    exit 1
#    fi
#}

 LOG=/tmp/roboshop.log
 rm -f $LOG

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
   curl -s -L -o /tmp/user.zip "https://github.com/roboshop-devops-project/user/archive/main.zip" &>>$LOG
  stat $?



  print "Extract schema"
  unzip -o -d /home/roboshop /tmp/user.zip &>>$LOG
  stat $?

  print "Remove Older schema"
  rm -rf /home/roboshop/user &>>$LOG
  stat $?

  print "Copy content"
   mv  /home/roboshop/user-main /home/roboshop/user
  stat $?

  print "install nodejs Dependencies"
  cd /home/roboshop/user
  npm install --unsafe-perm &>>$LOG
  stat $?

  print "Fix APP permissions"
  chown -R roboshop:roboshop /home/roboshop
  stat $?

  print "Update MongoDB DNS Config"
  sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' -e 's/REDIS_ENDPOINT/redis.roboshop.internal/' /home/roboshop/user/systemd.service &>>$LOG
  stat $?

  print "Copy SystemD file"
  mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service
  stat $?

  print "start user service"
  systemctl daemon-reload &>>$LOG && systemctl start user &>>$LOG && systemctl enable user &>>$LOG
  stat $?


 LOG=/tmp/roboshop.log
 rm -f $LOG

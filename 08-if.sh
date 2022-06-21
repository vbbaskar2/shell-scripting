#!/bin/bash
read -p 'Enter Username :' username

if [ "$username" == "root" ]; then
  echo "you are a root user"
else
  echo "you are not root user"
fi

if [ $UID -eq 0 ]; then
  echo "you are root user"
else
  echo "you are not root user"
fi
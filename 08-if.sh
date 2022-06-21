#!/bin/bash
read -p 'Enter Username :' username

if[ "$username" == "root" ]; then
  echo "you are a root user"
else
  echo "you are not root user"
fi
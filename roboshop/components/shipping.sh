#!/bin/bash

source components/common.sh

COMPONENT=shipping

MAVEN

Print "Checking DB Connections from App"
sleep 15
STAT=$(curl -s http://localhost:8080/health)
if [ "$STAT" == "OK" ] ; then
  Stat 0
else
  Stat 1
fi

#!/bin/bash
COUNT=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1"  | jq ".Reservations[].Instances[].PrivateIpAddress" | grep -v null | wc -l)
if [ $COUNT -eq 0 ]; then
  aws ec2 run-instances --image-id ami-0bb6af715826253bf --instance-type t3.micro --security-group-ids sg-09b5bda62389f79a2 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$1}]" | jq &>/dev/null
else
  echo -e "\e[1m $1Instance already exits\e[0m"
  return
fi
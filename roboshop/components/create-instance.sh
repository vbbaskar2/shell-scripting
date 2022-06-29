#!/bin/bash

aws ec2 run-instances --image-id ami-0bb6af715826253bf --instance-type t3.micro --security-group-ids sg-09b5bda62389f79a2
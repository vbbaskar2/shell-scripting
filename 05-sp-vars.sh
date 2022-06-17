#!/bin/bash

# 0 is script name
echo 0 = $0

# First argument to script
echo 1 = $1
echo 2 = $2
echo "* = $*"
echo "@ = $@"
echo "# = $#"

echo -e "Your Name= $1\nYour Age =$2"
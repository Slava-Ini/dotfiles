#!/bin/sh

name=$1
message=$2

red="\033[0;31m"
nc="\033[0m"

if [ -z "$message" ]; then
  echo "Please provide an error message"
  exit 1
fi

log_message="[ERROR: $name] $message"
timestamp=$(date +"%d/%m/%Y %H:%M:%S")

echo -e "${red}$log_message${nc}"
echo "$timestamp $log_message" >> scripts/logs.txt

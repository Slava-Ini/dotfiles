#!/bin/sh

name=$1
message=$2

cyan="\033[0;36m"
nc="\033[0m"

if [ -z "$message" ]; then
  echo "Please provide a message"
  exit 1
fi

log_message="[INFO: $name] $message"
timestamp=$(date +"%d/%m/%Y %H:%M:%S")

echo -e "${cyan}$log_message${nc}"
echo "$timestamp $log_message" >> scripts/logs.txt

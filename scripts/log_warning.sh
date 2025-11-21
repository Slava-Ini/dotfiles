#!/bin/sh

name=$1
message=$2

cyan="\033[0;33m"
nc="\033[0m"

if [ -z "$message" ]; then
  echo "Please provide a warning message"
  exit 1
fi

log_message="[WARNING: $name] $message"
timestamp=$(date +"%d/%m/%Y %H:%M:%S")

echo "${cyan}$log_message${nc}"
echo "$timestamp $log_message" >> scripts/logs.txt

#!/bin/bash

mkdir -p ./log_files
cd ./log_files

while true
do
    now=$(date)
    top -b -n 1 > "proc_log_$now"
    vnstat > "bandwidth_log_$now"
    cat /proc/devices > "device_log_$now"

    # The line below is commented because google does not alllow email from Mutt. Therefore it does not work
    #mutt -s "98101588" ramimohammadamin@gmail.com -a "./logfile/proc_log_$now" -a "./logfile/bandwidth_log_$now" -a "./logfile/device_log_$now"
    sleep 60
done
#!/bin/bash

current="ftp://ftp.sharif.ir/"
curl $current
echo "========================================================="

while true
do
    echo "Enter you command:"     
    read com dest
    if [[ $com != "cd" && $com != "ls" ]]
    then
        echo "Invalid command"
        echo "========================================================="
        continue
    fi

    if [[ $dest == *"ftp://"* ]]
    then 
        temp_dest="$dest"
    else
        temp_dest="$current$dest"
    fi

    curl $temp_dest
    if [[ 0 != $? ]]
    then 
        echo "No such file or directory"
        echo "========================================================="
        continue
    fi

    if [[ "$com" == "cd" ]]
    then
        current="$temp_dest"
    fi
    echo "========================================================="
done

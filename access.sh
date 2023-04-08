#!/bin/bash

path=/lib

access() {
    for file in "$1/"*
    do
        if [[ -d $file ]]
        then
            access $file
        else
            chmod 777 $file
        fi
    done
}

access $path
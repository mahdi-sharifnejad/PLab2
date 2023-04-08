#!/bin/bash

CONF_FILE=/etc/resolv.conf
sudo echo nameserver 178.22.122.100 > $CONF_FILE
sudo echo nameserver 185.51.200.2 >> $CONF_FILE
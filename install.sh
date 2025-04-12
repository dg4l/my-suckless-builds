#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Must run as root"
  exit
fi

cd dwm/ && make clean install && cd .. && cd slstatus/ && make clean install && cd .. && cd dmenu/ && make clean install && cd ..
cp dwm.desktop /usr/share/xsessions/
printf "Install Complete"

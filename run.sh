#!/bin/bash

DIR=$(which ruby)

DIR=$(dirname $DIR)

if [ ! -d $DIR 2>/dev/null ]; then
  echo "Ruby not installed. Now installing"
  sudo apt-get install ruby   
fi

ruby "q3.rb"
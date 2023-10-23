#!/bin/bash
rm -r /home/ubuntu/JSON/back10
if [ -d "/home/ubuntu/JSON/back9" ]; then
  mv /home/ubuntu/JSON/back9 /home/ubuntu/JSON/back10
fi
if [ -d "/home/ubuntu/JSON/back8" ]; then
  mv /home/ubuntu/JSON/back8 /home/ubuntu/JSON/back9
fi
if [ -d "/home/ubuntu/JSON/back7" ]; then
  mv /home/ubuntu/JSON/back7 /home/ubuntu/JSON/back8
fi
if [ -d "/home/ubuntu/JSON/back6" ]; then
  mv /home/ubuntu/JSON/back6 /home/ubuntu/JSON/back7
fi
if [ -d "/home/ubuntu/JSON/back5" ]; then
  mv /home/ubuntu/JSON/back5 /home/ubuntu/JSON/back6
fi
if [ -d "/home/ubuntu/JSON/back4" ]; then
  mv /home/ubuntu/JSON/back4 /home/ubuntu/JSON/back5
fi
if [ -d "/home/ubuntu/JSON/back3" ]; then
  mv /home/ubuntu/JSON/back3 /home/ubuntu/JSON/back4
fi
if [ -d "/home/ubuntu/JSON/back2" ]; then
  mv /home/ubuntu/JSON/back2 /home/ubuntu/JSON/back3
fi
if [ -d "/home/ubuntu/JSON/back1" ]; then
  mv /home/ubuntu/JSON/back1 /home/ubuntu/JSON/back2
fi
if [ -d "/home/ubuntu/JSON/back" ]; then
  mv /home/ubuntu/JSON/back /home/ubuntu/JSON/back1
fi
cp -r /ndata/JSON /home/ubuntu/JSON/back
echo "!Hurray Backup completed"

#!/bin/bash
for i in `ls`
do
  if [ -d $i ]
  then
    echo -n "`pwd`/$i,"
  fi
done

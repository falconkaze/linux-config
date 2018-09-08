#!/usr/bin/env bash

directory_name="/home/mobvoi/git/github/2018-notebook/"
#cd $directory_name
name=${directory_name}$1

if [ -d $name ]
then
  cd $name
elif [ -f $name ]
then
  vim $name
else
  cd $directory_name
  echo 'error'
fi

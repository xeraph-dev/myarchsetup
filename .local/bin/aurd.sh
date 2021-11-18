#!/bin/bash

if [ -z $AUR_PATH ]; then
  echo "Please set AUR_PATH in your envs"
  exit 1
fi

if [ -z $1 ]; then
  echo "Missing package name"
  exit 1
fi

package_path="$AUR_PATH/$1"

if [ -d $package_path ]; then
  printf "You're sure that you want to delete package $1? (y/N) "; read line
  if [ $line = "y" ]; then
    rm -rf $package_path
    echo "Directory $package_path deleted"
    exit 0
  elif [ -z $line  ] || [ $line = "n" ]; then
    echo "Exiting" 
   exit 0
  fi
else
  echo "Package $package_path does not exists"
fi

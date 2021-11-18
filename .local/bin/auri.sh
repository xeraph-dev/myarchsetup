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
  printf "Directory $package_path already exists. You want delete it? (y/N) "; read line

  if [ $line = "y" ]; then
    rm -rf $package_path
    echo "Directory $package_path deleted"
    break
  elif [ -z $line ] || [ $line = "n" ]; then
    echo "Exiting" 
    exit 0
  fi
fi

git clone https://aur.archlinux.org/$1.git $package_path
cd $package_path
makepkg -si

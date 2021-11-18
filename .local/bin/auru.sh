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
  cd $package_path
  if [ -d $package_path  ]: then  
else
  echo "Package $package_path does not exists"
fi

#!/usr/bin/env bash

# Check if running as root
# If not, ask for root password
if [ "$(id -u)" != 0 ]
then
   sudo bash "$0"
   exit 1
fi

successFail() {
if [ $? -eq 0 ]
then
	echo -e "\nDone.\n"
	extract -h
else
	echo -e "\nSome error occurred performing the task.\n"
	exit 1
fi
}

echo -e "Installing ..."
cp extract.sh /usr/bin/extract
successFail

echo -e "Fixing permissions ..."
chmod +x /usr/bin//extract
successFail

exit 0
#!/usr/bin/env bash

hasCommand() {
if ! [ -x "$(command -v "$1")" ]
then
  echo -e "\n$1 package does not exist. Please install it first and try again.\n"
  echo -e "Exiting script ...\n"
  exit 1
fi
}

successFail() {
if [ $? -eq 0 ]
then
	echo -e "\nDone.\n"
else
	echo -e "\nSome error occurred performing the task.\n"
fi
}

# Show usage
usage() {
cat << EOF

Usage: extract <file name>

A better way to extract compressed files in terminal.

Example: extract backup.zip

EOF
}

extract() {
  if [ -f "$1" ]
  then
    cd "$(dirname "$1")" || exit

    case $1 in

      *.zip | *.ZIP)
        hasCommand unzip
        unzip "$1"
        successFail
      ;;

      *.rar | *.RAR | *.7z | *.iso | *.ISO)
        hasCommand 7z
        7z x "$1"
        successFail
      ;;

      *.tar)
        hasCommand tar
        tar -xvf "$1"
        successFail
      ;;

      *.tar.bz2 | *.tbz2)
        hasCommand tar
        tar -xjvf "$1"
        successFail
      ;;

      *.tar.gz | *.tgz)
        hasCommand tar
        tar -xzvf "$1"
        successFail
      ;;

      *.tar.xz | *.txz)
        hasCommand tar
        tar -xJvf "$1"
        successFail
      ;;

      *.xz)
        hasCommand xz
        xz -d "$1"
        successFail
      ;;

      *.bz2)
        hasCommand bunzip2
        bzip2 -dk "$1"
        successFail
      ;;

      *.gz)
        hasCommand gzip
        gzip -d "$1"
        successFail
      ;;

      *.Z)
        hasCommand uncompress
        uncompress -k "$1"
        successFail
      ;;

      *.dmg)
        hasCommand hdiutil
        hdiutil mount "$1"
        successFail
      ;;

      *.pax)
        hasCommand pax
        pax -rvf "$1"
        successFail
      ;;

      *)
        echo "$1 cannot be extracted"
      ;;

    esac

  else
    echo "$1 does not exist"
  fi
}

while getopts :h option
do
  case "$option" in

  h)
    usage
    exit 0
  ;;

  *)
  	echo -e "\nInvalid option\n"
  	echo -e "Try 'extract -h' for more information.\n"
  	exit 1
  ;;

  esac
done

extract "$1"

exit 0
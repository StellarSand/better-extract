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

Usage:
extract <file>
extract <file> -d <directory>

A better way to extract compressed files in terminal.

Options:
  -h, --help      Show this help message
  -d, --dir       Extract to a specified directory

Examples:
extract backup.zip
extract backup.zip -d /home/user/Downloads
extract backup.zip --dir /home/user/Downloads

EOF
}

extract() {
  if [ -f "$1" ]
  then
    # If extract dir provided, extract to that dir
    # else extract to same dir as the file
    if [ -z "$Extract_Dir" ]
    then
      Extract_Dir=$(dirname "$1")
    fi

    case $1 in

      *.[zZ][iI][pP])
        hasCommand unzip
        unzip "$1" -d "$Extract_Dir"
        successFail
      ;;

      *.[rR][aA][rR] | *.7[zZ] | *.[iI][sS][oO])
        hasCommand 7z
        7z x "$1" -o "$Extract_Dir"
        successFail
      ;;

      *.tar)
        hasCommand tar
        tar -xvf "$1" -C "${Extract_Dir}"
        successFail
      ;;

      *.tar.bz2 | *.tbz2)
        hasCommand tar
        tar -xjvf "$1" -C "${Extract_Dir}"
        successFail
      ;;

      *.tar.gz | *.tgz)
        hasCommand tar
        tar -xzvf "$1" -C "${Extract_Dir}"
        successFail
      ;;

      *.tar.xz | *.txz)
        hasCommand tar
        tar -xJvf "$1" -C "${Extract_Dir}"
        successFail
      ;;

      *.xz)
        hasCommand xz
        xz -dv "$1" -C "${Extract_Dir}"
        successFail
      ;;

      *.bz2)
        hasCommand bunzip2
        bzip2 -dk "$1" -c > "${Extract_Dir}"
        successFail
      ;;

      *.gz)
        hasCommand gzip
        gzip -dc "$1" > "${Extract_Dir}"
        successFail
      ;;

      *.[zZ])
        hasCommand uncompress
        uncompress -k "$1" -o "${Extract_Dir}"
        successFail
      ;;

      *.[dD][mM][gG])
        hasCommand hdiutil
        hdiutil mount "$1"
        successFail
        if [ -n "$Extract_Dir" ]
        then
          cp -R /Volumes/"${1%.dmg}" "$Extract_Dir"
          hdiutil unmount /Volumes/"${1%.dmg}"
        fi
      ;;

      *.pax)
        hasCommand pax
        pax -rvf "$1" | sed "s/^/$Extract_Dir//g" #Replace beginning of filename with dir
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

# Initialize variables
Extract_Dir=""

# Process options
while [ $# -gt 0 ]
do
  case "$1" in

  -h | --help)
    usage
    exit 0
  ;;

  -d | --dir)
    Extract_Dir="$2"
    shift 2
  ;;

  -*)
  	echo -e "\nInvalid option: $1\n"
  	echo -e "Try 'extract -h' for more information.\n"
  	exit 1
  ;;

  *)
    # Assume anything else is the filename
    File="$1"
    shift
  ;;

  esac
done

if [ -n "$File" ]
then
  if [ -n "$Extract_Dir" ] && ! [ -d "$Extract_Dir" ]
    then
        echo "Directory $Extract_Dir does not exist."
        echo "Please enter a valid directory path."
        exit 1
      fi

      extract "$File"
else
  # No file name provided, show usage
  usage
fi

exit 0
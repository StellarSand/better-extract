#!/usr/bin/env bash

hasCommand() {
if ! [ -x "$(command -v "$1")" ]
then
  echo -e "\n$1 package does not exist. Please install it first and try again."
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
extract <file1> <file2> <file3>
extract <file> -d <directory>

A better way to extract compressed extract_files in terminal.

Options:
  -h, --help            Show this help message
  -d, --directory       Extract to a specified directory

Examples:
extract backup.zip
extract backup1.zip backup2.zip backup3.zip
extract backup.zip -d /home/user/Downloads

NOTE:
Since extracting multiple files is done in parallel,
it might use a lot of system resources if too many extract_files are processed.

EOF
}

extract() {
    # If extract dir provided, extract to that dir
    # else extract to same dir as the file
    if [ -z "$extract_dir" ]
    then
      extract_dir=$(dirname "$1")
    fi

    case $1 in

      *.[zZ][iI][pP])
        hasCommand unzip
        unzip "$1" -d "$extract_dir"
      ;;

      *.[rR][aA][rR] | *.7[zZ] | *.[iI][sS][oO])
        hasCommand 7z
        7z x "$1" -o "$extract_dir"
      ;;

      *.tar)
        hasCommand tar
        tar -xvf "$1" -C "$extract_dir"
      ;;

      *.tar.bz2 | *.tbz2)
        hasCommand tar
        tar -xjvf "$1" -C "$extract_dir"
      ;;

      *.tar.gz | *.tgz)
        hasCommand tar
        tar -xzvf "$1" -C "$extract_dir"
      ;;

      *.tar.xz | *.txz)
        hasCommand tar
        tar -xJvf "$1" -C "$extract_dir"
      ;;

      *.xz)
        hasCommand xz
        xz -dv "$1" -C "$extract_dir"
      ;;

      *.bz2)
        hasCommand bunzip2
        bzip2 -dk "$1" -c > "$extract_dir"
      ;;

      *.gz)
        hasCommand gzip
        gzip -dc "$1" > "$extract_dir"
      ;;

      *.[zZ])
        hasCommand uncompress
        uncompress -k "$1" -o "$extract_dir"
      ;;

      *.pax)
        hasCommand pax
        pax -rvf "$1" | sed "s/^/$extract_dir//g" #Replace beginning of filename with dir
      ;;

      *)
        echo "$1 cannot be extracted"
      ;;

    esac

    successFail
}

# Initialize variables
extract_dir=""
extract_files=()

# If no options provided, show usage
if [ $# -eq 0 ]
then
  usage
  exit 0
fi

# Process options
while [ $# -gt 0 ]
do
  case "$1" in

  -h | --help)
    usage
    exit 0
  ;;

  -d | --dir)
    extract_dir="$2"
    shift 2
  ;;

  -*)
  	echo -e "\nInvalid option: $1"
  	echo -e "Try 'extract -h' for more information.\n"
  	exit 1
  ;;

  *)
    break
  ;;

  esac
done

# Check if provided argument is directory or file
for arg in "$@"
do
  if [ "$arg" == "-d" ] || [ "$arg" == "--directory" ]
  then
    extract_dir="$2"
  elif [ -f "$arg" ]
  then
    extract_files+=("$arg")
  fi
  shift
done

# Check if directory exists
if [ -n "$extract_dir" ] && [ ! -d "$extract_dir" ]
  then
    echo -e "\nDirectory $extract_dir does not exist."
    echo -e "Exiting script ...\n"
    exit 1
fi

# For each file, perform extraction
for file in "${extract_files[@]}"
do
extract "$file" "$extract_dir" & # Spawns new process for every file
done
wait # Wait till all background processes finish before exiting script

exit 0
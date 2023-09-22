#!/usr/bin/env bash

# Copyright (C) 2023-present StellarSand

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
else
	echo -e "\nSome error occurred performing the task.\n"
	exit 1
fi
}

if [ -f /usr/bin/extract ]
then
  echo -e "Uninstalling ..."
  rm /usr/bin/extract
  successFail
else
  echo -e "File doesn't exist"
fi

exit 0
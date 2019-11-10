#!/bin/bash

if [ $# -lt 3 ]; then
  echo "Usage: ./format_usb.sh <mountpoint> <format_type (example:vfat)> <name (example: USB-DRIVE)>"
  exit 1
fi

function format_disk {
  local mount_point=$1
  local format_type=$2
  local drive_name=$3

  echo "Starting to format $mount_point $format_type $drive_name"
  umount $mount_point
  mkfs.$format_type -n $drive_name $mount_point
  echo "Finised formatting "$mount_point
}

# run format_disk function as sudo
[ "$UID" -eq -1 ] || exec sudo bash -c "$(declare -f format_disk); format_disk $1 $2 $3"

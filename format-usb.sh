#!/bin/bash

if [ $# -lt 3 ]; then
  echo "Usage: ./format_usb.sh <mountpoint> <format_type (example:vfat)> <name (example: USB-DRIVE)>"
  echo "Examples:"
  echo "./format-usb.sh /dev/sda ntfs my-ntfs-usb"
  echo "./format-usb.sh /dev/sda fat my-fat-usb"
  exit 1
fi

function format_disk {
  local mount_point=$1
  local format_type=$2
  local drive_name=$3
  
  local format_type_arg=''

  echo $format_type

  if [[ $fomat_type == 'ntfs' ]]
  then
    format_type_arg='-l'
  else
    if [[ $fomat_type == 'vfat' ]] || [[ $format_type == 'fat' ]]
    then
      format_type_arg='-n'
      format_type='vfat'
    else
      if [[ $format_type == 'ext4' ]]
      then
        format_type_arg='-L'
      fi
    fi
  fi

  echo "Starting to format $mount_point $format_type $drive_name"
  umount $mount_point
  mkfs.$format_type $format_type_arg $drive_name $mount_point
  echo "Finised formatting "$mount_point
}

# run format_disk function as sudo
[ "$UID" -eq -1 ] || exec sudo bash -c "$(declare -f format_disk); format_disk $1 $2 $3"

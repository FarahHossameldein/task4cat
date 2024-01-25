#!/bin/bash
echo "Hello there, ${USER^}"
echo "I will now backup your home dir, $HOME"
currentdir=$(pwd)
echo "i will save the backup files in $currentdir"
tar -cf "$currentdir/my_backup_$(date +%d-%m-%Y_%H-%M-%S).tar" $HOME 2>/dev/null
echo "backup completed successsfully"
exit 0

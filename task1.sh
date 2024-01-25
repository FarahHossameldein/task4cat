#!/bin/bash
read -p "Enter the file path: " filepath

if [[ ! -f "$filepath" ]]; then
echo "File not found"
exit 
fi 

filesize=$(du -sh "$filepath" | awk '{print $1}')

filetype=$(file -b "$filepath")

filepermissions=$(stat -c "%A" "$filepath")

echo "File Path: $filepath"
echo "Size: $filesize"
echo "Type: $filetype"
echo "Permissions: $filepermissions"

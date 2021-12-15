#!/bin/bash

echo "1) backup
2) QR
3) ip
4) quit"
# Reading user's reply
read -p "Please select an option: " reply
if [ $reply == '1' ]; then
    today=$( date +%d-%m-%Y)
    # Name changes according to $today variable
    tar -czvf /tmp/Documents-backup-$today.tar.gz /home/$USER/Documents > /dev/null 2>&1
    echo Creating backup...
elif [ $reply == '2' ]; then
    read -p "Give the text for QR code: " QRtext
    echo $QRtext | curl qrcode.show -d @- >> /tmp/qr-file 2> /dev/null
    # Checking if the command succeeded and only then storing it into the qr-file
    if [ $? -eq 0 ]; then
        echo qr file saved to /tmp/qr-file
    fi
elif [ $reply == '3' ]; then
    echo $( curl icanhazip.com 2> /dev/null ) 
elif [ $reply == '4' ]; then   
    echo SEE YOU SPACE COWBOY ...
fi
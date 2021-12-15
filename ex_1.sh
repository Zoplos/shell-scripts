#!/bin/bash

#Silencing ALL output and running commands
date > /dev/null 2>&1 && du -h -s /home/$USER > /dev/null 2>&1

#Checking if the command succeeded
if [ $? -eq 0 ]; then
    #Echoing values in the file
    echo $( date ) >> ~/.hd_size
    echo $( du -h -s /home/$USER ) >> ~/.hd_size   
fi
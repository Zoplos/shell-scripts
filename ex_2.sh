#!/bin/bash

# Storing the result path in a variable
result=$( find $1 -size +$2 | sort -r | head -1)

# Checking whether the result exists
if [ "$result" != "" ]; then

    # Printing the size of the file with its path
    echo $( du -hs $result | cut -f1) $result

    # Asking user whether the file should be deleted
    read -p "rm: remove file '$result'?(yes/no): " reply

    # On a positive reply, deleting the file
    if [ $reply == 'yes' ]; then
        rm $result
    fi
else

    # Printing the correct output if there is no result
    echo "No result found!"
fi
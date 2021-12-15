#!/bin/bash

# last $USER --time-format iso | awk '{print $1, substr($4, 1, length($4)-15)}' | uniq

# last $USER --time-format iso | awk '{print substr($4, 1, length($4)-15)}' | head -n -2 | uniq -c | sort -k 2)
# echo $testvar
# last $USER --time-format iso | awk '{print substr($4, 1, length($4)-15)}' | head -n -2 | uniq -c | sort -k 2 | awk '{printf "%s\n%*s\n", $2, $1, "*"}'
# last $USER --time-format iso | awk '{print substr($4, 1, length($4)-15)}' | head -n -2 | uniq -c | sort -k 2 | awk '{ for(counter = 0; counter <= $1; counter++) printf("*") }' 
re='^[0-9]+$'
for OUTPUT in $(last $USER --time-format iso | awk '{print substr($4, 1, length($4)-15)}' | head -n -2 | uniq -c | sort -k 2 | awk '{printf "%s\n%d\n", $2, $1}')
do
    
    if ! [[ $OUTPUT =~ $re ]] ; then
        echo $OUTPUT
    else
        # echo | awk -v max='$OUTPUT' '{ for(counter = 0; counter <= max; counter++) printf("*") }'
        echo | awk -v max=$OUTPUT '{ for(counter = 0; counter < max; counter++) printf("*") }'
        echo
    fi
done
#!/bin/bash

totalSpace=$( df / | awk ' { print $2 } ' | tail -1)
usedSpace=$( du -s /home/$USER | awk '{ print $1 }')

echo "Root filesystem size: $(df -h / | awk ' { print $2 } ' | tail -1)"
echo "Home directory size: $(du -sh /home/$USER | awk '{ print $1 }')"

result=$( echo "scale=4; ($usedSpace/$totalSpace) * 100 " | bc )
# echo "$result" | scale=2 bc
echo "Home directory uses $result% of /"
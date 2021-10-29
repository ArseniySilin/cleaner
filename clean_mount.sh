#!/bin/bash

# Clean disk space if some percentage limit of usage is reached

fsLimit=80 # available fs usage percentage limit
mountName="/foo/bar" # directory name for clearing

percentage_used_int=$(grep -oE '[0-9]+%' <<<$(df ${mountName} | awk '{print $5}') | tr -d '%')

if [[ $percentage_used_int -gt $fsLimit ]]
then
    # run cleaning commands here
    echo "Disk space was cleared"
else 
    echo "Used disk space limit=${fsLimit}% is not reached, current usagee is ${percentage_used_int}%"
fi 

# 0 */4 * * * ~/cleaner.sh >> ~/cleaner.log 2>&1

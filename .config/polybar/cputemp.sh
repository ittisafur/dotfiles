#!/bin/bash

# Check CPU Stat via percentage
# grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}'

sensors | grep "Tctl" | tr -d '+' | awk '{print $2}'



CURRENT_VALUE=sensors | grep -i "fan1" | awk '{print $2}'
MAX_VALUE=3500
MIN_VALUE=0


# Show Percentage of Fan Usage  
sensors | grep -i "fan1" | awk '{print int(($2 / 3500) * 100 -1) }' | sed 's/$/%/' 

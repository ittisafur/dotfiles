#!/bin/bash

# Constants 
declare -r AMD_GPU=sensors | grep "amdgpu-pci-1f00"


# Check if Nvidia Driver is installed
# if nvidia-smi; then
#   delcare -r NVIDIA_GPU=nvidia-smi
# fi

# Check if AMD GPU is in use
# if $AMD_GPU; then
#   echo "AMD GPU in use $AMD_GPU"
# else
#   echo "AMD GPU not in use"
# fi

# amdgpu = sensors | grep "edge" | tr -d '+' | awk '{print $2}' 
# available-gpu = $nvidia || $amdgpu

# function check-gpu {
#     if [ $AMD_GPU ]; then
#         echo sensors | grep "edge" | tr -d '+' | awk '{print $2}' 
#         echo sensors | grep -i "edge" | awk '{print $2}' | cut -c 2-3 | xargs echo "°C"  
#     elif [ $NVIDIA_GPU ]; then
#       echo "Nividia GPU in use"
#     fi
# }

# check-gpu

sensors | grep "edge" | tr -d '+' | awk '{print $2}' 
# sensors | grep -i "edge" | awk '{print $2}' | cut -c 2-3 | xargs echo "°C"  
# if ! gputemp=$(nvidia-smi --format=nounits,csv,noheader --query-gpu=temperature.gpu | xargs echo); then
#     gputemp=0
# fi
# if [ "$gputemp" -gt 0 ]; then
#     echo "$gputemp°C"
# else
#     echo "$no nvidia driver installed"
# fi


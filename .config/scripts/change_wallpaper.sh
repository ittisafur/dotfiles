#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR=~/Pictures/Wallpapers

# Select a random wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name '*.jpg' -o -name '*.png' \) | shuf -n 1)

# Set the wallpaper with feh
feh --bg-scale "$WALLPAPER"

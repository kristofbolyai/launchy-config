#!/bin/bash
# This script is used to zip the contents of the folders of each folder in the configs folder

# Get the configs folder
CONFIGS=$(ls -d configs/*)

shopt -s dotglob
# Loop through the folders
for config in $CONFIGS; do
  # Get the name of the folder
  FOLDER_NAME=$(basename "$config")

  # if zip file does not exist
  if [ ! -f "output/$FOLDER_NAME.zip" ]; then
    # Change directory to the folder
    cd "$config" || exit

    # Zip the contents of the folder
    zip -r "../../output/$FOLDER_NAME.zip" -- * -x .DS_Store

    # Change directory back to the root
    cd ../..
  fi
done

# List the contents of the output folder
ls -l output

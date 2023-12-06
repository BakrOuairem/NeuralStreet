#!/bin/bash

# Version Python 
python -V

# Get the absolute path to the directory containing this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Specify the relative path to the folder you want to import
RELATIVE_FOLDER_PATH="source/pythonclient"

# Log folder 
LOG_FOLDER="logs"

echo "----------------------------- $(date) -----------------------------" >> "$SCRIPT_DIR/$LOG_FOLDER/build_logs.txt"

# Construct the absolute path using os.path
ABSOLUTE_FOLDER_PATH="$( cd "$SCRIPT_DIR/$RELATIVE_FOLDER_PATH" && pwd )"

# Current dir
cd $ABSOLUTE_FOLDER_PATH
pwd

# Run Python script with absolute path
echo "$(python "setup.py" install)" >> "$SCRIPT_DIR/$LOG_FOLDER/build_logs.txt"

# Running an install test
pip show ibapi
echo "$(pip show ibapi)" >> "$SCRIPT_DIR/$LOG_FOLDER/build_logs.txt"

echo "Logs are accessible on $SCRIPT_DIR/$LOG_FOLDER/build_logs.txt"
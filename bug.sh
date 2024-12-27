#!/bin/bash

# This script attempts to process files in a directory, but contains a subtle error.

find . -type f -print0 | while IFS= read -r -d $'
0' file; do
  echo "Processing: $file"
  # Some file processing operations, which may fail for some files... (e.g. `head -n 10 $file`) 
done
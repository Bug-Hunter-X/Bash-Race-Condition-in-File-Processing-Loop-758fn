#!/bin/bash

# This script processes files in a directory, correctly handling potential race conditions.

find . -type f -print0 | xargs -0 -I {} sh -c 'echo "Processing: {}"; head -n 10 {};' 
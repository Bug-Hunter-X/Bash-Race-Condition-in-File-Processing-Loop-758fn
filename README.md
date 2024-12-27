# Bash Race Condition in File Processing Loop

This repository demonstrates a subtle race condition that can occur in bash scripts when processing files found using `find` within a loop.  The script attempts to iterate through all files in the current directory, but due to the way the `find` command interacts with the loop, it might miss files or encounter unexpected behavior if the directory's contents are modified during script execution (e.g., by another process adding or removing files).

The `bug.sh` file contains the buggy code, and `bugSolution.sh` provides a corrected version using `find`'s `-exec` option to avoid the race condition.

## Bug Explanation

The race condition arises because the `find` command populates a process substitution, which is executed asynchronously from the loop.  If another process modifies the directory while the loop is iterating, the loop could either skip files or process the wrong ones.  Therefore, the `while` loop might not iterate across all files identified by `find`. 

## Solution

The solution uses `find ... -exec` to avoid the race condition. Each file is processed individually by a separate subshell, ensuring the execution order is handled correctly, preventing any race conditions.
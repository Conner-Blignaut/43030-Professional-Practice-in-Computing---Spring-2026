#!/bin/bash

echo "Starting Frequency Analyzer..."

# Running the Python frequency analyzer
FREQ_RESULT=$(python3 /app/.github/scripts/frequency.py /app/data.txt)
echo "Result: $FREQ_RESULT"

# Running update_readme.sh
bash /app/.github/scripts/update_readme.sh "$FREQ_RESULT" "$GITHUB_USER"

echo "Process Completed!"

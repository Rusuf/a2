#!/bin/bash

# Function to make a commit for a specific date
make_commit() {
    date=$1
    # Create or modify a file
    echo "Update on $date" >> temp.txt
    # Add and commit with the specified date
    git add temp.txt
    GIT_AUTHOR_DATE="$date" GIT_COMMITTER_DATE="$date" git commit -m "Update on $date"
}

# Starting from April last year
start_date="2023-04-01"
end_date="2024-04-19"

# Convert dates to seconds since epoch
start_seconds=$(date -d "$start_date" +%s)
end_seconds=$(date -d "$end_date" +%s)

# Make commits for random days
for ((d=start_seconds; d<=end_seconds; d+=86400)); do
    # Randomly decide whether to make a commit (30% probability)
    if [ $((RANDOM % 100)) -lt 30 ]; then
        commit_date=$(date -d "@$d" "+%Y-%m-%d 12:00:00 +0000")
        make_commit "$commit_date"
    fi
done

# Clean up
rm temp.txt 
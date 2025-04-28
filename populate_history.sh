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

# Starting from January 2022 to current date in 2025
start_date="2022-01-01"
end_date="2025-04-19"

# Make commits for time periods with different frequencies
# 2022-2023: Very low activity (5-10%)
for month in {1..24}; do
    # Calculate year and month
    year=$((2022 + (month-1) / 12))
    mon=$(((month-1) % 12 + 1))
    
    # Generate 1-3 commits per month for 2022-2023 (beginner period)
    commits_this_month=$((1 + RANDOM % 3))
    
    for ((i=1; i<=commits_this_month; i++)); do
        # Random day in month (1-28 to avoid date issues)
        day=$((1 + RANDOM % 28))
        # Random hour (9-20)
        hour=$((9 + RANDOM % 12))
        # Random minute
        minute=$((RANDOM % 60))
        
        # Format date for Git
        commit_date="$year-$(printf "%02d" $mon)-$(printf "%02d" $day) $(printf "%02d" $hour):$(printf "%02d" $minute):00 +0000"
        make_commit "$commit_date"
    done
done

# Jan-May 2024: Gradually increasing activity (10-20%)
for month in {1..5}; do
    # Calculate day in each month
    mon=$month
    
    # Generate 3-6 commits per month for transition period
    commits_this_month=$((3 + RANDOM % 4))
    
    for ((i=1; i<=commits_this_month; i++)); do
        day=$((1 + RANDOM % 28))
        hour=$((9 + RANDOM % 12))
        minute=$((RANDOM % 60))
        
        commit_date="2024-$(printf "%02d" $mon)-$(printf "%02d" $day) $(printf "%02d" $hour):$(printf "%02d" $minute):00 +0000"
        make_commit "$commit_date"
    done
done

# June-Dec 2024: More consistent activity (20-35%)
for month in {6..12}; do
    # Generate 6-10 commits per month for the consistent period
    commits_this_month=$((6 + RANDOM % 5))
    
    for ((i=1; i<=commits_this_month; i++)); do
        day=$((1 + RANDOM % 28))
        hour=$((9 + RANDOM % 12))
        minute=$((RANDOM % 60))
        
        commit_date="2024-$(printf "%02d" $month)-$(printf "%02d" $day) $(printf "%02d" $hour):$(printf "%02d" $minute):00 +0000"
        make_commit "$commit_date"
    done
done

# 2025: Consistent higher activity (30-45%)
for month in {1..4}; do
    # Generate 8-12 commits per month for 2025
    commits_this_month=$((8 + RANDOM % 5))
    
    for ((i=1; i<=commits_this_month; i++)); do
        day=$((1 + RANDOM % 28))
        hour=$((9 + RANDOM % 12))
        minute=$((RANDOM % 60))
        
        commit_date="2025-$(printf "%02d" $month)-$(printf "%02d" $day) $(printf "%02d" $hour):$(printf "%02d" $minute):00 +0000"
        make_commit "$commit_date"
    done
done

# Clean up
rm temp.txt
echo "Commit history populated from 2022 to 2025 with gradual improvement pattern." 
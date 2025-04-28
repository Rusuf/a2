# First, configure git
git config --global user.name "Rusuf"
git config --global user.email "your.github@email.com"  # Replace with your actual GitHub email

# Function to make a commit for a specific date
function Make-Commit {
    param (
        [string]$date
    )
    # Create or modify a file
    Add-Content -Path "temp.txt" -Value "Update on $date"
    # Add and commit with the specified date
    git add temp.txt
    $env:GIT_AUTHOR_DATE = $date
    $env:GIT_COMMITTER_DATE = $date
    git commit -m "Update on $date"
}

# Starting from January 2022 to current date in 2025
$start_date = "2022-01-01"
$end_date = "2025-04-19"

# Make commits for time periods with different frequencies
# 2022-2023: Very low activity (5-10%)
for ($month = 1; $month -le 24; $month++) {
    # Calculate year and month
    $year = [math]::Floor(2022 + ($month-1) / 12)
    $mon = (($month-1) % 12) + 1
    
    # Generate 1-3 commits per month for 2022-2023 (beginner period)
    $commits_this_month = 1 + (Get-Random -Minimum 0 -Maximum 3)
    
    for ($i = 1; $i -le $commits_this_month; $i++) {
        # Random day in month (1-28 to avoid date issues)
        $day = 1 + (Get-Random -Minimum 0 -Maximum 28)
        # Random hour (9-20)
        $hour = 9 + (Get-Random -Minimum 0 -Maximum 12)
        # Random minute
        $minute = Get-Random -Minimum 0 -Maximum 60
        
        # Format date for Git
        $commit_date = "$year-{0:D2}-{1:D2} {2:D2}:{3:D2}:00 +0000" -f $mon, $day, $hour, $minute
        Make-Commit -date $commit_date
    }
}

# Jan-May 2024: Gradually increasing activity (10-20%)
for ($month = 1; $month -le 5; $month++) {
    # Generate 3-6 commits per month for transition period
    $commits_this_month = 3 + (Get-Random -Minimum 0 -Maximum 4)
    
    for ($i = 1; $i -le $commits_this_month; $i++) {
        $day = 1 + (Get-Random -Minimum 0 -Maximum 28)
        $hour = 9 + (Get-Random -Minimum 0 -Maximum 12)
        $minute = Get-Random -Minimum 0 -Maximum 60
        
        $commit_date = "2024-{0:D2}-{1:D2} {2:D2}:{3:D2}:00 +0000" -f $month, $day, $hour, $minute
        Make-Commit -date $commit_date
    }
}

# June-Dec 2024: More consistent activity (20-35%)
for ($month = 6; $month -le 12; $month++) {
    # Generate 6-10 commits per month for the consistent period
    $commits_this_month = 6 + (Get-Random -Minimum 0 -Maximum 5)
    
    for ($i = 1; $i -le $commits_this_month; $i++) {
        $day = 1 + (Get-Random -Minimum 0 -Maximum 28)
        $hour = 9 + (Get-Random -Minimum 0 -Maximum 12)
        $minute = Get-Random -Minimum 0 -Maximum 60
        
        $commit_date = "2024-{0:D2}-{1:D2} {2:D2}:{3:D2}:00 +0000" -f $month, $day, $hour, $minute
        Make-Commit -date $commit_date
    }
}

# 2025: Consistent higher activity (30-45%)
for ($month = 1; $month -le 4; $month++) {
    # Generate 8-12 commits per month for 2025
    $commits_this_month = 8 + (Get-Random -Minimum 0 -Maximum 5)
    
    for ($i = 1; $i -le $commits_this_month; $i++) {
        $day = 1 + (Get-Random -Minimum 0 -Maximum 28)
        $hour = 9 + (Get-Random -Minimum 0 -Maximum 12)
        $minute = Get-Random -Minimum 0 -Maximum 60
        
        $commit_date = "2025-{0:D2}-{1:D2} {2:D2}:{3:D2}:00 +0000" -f $month, $day, $hour, $minute
        Make-Commit -date $commit_date
    }
}

# Clean up
Remove-Item -Path "temp.txt" -Force -ErrorAction SilentlyContinue
Write-Host "Commit history populated from 2022 to 2025 with gradual improvement pattern." 
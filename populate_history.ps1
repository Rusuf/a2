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
# 2022: Almost no activity (1-2%)
for ($month = 1; $month -le 12; $month++) {
    # Only 20% chance of making any commits this month for 2022
    $random = Get-Random -Minimum 1 -Maximum 100
    if ($random -le 20) {
        # Generate 0-1 commits for this month (very sparse)
        $commits_this_month = Get-Random -Minimum 0 -Maximum 2
        
        for ($i = 1; $i -le $commits_this_month; $i++) {
            $day = 1 + (Get-Random -Minimum 0 -Maximum 28)
            $hour = 9 + (Get-Random -Minimum 0 -Maximum 12)
            $minute = Get-Random -Minimum 0 -Maximum 60
            
            $commit_date = "2022-{0:D2}-{1:D2} {2:D2}:{3:D2}:00 +0000" -f $month, $day, $hour, $minute
            Make-Commit -date $commit_date
        }
    }
}

# 2023: Very low activity (2-5%)
for ($month = 1; $month -le 12; $month++) {
    # Only 40% chance of making any commits this month for 2023
    $random = Get-Random -Minimum 1 -Maximum 100
    if ($random -le 40) {
        # Generate 0-2 commits for this month (still sparse)
        $commits_this_month = Get-Random -Minimum 0 -Maximum 3
        
        for ($i = 1; $i -le $commits_this_month; $i++) {
            $day = 1 + (Get-Random -Minimum 0 -Maximum 28)
            $hour = 9 + (Get-Random -Minimum 0 -Maximum 12)
            $minute = Get-Random -Minimum 0 -Maximum 60
            
            $commit_date = "2023-{0:D2}-{1:D2} {2:D2}:{3:D2}:00 +0000" -f $month, $day, $hour, $minute
            Make-Commit -date $commit_date
        }
    }
}

# Jan-May 2024: Gradually increasing activity (5-10%)
for ($month = 1; $month -le 5; $month++) {
    # 60% chance of making commits this month
    $random = Get-Random -Minimum 1 -Maximum 100
    if ($random -le 60) {
        # Generate 1-3 commits for this month
        $commits_this_month = 1 + (Get-Random -Minimum 0 -Maximum 3)
        
        for ($i = 1; $i -le $commits_this_month; $i++) {
            $day = 1 + (Get-Random -Minimum 0 -Maximum 28)
            $hour = 9 + (Get-Random -Minimum 0 -Maximum 12)
            $minute = Get-Random -Minimum 0 -Maximum 60
            
            $commit_date = "2024-{0:D2}-{1:D2} {2:D2}:{3:D2}:00 +0000" -f $month, $day, $hour, $minute
            Make-Commit -date $commit_date
        }
    }
}

# June-Dec 2024: More consistent activity (10-15%)
for ($month = 6; $month -le 12; $month++) {
    # 75% chance of making commits this month
    $random = Get-Random -Minimum 1 -Maximum 100
    if ($random -le 75) {
        # Generate 2-4 commits for this month
        $commits_this_month = 2 + (Get-Random -Minimum 0 -Maximum 3)
        
        for ($i = 1; $i -le $commits_this_month; $i++) {
            $day = 1 + (Get-Random -Minimum 0 -Maximum 28)
            $hour = 9 + (Get-Random -Minimum 0 -Maximum 12)
            $minute = Get-Random -Minimum 0 -Maximum 60
            
            $commit_date = "2024-{0:D2}-{1:D2} {2:D2}:{3:D2}:00 +0000" -f $month, $day, $hour, $minute
            Make-Commit -date $commit_date
        }
    }
}

# 2025: Consistent but moderate activity (15-20%)
for ($month = 1; $month -le 4; $month++) {
    # 90% chance of making commits this month
    $random = Get-Random -Minimum 1 -Maximum 100
    if ($random -le 90) {
        # Generate 3-5 commits for this month
        $commits_this_month = 3 + (Get-Random -Minimum 0 -Maximum 3)
        
        for ($i = 1; $i -le $commits_this_month; $i++) {
            $day = 1 + (Get-Random -Minimum 0 -Maximum 28)
            $hour = 9 + (Get-Random -Minimum 0 -Maximum 12)
            $minute = Get-Random -Minimum 0 -Maximum 60
            
            $commit_date = "2025-{0:D2}-{1:D2} {2:D2}:{3:D2}:00 +0000" -f $month, $day, $hour, $minute
            Make-Commit -date $commit_date
        }
    }
}

# Clean up
Remove-Item -Path "temp.txt" -Force -ErrorAction SilentlyContinue
Write-Host "Commit history populated from 2022 to 2025 with a more realistic sparse pattern." 
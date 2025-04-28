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

# Starting from April last year
$start_date = "2023-04-01"
$end_date = "2024-04-19"

# Convert dates to seconds since epoch
$start_seconds = (Get-Date $start_date).ToUniversalTime().Subtract((Get-Date "1970-01-01")).TotalSeconds
$end_seconds = (Get-Date $end_date).ToUniversalTime().Subtract((Get-Date "1970-01-01")).TotalSeconds

# Make commits for random days
$day_seconds = 86400
$current_seconds = $start_seconds

while ($current_seconds -le $end_seconds) {
    # Randomly decide whether to make a commit (30% probability)
    if ((Get-Random -Minimum 0 -Maximum 100) -lt 30) {
        $commit_date = (Get-Date "1970-01-01").AddSeconds($current_seconds).ToUniversalTime().ToString("yyyy-MM-dd HH:mm:ss +0000")
        Write-Host "Making commit for $commit_date"
        Make-Commit -date $commit_date
    }
    $current_seconds += $day_seconds
}

# Clean up
Remove-Item -Path "temp.txt" -Force 
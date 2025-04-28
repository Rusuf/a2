# First, configure git
git config --global user.name "Rusuf"
git config --global user.email "your.github@email.com"  # Replace with your actual GitHub email

# Function to make a commit for a specific date
function Make-Commit {
    param($date)
    # Create or modify a file
    Add-Content -Path "temp.txt" -Value "Update on $date"
    # Add and commit with the specified date
    git add temp.txt
    $env:GIT_AUTHOR_DATE = $date
    $env:GIT_COMMITTER_DATE = $date
    git commit -m "Update on $date"
}

# Starting from April 2024
$startDate = Get-Date "2024-04-19"
$endDate = Get-Date "2025-04-19"
$currentDate = $startDate

# Make commits for random days
while ($currentDate -le $endDate) {
    # Randomly decide whether to make a commit (30% probability)
    if ((Get-Random -Minimum 1 -Maximum 100) -lt 30) {
        $commitDate = $currentDate.ToString("yyyy-MM-dd 12:00:00 +0000")
        Make-Commit $commitDate
    }
    $currentDate = $currentDate.AddDays(1)
}

# Clean up
Remove-Item temp.txt 
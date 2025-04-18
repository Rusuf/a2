# PowerShell script to create backdated commits
$dates = @(
    "2024-01-01T10:00:00",
    "2024-01-15T14:30:00",
    "2024-02-01T09:15:00"
)

$messages = @(
    "Initial project setup and documentation",
    "Added performance optimizations",
    "Security updates and improvements"
)

for ($i = 0; $i -lt $dates.Count; $i++) {
    $date = $dates[$i]
    $message = $messages[$i]
    $filename = "update_$i.md"
    
    Set-Content -Path $filename -Value "Update $i - $message"
    git add $filename
    $env:GIT_AUTHOR_DATE = $date
    $env:GIT_COMMITTER_DATE = $date
    git commit -m $message
} 


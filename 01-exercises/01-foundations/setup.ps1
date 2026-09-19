$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$PracticeRoot = Join-Path (Split-Path (Split-Path $ScriptDir -Parent) -Parent) "practice-areas"
$ExerciseName = "01-foundations"
$TargetDir = Join-Path $PracticeRoot $ExerciseName

if (Test-Path $TargetDir) {
    Remove-Item -Recurse -Force $TargetDir
}
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Set-Location $TargetDir

Write-Host "Sandbox created at: $TargetDir" -ForegroundColor Green
Write-Host "Please 'cd' into this directory in your terminal to begin your exercise!" -ForegroundColor Yellow
Write-Host "`n========================================="
Write-Host "           EXERCISE INSTRUCTIONS           "
Write-Host "========================================="
Write-Host "1. Initialize a git repository here."
Write-Host "2. Create a file named 'hello.txt' containing the text 'Hello Git!'."
Write-Host "3. Check the git status."
Write-Host "4. Add the file to the staging area."
Write-Host "5. Commit it with the message 'Initial commit'."
Write-Host "6. Create a '.gitignore' file configured to ignore '*.log' files."
Write-Host "7. Create a file named 'test.log' and run 'git status' to ensure it is ignored."
Write-Host "8. Add and commit the '.gitignore' file."
Write-Host "9. Run a git log command to view the commit history in a one-line, compact format."
Write-Host "10. Self-check: You should see exactly 2 commits in the log."
Write-Host "========================================="
Write-Host "`n(If you get stuck, check learn-git/solutions/01-exercises/01-foundations-solution.md)"

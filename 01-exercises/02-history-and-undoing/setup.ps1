$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$PracticeRoot = Join-Path (Split-Path (Split-Path $ScriptDir -Parent) -Parent) "practice-areas"
$ExerciseName = "02-history"
$TargetDir = Join-Path $PracticeRoot $ExerciseName

if (Test-Path $TargetDir) {
    Remove-Item -Recurse -Force $TargetDir
}
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Set-Location $TargetDir

# Setup repo
git init | Out-Null
Set-Content -Path "app.txt" -Value "Version 1`n"
git add app.txt
git commit -m "Initial commit" | Out-Null

Add-Content -Path "app.txt" -Value "Version 2`n"
git add app.txt
git commit -m "Add version 2 feature" | Out-Null

Add-Content -Path "app.txt" -Value "Version 3 (MISTAKE)`n"
git add app.txt
git commit -m "Add version 3 with a bug" | Out-Null

# Leave some uncommitted changes
Add-Content -Path "app.txt" -Value "WIP code for version 4..."

Write-Host "Sandbox created at: $TargetDir" -ForegroundColor Green
Write-Host "Please 'cd' into this directory in your terminal to begin your exercise!" -ForegroundColor Yellow
Write-Host "`n========================================="
Write-Host "           EXERCISE INSTRUCTIONS           "
Write-Host "========================================="
Write-Host "1. Run 'git log --oneline' to see the 3 commits."
Write-Host "2. You have unstaged changes in app.txt. View the exact line changes using diff."
Write-Host "3. You realize you need to fix a bug immediately but aren't ready to commit the WIP code. Stash your changes."
Write-Host "4. Check that your working directory is clean using 'git status'."
Write-Host "5. We need to undo the last commit ('Add version 3 with a bug'). We haven't pushed it, so we can rewrite history. Use 'git reset --hard' to go back one commit (to 'Add version 2 feature')."
Write-Host "6. Check 'git log --oneline' to verify the mistake commit is gone."
Write-Host "7. Now that the bug is 'fixed' (by reverting the commit), pop your stashed changes back into your working directory."
Write-Host "8. Self-check: 'app.txt' should now contain Version 1, Version 2, and your WIP code."
Write-Host "========================================="
Write-Host "`n(If you get stuck, check learn-git/solutions/01-exercises/02-history-and-undoing-solution.md)"

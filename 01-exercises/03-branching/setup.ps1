$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$PracticeRoot = Join-Path (Split-Path (Split-Path $ScriptDir -Parent) -Parent) "practice-areas"
$ExerciseName = "03-branching"
$TargetDir = Join-Path $PracticeRoot $ExerciseName

if (Test-Path $TargetDir) {
    Remove-Item -Recurse -Force $TargetDir
}
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Set-Location $TargetDir

git init -b main | Out-Null
Set-Content -Path "index.html" -Value "<html>`n<body>`n  <h1>Welcome</h1>`n</body>`n</html>"
git add index.html
git commit -m "Initial commit" | Out-Null

Write-Host "Sandbox created at: $TargetDir" -ForegroundColor Green
Write-Host "Please 'cd' into this directory in your terminal to begin your exercise!" -ForegroundColor Yellow
Write-Host "`n========================================="
Write-Host "           EXERCISE INSTRUCTIONS           "
Write-Host "========================================="
Write-Host "1. Create a new branch called 'feature-header' and switch to it."
Write-Host "2. Edit 'index.html'. Change '<h1>Welcome</h1>' to '<h1>Welcome to Git</h1>'."
Write-Host "3. Add and commit this change with message 'Update header'."
Write-Host "4. Switch back to the 'main' branch."
Write-Host "5. Edit 'index.html' again. This time, change '<h1>Welcome</h1>' to '<h1>Hello World</h1>'."
Write-Host "6. Add and commit this change with message 'Change header to Hello World'."
Write-Host "7. Now, try to merge 'feature-header' into 'main'."
Write-Host "8. You will get a CONFLICT! Open 'index.html' in your text editor."
Write-Host "9. Resolve the conflict manually: keep whichever title you prefer, and remove the Git markers (<<<<, ====, >>>>)."
Write-Host "10. Add 'index.html' to the staging area and run 'git commit' to finalize the merge."
Write-Host "11. Self-check: Run 'git log --graph --oneline' to see the branching and merging visually."
Write-Host "========================================="
Write-Host "`n(If you get stuck, check learn-git/solutions/01-exercises/03-branching-solution.md)"

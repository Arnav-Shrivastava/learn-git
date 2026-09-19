$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$PracticeRoot = Join-Path (Split-Path (Split-Path $ScriptDir -Parent) -Parent) "practice-areas"
$ExerciseName = "05-advanced"
$TargetDir = Join-Path $PracticeRoot $ExerciseName

if (Test-Path $TargetDir) {
    Remove-Item -Recurse -Force $TargetDir
}
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Set-Location $TargetDir

git init -b main | Out-Null
Set-Content -Path "app.js" -Value "console.log('App started');`n"
git add app.js
git commit -m "Initial commit" | Out-Null

git switch -c feature/auth | Out-Null
Add-Content -Path "app.js" -Value "console.log('Auth initialized');`n"
git add app.js
git commit -m "feat: add authentication logic" | Out-Null

git switch main | Out-Null
# Force delete the branch, simulating a catastrophic mistake
git branch -D feature/auth | Out-Null

Write-Host "Sandbox created at: $TargetDir" -ForegroundColor Green
Write-Host "Please 'cd' into this directory in your terminal to begin!" -ForegroundColor Yellow
Write-Host "`n========================================="
Write-Host "           EXERCISE INSTRUCTIONS           "
Write-Host "========================================="
Write-Host "Context: You spent all day working on a 'feature/auth' branch."
Write-Host "You switched back to 'main' and accidentally ran 'git branch -D feature/auth'."
Write-Host "1. Check 'git branch'. The branch is gone."
Write-Host "2. Check 'git log'. Your commit 'feat: add authentication logic' is nowhere to be found."
Write-Host "3. Don't panic. Run 'git reflog' to view the local history of your HEAD pointer."
Write-Host "4. Look for the commit hash where you committed 'feat: add authentication logic'."
Write-Host "5. Use 'git checkout -b recovered-auth <hash>' to bring it back to life."
Write-Host "6. Self-check: Run 'git log --oneline' and verify the commit is back!"
Write-Host "========================================="
Write-Host "`n(If you get stuck, check learn-git/solutions/01-exercises/05-advanced-solution.md)"

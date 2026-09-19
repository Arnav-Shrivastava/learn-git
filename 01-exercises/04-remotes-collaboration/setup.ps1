$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$PracticeRoot = Join-Path (Split-Path (Split-Path $ScriptDir -Parent) -Parent) "practice-areas"
$ExerciseName = "04-remotes"
$TargetDir = Join-Path $PracticeRoot $ExerciseName

if (Test-Path $TargetDir) {
    Remove-Item -Recurse -Force $TargetDir
}
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Set-Location $TargetDir

# Create a "remote" bare repository
$RemoteDir = Join-Path $TargetDir "remote-repo.git"
New-Item -ItemType Directory -Force -Path $RemoteDir | Out-Null
Set-Location $RemoteDir
git init --bare -b main | Out-Null

# Create "developer A" (our setup) to seed the remote
$DevADir = Join-Path $TargetDir "dev-a"
New-Item -ItemType Directory -Force -Path $DevADir | Out-Null
Set-Location $DevADir
git init -b main | Out-Null
Set-Content -Path "app.js" -Value "console.log('App started');`n"
git add app.js
git commit -m "Initial commit" | Out-Null
git remote add origin $RemoteDir
git push -u origin main | Out-Null

# Create "your" local repository by cloning the remote
$YourRepo = Join-Path $TargetDir "my-repo"
Set-Location $TargetDir
git clone $RemoteDir my-repo | Out-Null

# Developer A pushes a new feature while you are away
Set-Location $DevADir
Add-Content -Path "app.js" -Value "console.log('Fetching data...');`n"
git add app.js
git commit -m "feat: add data fetching" | Out-Null
git push origin main | Out-Null

Set-Location $YourRepo

Write-Host "Sandbox created at: $YourRepo" -ForegroundColor Green
Write-Host "Please 'cd' into $YourRepo in your terminal to begin!" -ForegroundColor Yellow
Write-Host "`n========================================="
Write-Host "           EXERCISE INSTRUCTIONS           "
Write-Host "========================================="
Write-Host "Context: You are working in 'my-repo'. A teammate just pushed new code to the remote repository."
Write-Host "1. First, check your local log ('git log --oneline'). You will only see the initial commit."
Write-Host "2. We want to see what our teammate did WITHOUT modifying our files yet. Run 'git fetch origin'."
Write-Host "3. Now run 'git log origin/main --oneline' to view the teammate's commits on the remote-tracking branch."
Write-Host "4. Check your 'app.js' file. Notice it has NOT changed yet (fetch is safe!)."
Write-Host "5. Now, bring those changes into your local branch by running 'git pull origin main'."
Write-Host "6. Check 'app.js' again. The new code is here."
Write-Host "7. Add a new line to 'app.js': 'console.log(`'Done`');'."
Write-Host "8. Stage and commit it using a Conventional Commit message (e.g., 'feat: add done message')."
Write-Host "9. Push your changes back to the remote."
Write-Host "10. Self-check: Run 'git log --oneline' to verify your commit is at the top."
Write-Host "========================================="
Write-Host "`n(If you get stuck, check learn-git/solutions/01-exercises/04-remotes-collaboration-solution.md)"

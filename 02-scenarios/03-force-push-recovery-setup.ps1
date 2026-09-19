$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$PracticeRoot = Join-Path (Split-Path (Split-Path $ScriptDir -Parent) -Parent) "practice-areas"
$TargetDir = Join-Path $PracticeRoot "scenario-03"

if (Test-Path $TargetDir) { Remove-Item -Recurse -Force $TargetDir }
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Set-Location $TargetDir

# Setup remote
$RemoteDir = Join-Path $TargetDir "remote.git"
New-Item -ItemType Directory -Force -Path $RemoteDir | Out-Null
Set-Location $RemoteDir
git init --bare -b main | Out-Null

# Setup local
$LocalDir = Join-Path $TargetDir "local"
Set-Location $TargetDir
git clone $RemoteDir local | Out-Null
Set-Location $LocalDir

Set-Content -Path "base.txt" -Value "Base code"
git add base.txt
git commit -m "Initial commit" | Out-Null
git push origin main | Out-Null

# Alice pushes a commit directly to the remote (simulated locally)
Set-Location $RemoteDir
git clone . tmp-alice | Out-Null
Set-Location tmp-alice
Set-Content -Path "alice.txt" -Value "Alice's code"
git add alice.txt
git commit -m "feat: Alice's awesome feature" | Out-Null
git push origin main | Out-Null
Set-Location $RemoteDir
Remove-Item -Recurse -Force tmp-alice

# You fetch Alice's commit
Set-Location $LocalDir
git fetch origin | Out-Null
git pull origin main | Out-Null

# But you decide to rewrite history locally, dropping Alice's commit
git reset --hard HEAD~1 | Out-Null
Set-Content -Path "your.txt" -Value "Your code"
git add your.txt
git commit -m "feat: Your awesome feature" | Out-Null

# And you force push, wiping Alice's work from the remote
git push --force origin main | Out-Null

Write-Host "Broken scenario created at: $LocalDir" -ForegroundColor Green
Write-Host "Please 'cd' into $LocalDir to begin your rescue mission!" -ForegroundColor Yellow

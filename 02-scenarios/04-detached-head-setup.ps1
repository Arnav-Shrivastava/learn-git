$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$PracticeRoot = Join-Path (Split-Path (Split-Path $ScriptDir -Parent) -Parent) "practice-areas"
$TargetDir = Join-Path $PracticeRoot "scenario-04"

if (Test-Path $TargetDir) { Remove-Item -Recurse -Force $TargetDir }
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Set-Location $TargetDir

git init -b main | Out-Null
Set-Content -Path "file.txt" -Value "Day 1"
git add file.txt
git commit -m "Day 1 commit" | Out-Null

Set-Content -Path "file.txt" -Value "Day 2"
git add file.txt
git commit -m "Day 2 commit" | Out-Null

# Checkout the older commit to cause detached HEAD
git checkout HEAD~1 | Out-Null

# Write some uncommitted work
Set-Content -Path "algorithm.js" -Value "function brilliant() { return true; }"
git add algorithm.js

Write-Host "Broken scenario created at: $TargetDir" -ForegroundColor Green
Write-Host "Please 'cd' into this directory to begin your rescue mission!" -ForegroundColor Yellow

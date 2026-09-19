$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$PracticeRoot = Join-Path (Split-Path (Split-Path $ScriptDir -Parent) -Parent) "practice-areas"
$TargetDir = Join-Path $PracticeRoot "scenario-06"

if (Test-Path $TargetDir) { Remove-Item -Recurse -Force $TargetDir }
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Set-Location $TargetDir

git init -b main | Out-Null
Set-Content -Path "index.js" -Value "console.log('App init');"
git add index.js
git commit -m "Initial commit" | Out-Null

Set-Content -Path "login.js" -Value "function login() {}"
git add login.js
git commit -m "Add login page logic" | Out-Null

Write-Host "Broken scenario created at: $TargetDir" -ForegroundColor Green
Write-Host "Please 'cd' into this directory to begin your rescue mission!" -ForegroundColor Yellow

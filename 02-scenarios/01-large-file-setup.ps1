$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$PracticeRoot = Join-Path (Split-Path (Split-Path $ScriptDir -Parent) -Parent) "practice-areas"
$TargetDir = Join-Path $PracticeRoot "scenario-01"

if (Test-Path $TargetDir) { Remove-Item -Recurse -Force $TargetDir }
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Set-Location $TargetDir

git init -b main | Out-Null
Set-Content -Path "readme.txt" -Value "Project started.`n"
git add readme.txt
git commit -m "Initial commit" | Out-Null

# Simulate a large file
$largeFile = "database.sql"
Set-Content -Path $largeFile -Value "-- MASSIVE DATABASE DUMP --`n"
for ($i=0; $i -lt 1000; $i++) { Add-Content -Path $largeFile -Value "INSERT INTO users VALUES ('user$i');" }

Set-Content -Path "app.js" -Value "console.log('App running');"

git add app.js database.sql
git commit -m "Add app.js and accidentally commit database dump" | Out-Null

Write-Host "Broken scenario created at: $TargetDir" -ForegroundColor Green
Write-Host "Please 'cd' into this directory to begin your rescue mission!" -ForegroundColor Yellow

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$PracticeRoot = Join-Path (Split-Path (Split-Path $ScriptDir -Parent) -Parent) "practice-areas"
$TargetDir = Join-Path $PracticeRoot "scenario-05"

if (Test-Path $TargetDir) { Remove-Item -Recurse -Force $TargetDir }
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Set-Location $TargetDir

git init -b main | Out-Null
Set-Content -Path "readme.md" -Value "Project"
git add readme.md
git commit -m "Initial commit" | Out-Null

Set-Content -Path "db.sql" -Value "CREATE TABLE users (id INT);"
Set-Content -Path "styles.css" -Value "body { background: red; }"
git add db.sql styles.css
git commit -m "Stuff" | Out-Null

Write-Host "Broken scenario created at: $TargetDir" -ForegroundColor Green
Write-Host "Please 'cd' into this directory to begin your rescue mission!" -ForegroundColor Yellow

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$PracticeRoot = Join-Path (Split-Path (Split-Path $ScriptDir -Parent) -Parent) "practice-areas"
$TargetDir = Join-Path $PracticeRoot "scenario-02"

if (Test-Path $TargetDir) { Remove-Item -Recurse -Force $TargetDir }
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Set-Location $TargetDir

git init -b main | Out-Null
$initialCss = ".header { color: black; }`n.body { margin: 0; }`n.footer { padding: 10px; }"
Set-Content -Path "styles.css" -Value $initialCss
git add styles.css
git commit -m "Initial commit" | Out-Null

# Teammate changes main
$teammateCss = ".header { color: black; }`n.body { margin: 0; display: flex; }`n.footer { padding: 50px; }"
Set-Content -Path "styles.css" -Value $teammateCss
git add styles.css
git commit -m "Update footer padding" | Out-Null

# You created branch earlier and made changes
git branch feature/blue-theme HEAD~1 | Out-Null
git switch feature/blue-theme | Out-Null
$yourCss = ".header { color: blue; }`n.body { margin: 0px; }`n.footer { padding: 10px; }"
Set-Content -Path "styles.css" -Value $yourCss
git add styles.css
git commit -m "Change header to blue" | Out-Null

Write-Host "Broken scenario created at: $TargetDir" -ForegroundColor Green
Write-Host "Please 'cd' into this directory to begin your rescue mission!" -ForegroundColor Yellow

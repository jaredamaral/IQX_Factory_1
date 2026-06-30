# Install the official Sigma skills (sigma-api, sigma-data-models) into this repo's
# .cursor/skills/ so Cursor auto-discovers them. External dependency — the skills
# are NOT vendored/committed here (they are gitignored).
#
# Usage:
#   pwsh -File factory/scripts/install-sigma-skills.ps1
#   pwsh -File factory/scripts/install-sigma-skills.ps1 -CacheDir "C:\tools\sigma-agent-skills"
#
# Default cache: %USERPROFILE%\tools\sigma-agent-skills (cloned once, reused).

[CmdletBinding()]
param(
    [string]$CacheDir = (Join-Path $env:USERPROFILE "tools\sigma-agent-skills"),
    [string]$Upstream = "https://github.com/sigmacomputing/sigma-agent-skills.git"
)

$ErrorActionPreference = 'Stop'
$RepoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)   # factory/scripts -> repo root
$skillsDir = Join-Path $RepoRoot ".cursor\skills"

# 1) Clone or update the upstream cache.
if (-not (Test-Path (Join-Path $CacheDir ".git"))) {
    Write-Host "Cloning $Upstream -> $CacheDir" -ForegroundColor Cyan
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $CacheDir) | Out-Null
    git clone $Upstream $CacheDir
} else {
    Write-Host "Updating existing clone at $CacheDir" -ForegroundColor Cyan
    git -C $CacheDir pull --ff-only
}

$srcSkills = Join-Path $CacheDir "skills"

# 2) Junction the two official skills into .cursor/skills/.
New-Item -ItemType Directory -Force -Path $skillsDir | Out-Null
foreach ($name in @("sigma-api", "sigma-data-models")) {
    $source = Join-Path $srcSkills $name
    $target = Join-Path $skillsDir $name
    if (-not (Test-Path $source)) { throw "Missing skill in upstream: $source" }
    if (Test-Path $target) { Remove-Item $target -Recurse -Force }
    cmd /c mklink /J "$target" "$source" | Out-Null
    if (-not (Test-Path $target)) { throw "Failed to junction $target -> $source" }
    Write-Host "Linked: $name" -ForegroundColor Green
}

Write-Host "`nOfficial Sigma skills installed. They are gitignored (external dependency)." -ForegroundColor Cyan
Write-Host "Next: create a repo-root .env with Sigma credentials (see factory/SIGMA-INTEGRATION.md)," -ForegroundColor Cyan
Write-Host "then dot-source factory/scripts/get-sigma-token.ps1 to obtain a token." -ForegroundColor Cyan

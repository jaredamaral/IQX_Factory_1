#requires -Version 5.1
<#
.SYNOPSIS
  One-time bootstrap for the IQX Factory toolset.

.DESCRIPTION
  Promotes the canonical IP (IQX Agent Blueprint + 10 shared-template files)
  out of the reference-only IQX_Factory_Claude/ folder into their canonical
  toolset locations, and initializes git for the repo if needed.

  Why a script: these are verbatim file copies of large assets. Copying them by
  hand risks transcription errors (e.g. the ~590-line sigma-capability-matrix.yaml),
  so the factory performs them mechanically. Until this runs, the factory falls
  back to reading the Blueprint and shared-templates from IQX_Factory_Claude/
  (see factory/paths.yaml).

  Safe to re-run. Use -Force to overwrite existing canonical copies.

.EXAMPLE
  pwsh -File factory/bootstrap.ps1

.EXAMPLE
  pwsh -File factory/bootstrap.ps1 -Force -InitGit
#>
[CmdletBinding()]
param(
    [switch]$Force,
    [switch]$InitGit
)

$ErrorActionPreference = 'Stop'

# Resolve repo root as the parent of this script's directory (factory/).
$RepoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $RepoRoot
Write-Host "IQX Factory bootstrap — repo root: $RepoRoot" -ForegroundColor Cyan

$claudeRoot      = Join-Path $RepoRoot 'IQX_Factory_Claude'
$blueprintSrc    = Join-Path $claudeRoot 'IQX_AGENT_BLUEPRINT.md'
$blueprintDst    = Join-Path $RepoRoot  'factory\IQX_AGENT_BLUEPRINT.md'
$sharedSrc       = Join-Path $claudeRoot 'shared-templates'
$sharedDst       = Join-Path $RepoRoot  'shared-templates'

function Copy-IfNeeded {
    param([string]$Src, [string]$Dst, [string]$Label)
    if (-not (Test-Path $Src)) {
        Write-Warning "[$Label] source not found: $Src — skipping."
        return
    }
    if ((Test-Path $Dst) -and -not $Force) {
        Write-Host "[$Label] already present at $Dst (use -Force to overwrite)." -ForegroundColor Yellow
        return
    }
    Copy-Item -Path $Src -Destination $Dst -Force
    Write-Host "[$Label] copied -> $Dst" -ForegroundColor Green
}

# 1) Blueprint -> factory/
Copy-IfNeeded -Src $blueprintSrc -Dst $blueprintDst -Label 'Blueprint'

# 2) shared-templates -> repo root (the 10 canonical knowledge-pack files only)
$expected = @(
    'product-doctrine.md','sigma-first-design-rules.md','sigma-capability-matrix.yaml',
    'sigma-workbook-as-code-rules.md','snowflake-platform-rules.md',
    'snowflake-data-modeling-patterns.md','activation-data-patterns.md',
    'react-sketchpad-constraints.md','quality-gates.md','docs-ledger.md'
)
if (Test-Path $sharedSrc) {
    if (-not (Test-Path $sharedDst)) { New-Item -ItemType Directory -Path $sharedDst | Out-Null }
    foreach ($f in $expected) {
        Copy-IfNeeded -Src (Join-Path $sharedSrc $f) -Dst (Join-Path $sharedDst $f) -Label "shared:$f"
    }
} else {
    Write-Warning "shared-templates source not found: $sharedSrc"
}

# 3) git init (optional)
if ($InitGit) {
    if (Test-Path (Join-Path $RepoRoot '.git')) {
        Write-Host "git already initialized." -ForegroundColor Yellow
    } else {
        git init | Out-Null
        Write-Host "git initialized." -ForegroundColor Green
    }
}

Write-Host "`nBootstrap complete. Canonical Blueprint + shared-templates are now in the toolset." -ForegroundColor Cyan
Write-Host "Next: invoke the factory (Step 2) by telling Cursor e.g. 'Run the factory for StudentIQX'." -ForegroundColor Cyan

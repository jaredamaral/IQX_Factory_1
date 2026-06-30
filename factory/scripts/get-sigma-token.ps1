# Exchange Sigma OAuth client credentials for a short-lived bearer token (Windows).
# Equivalent of the upstream bash get-token.sh, for PowerShell.
#
# Usage (dot-source so the token lands in your session):
#   . .\factory\scripts\get-sigma-token.ps1
#
# Reads SIGMA_BASE_URL / SIGMA_CLIENT_ID / SIGMA_CLIENT_SECRET from the
# repo-root .env (gitignored) or the current environment. Sets $env:SIGMA_API_TOKEN.

param(
    [string]$EnvFile = (Join-Path $PSScriptRoot "..\..\.env")
)

if (Test-Path $EnvFile) {
    Get-Content $EnvFile | ForEach-Object {
        if ($_ -match '^\s*([^#][^=]+)=(.*)$') {
            $name = $matches[1].Trim()
            $value = $matches[2].Trim().Trim('"')
            Set-Item -Path "env:$name" -Value $value
        }
    }
}

foreach ($var in @('SIGMA_BASE_URL', 'SIGMA_CLIENT_ID', 'SIGMA_CLIENT_SECRET')) {
    if (-not (Get-Item "env:$var" -ErrorAction SilentlyContinue)) {
        throw "$var is not set. Create a repo-root .env (see factory/SIGMA-INTEGRATION.md) and fill in your credentials."
    }
}

$pair = "{0}:{1}" -f $env:SIGMA_CLIENT_ID, $env:SIGMA_CLIENT_SECRET
$bytes = [System.Text.Encoding]::UTF8.GetBytes($pair)
$basic = [Convert]::ToBase64String($bytes)

$response = Invoke-RestMethod -Method Post `
    -Uri "$($env:SIGMA_BASE_URL)/v2/auth/token" `
    -Headers @{ Authorization = "Basic $basic" } `
    -ContentType "application/x-www-form-urlencoded" `
    -Body "grant_type=client_credentials"

if (-not $response.access_token) {
    throw "Token exchange failed."
}

$env:SIGMA_API_TOKEN = $response.access_token
Write-Host "SIGMA_API_TOKEN set (expires in ~1 hour)."

Param(
  [switch]$ServerOnly,
  [switch]$WebOnly
)

$ErrorActionPreference = "Stop"

Write-Host "== BIM Automation Initiative: Dev setup ==" -ForegroundColor Cyan

# Python server setup via uv
if (-not $WebOnly) {
  Write-Host "[1/2] Server: ensuring uv and running tests" -ForegroundColor Yellow
  try {
    if (-not (Get-Command uv -ErrorAction SilentlyContinue)) {
      Write-Host "Installing uv via pipx..." -ForegroundColor DarkGray
      if (-not (Get-Command pipx -ErrorAction SilentlyContinue)) {
        python -m pip install --user pipx | Out-Null
        python -m pipx ensurepath | Out-Null
        $env:PATH += ";$([Environment]::GetFolderPath('UserProfile'))\\.local\\bin"
      }
      pipx install uv | Out-Null
    }
    Push-Location src/server
    uv sync
    uv run pytest -q
    Pop-Location
  } catch {
    Write-Host "Server setup failed: $($_.Exception.Message)" -ForegroundColor Red
    throw
  }
}

if ($ServerOnly) { exit 0 }

# Web viewer setup via pnpm or npm fallback
if (-not $ServerOnly) {
  Write-Host "[2/2] Web: installing deps and starting dev (manual)" -ForegroundColor Yellow
  Push-Location src/webviewer
  $hasPnpm = Get-Command pnpm -ErrorAction SilentlyContinue
  if ($hasPnpm) {
    pnpm install
  } else {
    Write-Host "pnpm not found, falling back to npm. You can install pnpm globally via: npm -g i pnpm@9" -ForegroundColor DarkYellow
    npm install
  }
  Write-Host "Done. Start dev server with: pnpm dev (or: npm run dev)" -ForegroundColor Green
  Pop-Location
}

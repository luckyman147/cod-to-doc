# Code-to-Doc CLI Installation Script (Windows PowerShell)
# Installs Code-to-Doc globally and configures dependencies

Write-Host "🚀 Code-to-Doc CLI Installation" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green

# Check if running as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
if (-not $isAdmin) {
    Write-Host "⚠️  Running without Administrator privileges" -ForegroundColor Yellow
    Write-Host "Some installations may require elevated privileges" -ForegroundColor Yellow
}

# Check Node.js
Write-Host ""
Write-Host "📦 Checking dependencies..." -ForegroundColor Cyan

$nodeExists = $null -ne (Get-Command node -ErrorAction SilentlyContinue)
if (-not $nodeExists) {
    Write-Host "❌ Node.js not found" -ForegroundColor Red
    Write-Host "Please install Node.js 14+ from https://nodejs.org/" -ForegroundColor Yellow
    exit 1
}

$nodeVersion = node --version
Write-Host "✓ Node.js $nodeVersion found" -ForegroundColor Green

# Install Code-to-Doc
Write-Host ""
Write-Host "📥 Installing Code-to-Doc CLI..." -ForegroundColor Cyan
npm install -g code-to-doc

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Code-to-Doc CLI installed" -ForegroundColor Green
} else {
    Write-Host "❌ Installation failed" -ForegroundColor Red
    exit 1
}

# Check LaTeX
Write-Host ""
Write-Host "📋 Checking LaTeX installation..." -ForegroundColor Cyan

$pdflatexExists = $null -ne (Get-Command pdflatex -ErrorAction SilentlyContinue)
if (-not $pdflatexExists) {
    Write-Host "⚠️  pdflatex not found" -ForegroundColor Yellow
    Write-Host "LaTeX is required to compile documentation to PDF" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "To install LaTeX on Windows:" -ForegroundColor Yellow
    Write-Host "1. Download MiKTeX from https://miktex.org/download" -ForegroundColor White
    Write-Host "2. Run the installer" -ForegroundColor White
    Write-Host "3. Choose 'Install missing packages on-the-fly'" -ForegroundColor White
} else {
    $latexVersion = (pdflatex --version 2>&1 | Select-Object -First 1)
    Write-Host "✓ LaTeX found: $latexVersion" -ForegroundColor Green
}

# Check PlantUML (optional)
Write-Host ""
Write-Host "🎨 Checking PlantUML (optional)..." -ForegroundColor Cyan

$plantUmlExists = $null -ne (Get-Command plantuml -ErrorAction SilentlyContinue)
if ($plantUmlExists) {
    Write-Host "✓ PlantUML found" -ForegroundColor Green
} else {
    Write-Host "⚠️  PlantUML not found (optional)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "To install PlantUML:" -ForegroundColor Yellow
    Write-Host "1. Download from http://plantuml.com/download" -ForegroundColor White
    Write-Host "2. Extract to Program Files" -ForegroundColor White
    Write-Host "3. Add to PATH environment variable" -ForegroundColor White
}

# Check Mermaid CLI (optional)
Write-Host ""
Write-Host "📊 Checking Mermaid CLI (optional)..." -ForegroundColor Cyan

$mmdcExists = $null -ne (Get-Command mmdc -ErrorAction SilentlyContinue)
if ($mmdcExists) {
    Write-Host "✓ Mermaid CLI found" -ForegroundColor Green
} else {
    Write-Host "⚠️  Mermaid CLI not found (optional)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "To install Mermaid CLI:" -ForegroundColor Yellow
    Write-Host "npm install -g @mermaid-js/mermaid-cli" -ForegroundColor White
}

# Verify installation
Write-Host ""
Write-Host "🔍 Verifying installation..." -ForegroundColor Cyan

$c2dExists = $null -ne (Get-Command code-to-doc -ErrorAction SilentlyContinue)
if ($c2dExists) {
    $version = code-to-doc --version
    Write-Host "✓ Code-to-Doc $version installed successfully" -ForegroundColor Green
} else {
    Write-Host "❌ Installation failed" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "✅ Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Navigate to your project: cd my-project" -ForegroundColor White
Write-Host "2. Initialize Code-to-Doc: code-to-doc init" -ForegroundColor White
Write-Host "3. Generate docs: code-to-doc generate" -ForegroundColor White
Write-Host ""
Write-Host "For help: code-to-doc --help" -ForegroundColor Cyan
Write-Host ""

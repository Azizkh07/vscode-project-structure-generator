# VS Code Extension Development Helper Script (PowerShell)
# Run this script to test your extension during development

Write-Host "🏗️ VS Code Extension Development Helper" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan

function Write-Step {
    param([string]$Message)
    Write-Host "`n✅ $Message" -ForegroundColor Green
}

function Write-Error {
    param([string]$Message)
    Write-Host "`n❌ $Message" -ForegroundColor Red
}

function Write-Info {
    param([string]$Message)
    Write-Host "`n📋 $Message" -ForegroundColor Yellow
}

# Check if Node.js is installed
try {
    $nodeVersion = node --version
    Write-Info "Node.js version: $nodeVersion"
} catch {
    Write-Error "Node.js is not installed. Please install Node.js first."
    exit 1
}

# Check if VS Code is installed
try {
    $codeVersion = code --version
    Write-Info "VS Code is available"
} catch {
    Write-Error "VS Code CLI is not available. Please install VS Code and ensure 'code' command is in PATH."
    exit 1
}

Write-Info "Starting extension development workflow..."

# Install dependencies
Write-Step "Installing dependencies..."
npm install

# Compile TypeScript
Write-Step "Compiling TypeScript..."
npm run compile

if ($LASTEXITCODE -ne 0) {
    Write-Error "TypeScript compilation failed!"
    exit 1
}

# Run linter
Write-Step "Running ESLint..."
npm run lint

# Package extension
Write-Step "Packaging extension..."
vsce package --no-yarn

if ($LASTEXITCODE -ne 0) {
    Write-Error "Extension packaging failed!"
    exit 1
}

# Find the VSIX file
$vsixFile = Get-ChildItem -Name "*.vsix" | Select-Object -First 1

if (-not $vsixFile) {
    Write-Error "No VSIX file found!"
    exit 1
}

Write-Step "Extension packaged successfully: $vsixFile"

# Ask user if they want to install the extension
$install = Read-Host "`n📦 Do you want to install the extension in VS Code? (y/n)"

if ($install -eq 'y' -or $install -eq 'Y') {
    Write-Step "Installing extension in VS Code..."
    code --install-extension $vsixFile
    
    if ($LASTEXITCODE -eq 0) {
        Write-Step "Extension installed successfully!"
        Write-Info "You can now test the extension in VS Code:"
        Write-Host "   1. Press Ctrl+Shift+P" -ForegroundColor White
        Write-Host "   2. Type 'Generate Project Structure'" -ForegroundColor White
        Write-Host "   3. Select either command to test" -ForegroundColor White
        Write-Host ""
        Write-Host "   Or use the keyboard shortcut: Ctrl+Shift+Alt+G" -ForegroundColor White
    } else {
        Write-Error "Failed to install extension!"
    }
}

Write-Info "Development workflow complete! 🎉"
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "   • Test the extension in VS Code" -ForegroundColor White
Write-Host "   • Create a proper icon (128x128 PNG)" -ForegroundColor White
Write-Host "   • Follow the PUBLICATION_GUIDE.md for marketplace publishing" -ForegroundColor White
Write-Host ""
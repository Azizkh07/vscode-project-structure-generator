#!/bin/bash

# VS Code Extension Development Helper Script
# Run this script to test your extension during development

echo "🏗️ VS Code Extension Development Helper"
echo "======================================"

# Function to display colored output
print_step() {
    echo -e "\n✅ $1"
}

print_error() {
    echo -e "\n❌ $1"
}

print_info() {
    echo -e "\n📋 $1"
}

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    print_error "Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Check if VS Code is installed
if ! command -v code &> /dev/null; then
    print_error "VS Code CLI is not available. Please install VS Code and ensure 'code' command is in PATH."
    exit 1
fi

print_info "Starting extension development workflow..."

# Install dependencies
print_step "Installing dependencies..."
npm install

# Compile TypeScript
print_step "Compiling TypeScript..."
npm run compile

if [ $? -ne 0 ]; then
    print_error "TypeScript compilation failed!"
    exit 1
fi

# Run linter
print_step "Running ESLint..."
npm run lint

# Package extension
print_step "Packaging extension..."
vsce package --no-yarn

if [ $? -ne 0 ]; then
    print_error "Extension packaging failed!"
    exit 1
fi

# Find the VSIX file
VSIX_FILE=$(ls *.vsix | head -n 1)

if [ -z "$VSIX_FILE" ]; then
    print_error "No VSIX file found!"
    exit 1
fi

print_step "Extension packaged successfully: $VSIX_FILE"

# Ask user if they want to install the extension
echo ""
read -p "📦 Do you want to install the extension in VS Code? (y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    print_step "Installing extension in VS Code..."
    code --install-extension "$VSIX_FILE"
    
    if [ $? -eq 0 ]; then
        print_step "Extension installed successfully!"
        print_info "You can now test the extension in VS Code:"
        echo "   1. Press Ctrl+Shift+P (Cmd+Shift+P on Mac)"
        echo "   2. Type 'Generate Project Structure'"
        echo "   3. Select either command to test"
        echo ""
        echo "   Or use the keyboard shortcut: Ctrl+Shift+Alt+G"
    else
        print_error "Failed to install extension!"
    fi
fi

print_info "Development workflow complete! 🎉"
echo ""
echo "Next steps:"
echo "   • Test the extension in VS Code"
echo "   • Create a proper icon (128x128 PNG)"
echo "   • Follow the PUBLICATION_GUIDE.md for marketplace publishing"
echo ""
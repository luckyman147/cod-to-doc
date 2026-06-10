#!/bin/bash

# Code-to-Doc CLI Installation Script
# Installs Code-to-Doc globally and configures dependencies

set -e

echo "🚀 Code-to-Doc CLI Installation"
echo "================================"

# Detect OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    OS="windows"
else
    OS="unknown"
fi

echo "Detected OS: $OS"

# Check Node.js
echo ""
echo "📦 Checking dependencies..."

if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Please install Node.js 14+ from https://nodejs.org/"
    exit 1
fi

NODE_VERSION=$(node --version)
echo "✓ Node.js $NODE_VERSION found"

# Install Code-to-Doc
echo ""
echo "📥 Installing Code-to-Doc CLI..."
npm install -g code-to-doc

echo "✓ Code-to-Doc CLI installed"

# Check LaTeX
echo ""
echo "📋 Checking LaTeX installation..."

if ! command -v pdflatex &> /dev/null; then
    echo "⚠️  pdflatex not found"
    echo "LaTeX is required to compile documentation to PDF"
    echo ""

    case "$OS" in
        macos)
            echo "To install LaTeX on macOS:"
            echo "  brew install mactex"
            echo ""
            echo "Or download from: https://www.tug.org/mactex/"
            ;;
        linux)
            echo "To install LaTeX on Linux:"
            echo "  sudo apt-get install texlive-latex-base texlive-latex-extra"
            echo ""
            echo "Or follow: https://www.tug.org/texlive/quickinstall.html"
            ;;
        windows)
            echo "To install LaTeX on Windows:"
            echo "  1. Download MiKTeX from https://miktex.org/download"
            echo "  2. Run the installer"
            echo "  3. Choose 'Install missing packages on-the-fly'"
            ;;
    esac
else
    LATEX_VERSION=$(pdflatex --version | head -1)
    echo "✓ LaTeX found: $LATEX_VERSION"
fi

# Check PlantUML (optional)
echo ""
echo "🎨 Checking PlantUML (optional)..."

if command -v plantuml &> /dev/null; then
    echo "✓ PlantUML found"
else
    echo "⚠️  PlantUML not found (optional)"
    echo ""

    case "$OS" in
        macos)
            echo "To install PlantUML:"
            echo "  brew install plantuml"
            ;;
        linux)
            echo "To install PlantUML:"
            echo "  sudo apt-get install plantuml"
            ;;
        windows)
            echo "To install PlantUML:"
            echo "  1. Download from http://plantuml.com/download"
            echo "  2. Extract to Program Files"
            echo "  3. Add to PATH"
            ;;
    esac
fi

# Check Mermaid CLI (optional)
echo ""
echo "📊 Checking Mermaid CLI (optional)..."

if command -v mmdc &> /dev/null; then
    echo "✓ Mermaid CLI found"
else
    echo "⚠️  Mermaid CLI not found (optional)"
    echo ""
    echo "To install Mermaid CLI:"
    echo "  npm install -g @mermaid-js/mermaid-cli"
fi

# Verify installation
echo ""
echo "🔍 Verifying installation..."

if command -v code-to-doc &> /dev/null; then
    VERSION=$(code-to-doc --version)
    echo "✓ Code-to-Doc $VERSION installed successfully"
else
    echo "❌ Installation failed"
    exit 1
fi

echo ""
echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "1. Navigate to your project: cd my-project"
echo "2. Initialize Code-to-Doc: code-to-doc init"
echo "3. Generate docs: code-to-doc generate"
echo ""
echo "For help: code-to-doc --help"
echo ""

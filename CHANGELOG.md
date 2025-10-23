# Changelog

All notable changes to the "Project Structure Generator for AI" extension will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-10-23

### 🎉 Initial Release

#### Added
- **Core Features**
  - Generate project structure in multiple formats (Markdown, JSON, Text)
  - Visual ASCII tree representation with emojis
  - Comprehensive file statistics and language detection
  - Smart file filtering with customizable exclusion patterns
  - Optional file content inclusion for AI context

- **Commands**
  - `Generate Project Structure for AI` - Basic structure generation
  - `Generate Project Structure with File Contents` - Enhanced version with file contents

- **Configuration Options**
  - Output format selection (Markdown/JSON/Text)
  - Customizable output filename
  - File size limits for content inclusion
  - Exclusion patterns configuration
  - File statistics toggle

- **User Experience**
  - Keyboard shortcut support (`Ctrl+Shift+Alt+G`)
  - Progress indication during generation
  - Auto-open generated files
  - Error handling and user feedback

- **Developer Features**
  - TypeScript implementation
  - Comprehensive file type detection
  - Efficient file tree building algorithm
  - Cross-platform compatibility

#### Technical Details
- Minimum VS Code version: 1.80.0
- Dependencies: glob for file pattern matching
- Output formats: Markdown (default), JSON, Plain text
- File size calculation and formatting utilities
- Language detection for 25+ programming languages

#### Supported File Types
- JavaScript/TypeScript (JS, TS, JSX, TSX)
- Web Technologies (HTML, CSS, SCSS, Vue)
- Backend Languages (Python, Java, C++, C#, Go, Rust, PHP, Ruby)
- Mobile (Swift, Kotlin, Dart)
- Data & Config (JSON, YAML, XML, SQL)
- Documentation (Markdown, Text)
- Scripts (Shell, Batch, PowerShell)

### 📋 Known Issues
- Large repositories may take some time to process
- Binary files are marked as "[Binary or unreadable file]" when content inclusion is enabled

### 🎯 Planned Features
- Custom template support for output formatting
- Integration with popular AI coding assistants
- Export to additional formats (PDF, HTML)
- Real-time structure updates
- Project comparison features

---

**Full Changelog**: https://github.com/Azizkh07/vscode-project-structure-generator/commits/main
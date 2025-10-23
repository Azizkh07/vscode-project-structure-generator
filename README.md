# 🏗️ Project Structure Generator for AI

A powerful VS Code extension that generates comprehensive project structure files, perfect for AI tools, documentation, and code analysis.

## ✨ Features

- **🌳 Visual File Tree**: Generate beautiful ASCII tree representations of your project
- **📊 Detailed Statistics**: File counts, sizes, languages, and more
- **🤖 AI-Optimized**: Perfect format for feeding to AI coding assistants
- **📝 Multiple Formats**: Export as Markdown, JSON, or plain text
- **⚡ Smart Filtering**: Automatically excludes build folders, dependencies, and temporary files
- **📄 Content Inclusion**: Optionally include actual file contents in the output
- **⌨️ Keyboard Shortcuts**: Quick access with `Ctrl+Shift+Alt+G`
- **🎛️ Highly Configurable**: Customize output format, exclusions, and file size limits

## 🚀 Quick Start

1. Install the extension from the VS Code Marketplace
2. Open any project in VS Code
3. Press `Ctrl+Shift+Alt+G` or use Command Palette: `Generate Project Structure for AI`
4. Choose between basic structure or structure with file contents
5. View the generated `PROJECT_STRUCTURE.md` file

## 📋 Commands

| Command | Description | Shortcut |
|---------|-------------|----------|
| `Generate Project Structure for AI` | Creates a structure file without file contents | `Ctrl+Shift+Alt+G` |
| `Generate Project Structure with File Contents` | Creates a structure file including file contents | - |

## ⚙️ Configuration

Configure the extension through VS Code settings:

```json
{
  "projectStructure.outputFormat": "markdown", // "json", "markdown", "txt"
  "projectStructure.outputFileName": "PROJECT_STRUCTURE",
  "projectStructure.includeFileContent": false,
  "projectStructure.maxFileSize": 100, // KB
  "projectStructure.includeFileStats": true,
  "projectStructure.excludePatterns": [
    "**/node_modules/**",
    "**/.git/**",
    "**/dist/**",
    "**/out/**",
    "**/.vscode/**",
    "**/build/**",
    "**/*.log"
  ]
}
```

## 📸 Example Output

```
# Project Structure: my-awesome-project

**Generated:** 10/23/2025, 6:04:33 PM
**Root Path:** `/path/to/my-awesome-project`

---

## File Tree

```
└── 📁 my-awesome-project
    ├── 📄 package.json (2.1 KB)
    ├── 📄 README.md (5.2 KB)
    ├── 📁 src
    │   ├── 📄 index.ts (1.8 KB)
    │   ├── 📄 utils.ts (943 Bytes)
    │   └── 📁 components
    │       ├── 📄 Header.tsx (2.3 KB)
    │       └── 📄 Footer.tsx (1.1 KB)
    └── 📁 tests
        └── 📄 index.test.ts (856 Bytes)
```

---

## Statistics

- **Total Files:** 7
- **Total Directories:** 3
- **Total Size:** 14.3 KB
- **Languages:** TypeScript, JavaScript, JSON, Markdown
```

## 🎯 Use Cases

- **🤖 AI Assistance**: Provide context to AI coding assistants like GitHub Copilot, ChatGPT, or Claude
- **📚 Documentation**: Generate project overviews for README files or wikis
- **🔍 Code Reviews**: Quick project structure analysis for reviewers
- **📋 Project Planning**: Understand existing codebase structure before making changes
- **🎓 Learning**: Help understand how projects are organized

## 🛠️ Development

### Prerequisites
- Node.js 16+ and npm
- VS Code 1.80.0+

### Setup
```bash
git clone https://github.com/Azizkh07/vscode-project-structure-generator
cd vscode-project-structure-generator
npm install
npm run compile
```

### Testing
```bash
npm test
```

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 🐛 Issues

Found a bug or have a feature request? Please open an issue on [GitHub](https://github.com/Azizkh07/vscode-project-structure-generator/issues).

## ⭐ Support

If you find this extension helpful, please consider:
- ⭐ Starring the repository
- 📝 Leaving a review on the VS Code Marketplace
- 🐛 Reporting issues or suggesting features

---

Made with ❤️ for the developer community
# Publishing Code-to-Doc Skill

Complete guide to publishing your skill to Claude Code Marketplace and npm for `npx skill add`.

## 📋 Pre-Publication Checklist

Before publishing, ensure you have:

- [ ] GitHub account (https://github.com)
- [ ] npm account (https://npmjs.com)
- [ ] Claude Code account/access
- [ ] All skill files created and tested
- [ ] README.md polished
- [ ] SKILL.md instructions complete
- [ ] plugin.json valid and complete
- [ ] License file (MIT recommended)
- [ ] Version number ready (semantic versioning: 1.0.0)

---

## 🚀 Step 1: Prepare Your GitHub Repository

### 1.1 Create/Update GitHub Repository

```bash
# If not already a git repo
git init

# Add all files
git add .

# Initial commit
git commit -m "feat: initial code-to-doc skill release"

# Add remote (replace YOUR_USERNAME and YOUR_REPO)
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### 1.2 Verify Repository Structure

Your repo should have:

```
code-to-doc/
├── SKILL.md                    # Main skill file (required)
├── README.md                   # User guide
├── plugin.json                 # Plugin metadata
├── CLI_GUIDE.md               # CLI documentation
├── PUBLISHING_GUIDE.md        # This file
├── package.json               # npm metadata
├── LICENSE                    # MIT License
├── .gitignore
├── scripts/
│   ├── install-cli.sh
│   └── install-cli.ps1
├── references/
│   ├── latex-template.tex
│   ├── diagram-examples.md
│   └── conversion-tools.md
└── icon.svg                   # Plugin icon (256x256)
```

### 1.3 Create .gitignore

```
node_modules/
.DS_Store
*.swp
*.swo
*~
dist/
build/
.env
.env.local
```

---

## 📦 Step 2: Create/Update package.json

Create `package.json` in your repo root:

```json
{
  "name": "code-to-doc",
  "version": "1.0.0",
  "description": "Transform code into LaTeX documentation with diagrams",
  "keywords": [
    "documentation",
    "latex",
    "diagrams",
    "plantuml",
    "mermaid",
    "claude-code",
    "skill"
  ],
  "author": {
    "name": "Your Name",
    "email": "your.email@example.com",
    "url": "https://github.com/YOUR_USERNAME"
  },
  "license": "MIT",
  "repository": {
    "type": "git",
    "url": "https://github.com/YOUR_USERNAME/YOUR_REPO.git"
  },
  "bugs": {
    "url": "https://github.com/YOUR_USERNAME/YOUR_REPO/issues"
  },
  "homepage": "https://github.com/YOUR_USERNAME/YOUR_REPO#readme",
  "main": "SKILL.md",
  "bin": {
    "code-to-doc": "./bin/cli.js"
  },
  "scripts": {
    "test": "jest",
    "lint": "eslint .",
    "prepublish": "npm test && npm run lint"
  },
  "engines": {
    "node": ">=14.0.0"
  },
  "files": [
    "SKILL.md",
    "README.md",
    "plugin.json",
    "CLI_GUIDE.md",
    "references/",
    "scripts/",
    "icon.svg",
    "LICENSE"
  ]
}
```

---

## 🎨 Step 3: Add Plugin Icon

Create `icon.svg` (256x256px minimum):

```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256">
  <defs>
    <style>
      .icon-bg { fill: #4A90E2; }
      .icon-fg { stroke: white; stroke-width: 2; fill: none; }
      .icon-text { fill: white; }
    </style>
  </defs>
  
  <!-- Background -->
  <circle cx="128" cy="128" r="128" class="icon-bg"/>
  
  <!-- Code brackets -->
  <g transform="translate(40, 100)">
    <path d="M15 10 L5 20 L5 36 L15 46" class="icon-fg"/>
    <path d="M33 10 L43 20 L43 36 L33 46" class="icon-fg"/>
  </g>
  
  <!-- Document -->
  <g transform="translate(90, 80)">
    <rect x="0" y="0" width="60" height="80" class="icon-fg"/>
    <line x1="8" y1="20" x2="52" y2="20" class="icon-fg"/>
    <line x1="8" y1="32" x2="52" y2="32" class="icon-fg"/>
    <line x1="8" y1="44" x2="40" y2="44" class="icon-fg"/>
  </g>
  
  <!-- Diagram nodes -->
  <g transform="translate(155, 110)">
    <circle cx="8" cy="8" r="3" class="icon-text"/>
    <circle cx="28" cy="8" r="3" class="icon-text"/>
    <circle cx="18" cy="28" r="3" class="icon-text"/>
    <line x1="8" y1="8" x2="18" y2="28" class="icon-fg" stroke="white"/>
    <line x1="28" y1="8" x2="18" y2="28" class="icon-fg" stroke="white"/>
  </g>
</svg>
```

---

## 📝 Step 4: Create/Update License

Create `LICENSE` file (MIT):

```
MIT License

Copyright (c) 2024 [Your Name]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 🔐 Step 5: Create GitHub Release

### 5.1 Tag Your Release

```bash
# Create version tag
git tag -a v1.0.0 -m "Release version 1.0.0"

# Push tag to GitHub
git push origin v1.0.0
```

### 5.2 Create Release on GitHub

1. Go to: https://github.com/YOUR_USERNAME/YOUR_REPO/releases
2. Click **"Create a new release"**
3. Select tag: **v1.0.0**
4. Title: **Code-to-Doc v1.0.0**
5. Description:
   ```
   ## Features
   - 12 diagram types (class, sequence, activity, state, ER, deployment, component, flowchart, Gantt, mind map, use case, git graph)
   - Three workflows: Implement & Document, Explore & Document, Diagram-First
   - Student-friendly documentation mode
   - Publication-ready LaTeX PDF output
   - CLI via `npx skill add code-to-doc`

   ## Installation
   ```bash
   npx skill add code-to-doc
   ```

   ## Usage
   ```bash
   npx code-to-doc generate --diagrams class,sequence,state --compile-pdf
   ```

   ## Requirements
   - Node.js 14+
   - pdflatex (for PDF compilation)
   - Optional: PlantUML, Mermaid CLI
   ```

6. Click **"Publish release"**

---

## 📦 Step 6: Publish to npm

### 6.1 Create npm Account

1. Visit: https://www.npmjs.com/signup
2. Sign up with email
3. Verify email
4. Save your credentials

### 6.2 Login to npm

```bash
npm login
# Enter your npm username and password
```

### 6.3 Publish to npm

```bash
# From your repo root
npm publish

# Verify publication
npm view code-to-doc
```

**Important**: Your package name in `package.json` must be unique on npm.

### 6.4 Verify Publication

```bash
# Check package exists
npm search code-to-doc

# Install from npm
npx code-to-doc --version
```

---

## 🎯 Step 7: Submit to Claude Code Marketplace

### 7.1 Prepare Marketplace Assets

Create `MARKETPLACE.md`:

```markdown
# Code-to-Doc

Transform code into professional LaTeX documentation with auto-generated diagrams.

## Features

✅ **12 Diagram Types**: Class, Sequence, Activity, Use Case, State, ER, Deployment, Component, Flowchart, Gantt, Mind Map, Git Graph

✅ **Three Workflows**:
- Implement & Document (code while generating docs)
- Explore & Document (analyze existing projects)
- Diagram-First (design with diagrams, then code)

✅ **Student-Friendly Mode**: Pedagogical explanations with examples

✅ **Publication-Ready**: LaTeX PDF with embedded code and diagrams

✅ **Multi-Language**: Python, JavaScript, Java, Go, Rust, C++, and 18+ more

## Installation

**Via CLI (Recommended)**:
```bash
npx skill add code-to-doc
npx code-to-doc generate --diagrams class,sequence,state --compile-pdf
```

**Via Claude Code Plugin**:
```
/code-to-doc
```

## Requirements

- Node.js 14+
- pdflatex (for PDF generation)
- Optional: PlantUML, Mermaid CLI

## Quick Start

```bash
cd my-project
npx code-to-doc generate \
  --diagrams class,sequence,deployment \
  --audience intermediate \
  --compile-pdf
```

## Documentation

- [CLI Guide](./CLI_GUIDE.md)
- [Diagram Examples](./references/diagram-examples.md)
- [Installation Guide](./INSTALLATION_GUIDE.md)

## Support

- GitHub: https://github.com/YOUR_USERNAME/YOUR_REPO
- Issues: https://github.com/YOUR_USERNAME/YOUR_REPO/issues
- Email: your.email@example.com
```

### 7.2 Submit to Marketplace

1. **Sign in** to Claude Code (https://claude.ai)
2. Go to **Marketplace** section
3. Click **"Submit New Plugin"** or **"Add Extension"**
4. Fill in form:
   - **Name**: Code to Doc
   - **ID**: code-to-doc
   - **Version**: 1.0.0
   - **Description**: Transform code into LaTeX documentation with diagrams
   - **Category**: Documentation
   - **License**: MIT
   - **Repository URL**: https://github.com/YOUR_USERNAME/YOUR_REPO
   - **Icon**: Upload icon.svg
   - **Tags**: documentation, latex, diagrams, plantuml, mermaid

5. Upload screenshots (if available):
   - Diagram selection UI
   - Generated PDF example
   - Architecture diagram

6. Submit for review

**Review time**: Usually 24-48 hours

---

## 📊 Step 8: Market Your Skill

### Share on Social Media

```
🚀 Just published Code-to-Doc to Claude Code Marketplace!

Transform your code into professional LaTeX documentation with auto-generated diagrams.

✨ 12 diagram types
✨ Student-friendly mode
✨ Publication-ready PDFs

Install: npx skill add code-to-doc

GitHub: [Your Repo URL]
```

### Update README

Add badges:

```markdown
[![npm version](https://img.shields.io/npm/v/code-to-doc.svg)](https://www.npmjs.com/package/code-to-doc)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub](https://img.shields.io/badge/GitHub-code--to--doc-blue.svg)](https://github.com/YOUR_USERNAME/YOUR_REPO)
```

### Post on Communities

- **GitHub Discussions**: https://github.com/anthropics/claude-code/discussions
- **Reddit**: r/ClaudeAI, r/programming
- **Dev.to**: Create tutorial post
- **Product Hunt**: Launch your skill

---

## 🔄 Step 9: Maintenance & Updates

### Version Updates

When releasing updates:

```bash
# Update version in package.json
# Edit version field: "1.0.1"

# Commit changes
git add .
git commit -m "chore: bump to v1.0.1"

# Tag release
git tag -a v1.0.1 -m "Release version 1.0.1"

# Push
git push origin main
git push origin v1.0.1

# Publish to npm
npm publish
```

### Semantic Versioning

- **PATCH** (1.0.1): Bug fixes
- **MINOR** (1.1.0): New features, backwards compatible
- **MAJOR** (2.0.0): Breaking changes

### Update Marketplace

1. Update version in marketplace
2. Add changelog/release notes
3. Update description if needed

---

## 📋 Publishing Checklist

Before each release:

- [ ] All tests pass (`npm test`)
- [ ] Code linted (`npm run lint`)
- [ ] Version bumped in `package.json`
- [ ] `SKILL.md` is current
- [ ] `plugin.json` is valid
- [ ] README.md is polished
- [ ] CHANGELOG updated
- [ ] Git committed with proper message
- [ ] GitHub release created
- [ ] npm package published
- [ ] Marketplace updated
- [ ] Documentation links work

---

## 🆘 Troubleshooting Publication

### npm publish fails

```bash
# Check you're logged in
npm whoami

# If not logged in
npm login

# Check package.json is valid
npm validate

# Publish with verbose output
npm publish --verbose
```

### Package name already taken

```bash
# Check if name exists
npm view your-package-name

# Change package name in package.json
# Use scoped name: @yourname/code-to-doc
# Then publish as: npm publish --access public
```

### GitHub release not showing

```bash
# Ensure tag is pushed
git push origin v1.0.0

# Verify tag exists
git tag -l

# Create release via GitHub web interface if automated failed
```

### Marketplace submission rejected

Common reasons:
- Missing license file
- Incomplete metadata
- Plugin.json errors
- Non-descriptive description

**Solution**: Review feedback, fix issues, resubmit

---

## 🎉 After Publication

### Monitor

- Check npm download stats: https://www.npmjs.com/package/code-to-doc
- Monitor GitHub issues/discussions
- Track marketplace reviews/ratings

### Engage

- Respond to issues quickly
- Thank users for feedback
- Feature user projects using your skill
- Write blog posts about use cases

### Iterate

- Gather user feedback
- Plan feature releases
- Fix bugs promptly
- Keep documentation updated

---

## 📚 Resources

- **npm Publishing**: https://docs.npmjs.com/cli/v8/commands/npm-publish
- **GitHub Releases**: https://docs.github.com/en/repositories/releasing-projects-on-github
- **Claude Code Docs**: https://claude.ai/docs
- **Semantic Versioning**: https://semver.org/

---

**You're ready to publish!** 🚀

```bash
# Summary of commands:
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin v1.0.0
npm publish
```

Then submit to Claude Code Marketplace!

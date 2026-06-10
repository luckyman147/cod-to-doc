# Code-to-Doc CLI Guide

Use Code-to-Doc from the command line for automated documentation generation in your CI/CD pipelines or local workflows.

## Installation

### ✅ Recommended: Via npx skill add

```bash
npx skill add code-to-doc
```

Verify installation:
```bash
npx code-to-doc --version
```

Use in any project:
```bash
npx code-to-doc generate --diagrams class,sequence
```

### Option 2: From Source

```bash
git clone https://github.com/anthropics/claude-code-skills.git
cd claude-code-skills/code-to-doc
npm install
npx code-to-doc --help
```

### Option 3: Docker

```bash
docker pull code-to-doc:latest
docker run -v $(pwd):/workspace code-to-doc:latest generate
```

## Quick Start

### Basic Usage

```bash
# Generate documentation for current directory
npx code-to-doc generate

# Generate with specific diagrams
npx code-to-doc generate --diagrams class,sequence,state

# Explore existing project
npx code-to-doc explore --output ./docs

# Diagram-first mode (design with diagrams)
npx code-to-doc design --diagrams activity,flowchart
```

### Complete Example

```bash
# 1. Navigate to your project
cd my-api-project

# 2. Generate documentation with selected diagrams
npx code-to-doc generate \
  --diagrams class,sequence,state,deployment \
  --audience intermediate \
  --output ./docs \
  --compile-pdf

# 3. View generated PDF
open docs/build/main.pdf  # macOS
xdg-open docs/build/main.pdf  # Linux
start docs\build\main.pdf  # Windows
```

## Commands

### `npx code-to-doc generate`

Generate documentation from code.

**Usage**:
```bash
npx code-to-doc generate [options]
```

**Options**:
```
-d, --diagrams <types>      Comma-separated diagram types (see list below)
-a, --audience <level>      Documentation audience: beginner, intermediate, advanced
-o, --output <path>         Output directory (default: ./docs)
-l, --language <lang>       Programming language (auto-detected if not specified)
-t, --theme <theme>         LaTeX theme: clean, academic, corporate (default: clean)
--compile-pdf               Compile LaTeX to PDF after generation
--include-code              Include code snippets (default: true)
--pedagogical               Enable student-friendly mode
-f, --format <format>       Diagram format: svg, png, pdf (default: svg)
--exclude <patterns>        File patterns to exclude
-v, --verbose              Verbose output
-h, --help                 Show help
```

**Examples**:
```bash
# Generate with class and sequence diagrams
npx code-to-doc generate --diagrams class,sequence

# Student-friendly documentation
npx code-to-doc generate --pedagogical --audience beginner

# Academic theme
npx code-to-doc generate --theme academic --compile-pdf

# Exclude node_modules
npx code-to-doc generate --exclude "node_modules,**/*.test.js"
```

### `npx code-to-doc explore`

Analyze existing project and create documentation.

**Usage**:
```bash
npx code-to-doc explore [project-path] [options]
```

**Options**:
```
-a, --audience <level>      Documentation audience
-o, --output <path>         Output directory
-d, --diagrams <types>      Diagram types to generate
-t, --theme <theme>         LaTeX theme
--compile-pdf               Compile to PDF
-v, --verbose              Verbose output
```

**Examples**:
```bash
# Explore current project
npx code-to-doc explore

# Explore specific project
npx code-to-doc explore ./my-project --output ./docs

# With all diagram types
npx code-to-doc explore --diagrams all
```

### `npx code-to-doc design`

Diagram-first mode: start with diagrams, then generate code structure.

**Usage**:
```bash
npx code-to-doc design [options]
```

**Options**:
```
-d, --diagrams <types>      Which diagrams to create
-o, --output <path>         Output directory
-i, --interactive           Interactive mode (prompt for details)
--compile-pdf               Generate documentation after design
```

**Examples**:
```bash
# Interactive design mode
npx code-to-doc design --interactive

# Specific diagrams
npx code-to-doc design --diagrams class,sequence,state

# With documentation
npx code-to-doc design --compile-pdf --output ./docs
```

## Diagram Types

Use these values with `--diagrams`:

```
class              UML class diagram (OOP structure)
sequence           Sequence diagram (interactions)
activity           Activity diagram (processes)
use-case           Use case diagram (system boundaries)
state              State diagram (transitions)
entity-relationship ER diagram (database schema)
deployment         Deployment diagram (infrastructure)
component          Component diagram (architecture)
flowchart          Flowchart (algorithms, logic)
gantt              Gantt chart (timeline, schedule)
mind-map           Mind map (concepts, hierarchy)
git-graph          Git graph (branching)

all                All available diagrams
```

**Quick aliases**:
```bash
npx code-to-doc generate --diagrams all              # All types
npx code-to-doc generate --diagrams arch             # class,component,deployment
npx code-to-doc generate --diagrams flow             # activity,flowchart,sequence
npx code-to-doc generate --diagrams design           # class,sequence,activity,use-case
```

## Configuration File

Create `.code-to-doc.json` in your project root:

```json
{
  "audience": "intermediate",
  "theme": "clean",
  "output": "./docs",
  "diagrams": ["class", "sequence", "state"],
  "language": "python",
  "compilePdf": true,
  "includeCodeSnippets": true,
  "pedagogicalMode": false,
  "diagramFormat": "svg"
}
```

## CI/CD Integration

### GitHub Actions

```yaml
name: Generate Documentation

on: [push]

jobs:
  docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Install Code-to-Doc
        run: npm install -g code-to-doc
      - name: Generate Docs
        run: npx code-to-doc generate --compile-pdf
      - name: Upload artifacts
        uses: actions/upload-artifact@v2
        with:
          name: documentation
          path: docs/build/main.pdf
```

### GitLab CI

```yaml
generate-docs:
  image: node:18
  script:
    - npm install -g code-to-doc
    - npx code-to-doc generate --compile-pdf
  artifacts:
    paths:
      - docs/build/main.pdf
```

## Getting Help

```bash
# General help
npx code-to-doc --help

# Command-specific help
npx code-to-doc generate --help

# Version
npx code-to-doc --version
```

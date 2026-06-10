# Code-to-Doc

Transform code into professional LaTeX documentation with auto-generated PlantUML and Mermaid diagrams.

## What This Tool Does

**Code-to-Doc** bridges the gap between implementation and documentation by:

1. **Implementing code** while generating documentation in parallel
2. **Exploring existing projects** and producing student-friendly documentation
3. **Auto-generating architecture diagrams** (12 types: class, sequence, activity, state, ER, deployment, component, flowchart, Gantt, mind map, use case, git graph)
4. **Producing publication-ready PDF** with embedded code, diagrams, and explanations
5. **Supporting multiple audiences** (students, engineers, stakeholders, API users)

## Installation

### ✅ Recommended: Via CLI with npx (Command Line)

**Quick install** (macOS, Linux, Windows):

```bash
npx skill add code-to-doc
```

Then use from any project:
```bash
npx code-to-doc generate --diagrams class,sequence,state --compile-pdf
```

### Alternative: Via Claude Code Plugin

Install from Claude Code marketplace:
```
/code-to-doc
```

Then invoke the skill within Claude Code for interactive documentation generation.

## Quick Start

### For New Features
```
/code-to-doc
You: I need to implement JWT authentication and document it for students

→ Skill asks: Audience level? (intro, intermediate, advanced)
→ Implements auth with tests
→ Generates sequence diagrams (token flow)
→ Generates class diagrams (JWT, User models)
→ Writes LaTeX explaining JWT, security, implementation details
→ Compiles PDF with all diagrams and code snippets embedded
```

### For Existing Projects
```
/code-to-doc
You: Create documentation for this Python project for new engineers

→ Skill scans project structure
→ Generates architecture diagram (modules, dependencies)
→ Extracts key classes and functions
→ Writes LaTeX module-by-module
→ Adds API reference and usage examples
→ Compiles PDF ready to share
```

## File Structure

```
~/.claude/skills/code-to-doc/
├── SKILL.md                          # Main skill instructions
├── README.md                          # This file
├── references/
│   ├── latex-template.tex            # Base LaTeX template
│   ├── diagram-examples.md           # PlantUML and Mermaid examples
│   └── conversion-tools.md           # How to compile diagrams and LaTeX
└── scripts/
    ├── compile-latex.sh              # Build PDF from .tex files
    ├── generate-diagrams.sh          # Convert PlantUML/Mermaid to images
    └── extract-code-snippets.py      # Pull code from project into LaTeX
```

## Key Features

### 📊 Diagram Support
- **PlantUML**: Class, deployment, activity, sequence, component diagrams
- **Mermaid**: Flowcharts, sequence, state, ER, Gantt diagrams
- Auto-conversion to SVG/PNG for PDF embedding

### 📝 LaTeX Output
- Production-ready typography (proper fonts, spacing, hyphenation)
- Syntax-highlighted code listings (any language)
- Professional styling with customizable preamble
- Table of contents, cross-references, page numbers

### 🎓 Student-Friendly Mode
- Step-by-step explanations (not just code)
- Real-world examples with expected output
- Glossary of key terms
- Margin notes for advanced topics
- Pedagogical structure (simple → complex)

### 🔄 Live Updates
- Update code → regenerate documentation
- Diagrams stay in sync with implementation
- No manual copy-paste or screenshot risks

## Output

After running `/code-to-doc`, you'll get:

```
docs/
├── main.pdf                          # Final compiled PDF
├── main.tex                          # Master LaTeX document
├── chapters/
│   ├── 01-overview.tex              # Project/feature overview
│   ├── 02-architecture.tex          # Design and architecture
│   ├── 03-modules.tex               # Module-by-module reference
│   └── 04-examples.tex              # Usage examples
├── diagrams/
│   ├── *.puml                       # PlantUML source files
│   ├── *.mmd                        # Mermaid source files
│   └── generated/
│       ├── *.svg                    # Converted diagrams (SVG)
│       └── *.png                    # Converted diagrams (PNG)
└── code/
    └── snippets.tex                 # Code listings (auto-extracted)
```

## Supported Languages

Any language with syntax highlighting in LaTeX/listings package:
- Python, JavaScript, TypeScript, Java, C/C++/C#
- Go, Rust, PHP, Ruby, Swift, Kotlin
- SQL, HTML, CSS, YAML, JSON, TOML
- And 20+ more

## Customization

### Change LaTeX Styling
Edit `references/latex-template.tex`:
- Fonts, colors, page layout
- Code highlighting theme
- Section numbering and TOC depth

### Add Custom Diagrams
1. Create `.puml` or `.mmd` file in `docs/diagrams/`
2. Skill auto-generates images during PDF build
3. Reference in LaTeX: `\includegraphics{diagrams/generated/your-diagram.svg}`

### Audience Levels

The skill auto-adapts documentation based on audience:
- **Beginner**: Simple explanations, visual analogies, glossary
- **Intermediate**: Balanced depth, architectural decisions, best practices
- **Advanced**: Edge cases, performance analysis, implementation details

## Performance Notes

- **First run**: ~2-5 minutes (includes code scanning, diagram generation, LaTeX compilation)
- **Subsequent updates**: ~1-2 minutes (only changed sections regenerate)
- **Diagram generation**: ~30 seconds per diagram
- **LaTeX compilation**: ~1 minute (usually requires 2-3 passes for TOC)

## Integration with Claude Code

This skill works seamlessly with other Claude Code skills:

- **Before**: Use `/agent-skills:plan` to design architecture
- **During**: Use `/code-to-doc` to implement + document in parallel
- **After**: Use `/code-review` to ensure quality before merging

## References

- **PlantUML Docs**: http://plantuml.com/
- **Mermaid Docs**: https://mermaid.js.org/
- **LaTeX Docs**: https://www.latex-project.org/
- **Listings Package** (code highlighting): https://www.ctan.org/pkg/listings

## Troubleshooting

### "LaTeX compilation failed"
- Ensure pdflatex is installed: `pdflatex --version`
- Check for missing `\input{}` files in main.tex
- Run twice to generate TOC: `pdflatex ... && pdflatex ...`

### "Diagrams not showing in PDF"
- Verify SVG/PNG files exist in `docs/diagrams/generated/`
- Check image paths in .tex files (use relative paths)
- Try PNG format instead of SVG (sometimes more compatible)

### "Code snippets are too long"
- Specify line ranges: `\lstinputlisting[linerange={10-20}]{code/app.py}`
- Or use `breaklines=true` in listings package

## Contributing

Found a bug or have a suggestion? Report it or create an improved version:
- Fork the skill repository
- Create a feature branch
- Test thoroughly
- Submit for review

---

**Ready to use it?** Run `/code-to-doc` in any project and follow the interactive prompts!

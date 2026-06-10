---
name: code-to-doc
description: Code, document, and diagram. Implement features or explore projects while generating LaTeX documentation with PlantUML/Mermaid diagrams for students and stakeholders.
---

# Code to Doc

A comprehensive skill for turning code into production-quality LaTeX documentation with architecture diagrams. Works in three modes: **implement-and-document** (code new features with live documentation), **explore-and-document** (analyze existing projects), and **diagram-first** (start with architecture diagrams, then code).

## When to Use

- **"Document this code"** — Turn recent implementation into LaTeX docs
- **"Explore and document this project"** — Generate student-friendly documentation from existing codebase
- **"Create architecture diagrams for X"** — Generate PlantUML and Mermaid diagrams with LaTeX
- **"Code this feature and document it"** — Implement while generating docs in parallel
- **"Write docs for students"** — Create pedagogical, clear documentation with examples

## Diagram Types You Can Choose

Before starting, you can select which diagrams to include:

| Diagram Type | Tool | Best For | Example |
|---|---|---|---|
| **Class Diagram** | PlantUML | OOP structure, relationships | User, Post, Comment classes |
| **Sequence Diagram** | Mermaid/PlantUML | Interactions over time | API request flow, login process |
| **Activity Diagram** | PlantUML | Process flows, workflows | User registration workflow |
| **Use Case Diagram** | PlantUML | System boundaries, actors | Admin, User, System interactions |
| **State Diagram** | Mermaid | State transitions | Auth token lifecycle |
| **Entity-Relationship** | Mermaid | Database schema | Users, Posts, Comments tables |
| **Deployment Diagram** | PlantUML | Infrastructure, environments | AWS, Docker, Kubernetes setup |
| **Component Diagram** | PlantUML | System architecture | Frontend, Backend, Database |
| **Flowchart** | Mermaid | Decision logic, algorithms | Login validation flow |
| **Gantt Chart** | Mermaid | Timeline, project schedule | Development phases |
| **Mind Map** | Mermaid | Concepts, hierarchies | Feature tree, module organization |
| **Git Graph** | Mermaid | Version control flow | Branching strategy |

## Workflow (Flexible)

The skill adapts to your intent. Choose your path:

### Path A: Implement + Document (New Feature)
1. **Clarify intent** — What are you building? Who's the audience? (students, stakeholders, API users)
2. **Select diagrams** — Choose which diagram types you want (class, sequence, state, etc.)
3. **Code the feature** — Implement incrementally with test-driven development
4. **Generate selected diagrams** — Create only the diagrams you chose
5. **Write LaTeX documentation** — Auto-generate from code + manual sections (motivation, examples, edge cases)
6. **Review and polish** — User reviews LaTeX output, diagrams, and code together
7. **Output artifacts** — Code committed, LaTeX PDF generated, diagrams in project

### Path B: Explore + Document (Existing Project)
1. **Scan the project** — Understand structure, modules, dependencies
2. **Select diagrams** — Choose which diagram types to generate (architecture, ER, deployment, etc.)
3. **Extract architecture** — Create selected diagrams showing layers, components, data flow
4. **Generate LaTeX skeleton** — Project overview, module reference, API docs
5. **Enrich with examples** — Pull real code snippets, create usage examples
6. **Create student-friendly guide** — Layer pedagogical explanations on top
7. **Output artifacts** — LaTeX PDF ready to share with students

### Path C: Diagram-First (Design)
1. **Sketch architecture** — User describes system or provides rough design
2. **Select diagram types** — Choose which diagrams to create (class, sequence, deployment, etc.)
3. **Generate selected diagrams** — Create PlantUML/Mermaid diagrams from description
4. **Review and iterate** — Refine diagrams until they match vision
5. **Implement code** — Code guided by diagram structure
6. **Generate LaTeX** — Document what was built, linking code to diagrams
7. **Output artifacts** — Diagrams, code, and LaTeX all aligned

## How It Works

### Step 1: Ask Your Intent
When you invoke the skill, it asks:
- What are you doing? (implementing, exploring, diagramming)
- What's the scope? (single feature, whole project, module)
- Who's the audience? (students, engineers, product managers)
- **Which diagram types do you want?** (select multiple from: class, sequence, activity, use case, state, ER, deployment, component, flowchart, Gantt, mind map, git graph)

### Step 2: Generate Artifacts
Based on your intent and selected diagrams, the skill:
- **Codes** new features (or skips if exploring existing code)
- **Diagrams** architecture with PlantUML (class diagrams, deployment, ER) and Mermaid (flowcharts, sequence, state)
- **Writes LaTeX** with:
  - Front matter (title, author, date, table of contents)
  - Sections for each module/component
  - Code listings with syntax highlighting
  - Diagrams embedded (converted from PlantUML/Mermaid to TikZ or PNG)
  - Examples and usage patterns
  - Edge cases and gotchas
  - References and appendices

### Step 3: Structure Output
All artifacts land in a `docs/` directory:
```
docs/
├── main.tex              # Master LaTeX document
├── chapters/
│   ├── 01-overview.tex
│   ├── 02-architecture.tex
│   ├── 03-modules.tex
│   └── 04-examples.tex
├── diagrams/
│   ├── architecture.puml  # PlantUML source
│   ├── flowchart.mmd      # Mermaid source
│   └── generated/         # Converted images
├── code/                  # Linked code listings
└── build/
    └── output.pdf         # Compiled PDF
```

### Step 4: Polish and Deliver
- Compile LaTeX → PDF
- Verify diagrams rendered correctly
- User reviews, provides feedback
- Iterate on LaTeX or code
- Final PDF ready for students/stakeholders

## Key Features

**Language & Visuals**
- Automatic syntax highlighting for any language
- Multi-language support (Python, JavaScript, Java, Go, Rust, C++, etc.)
- PlantUML for formal architecture (UML, ER, deployment)
- Mermaid for flowcharts, sequences, state diagrams, Gantt charts

**Student-Friendly Options**
- Pedagogical mode: step-by-step explanations, "why" not just "what"
- Example-driven: real code + output shown together
- Glossary and key concepts section
- Margin notes for advanced topics

**Flexibility**
- Inline code snippets or full file listings
- Custom LaTeX preamble (fonts, colors, page layout)
- Support for multiple languages in one document
- Appendices for deep dives (proofs, algorithms, performance analysis)

**Integration**
- Works with existing codebases (no refactoring required)
- Respects your code style and structure
- Pulls live code (not screenshots)
- Tracks changes: update code → regenerate docs

## Example Invocations

### Example 1: Auth API with Specific Diagrams
```
/code-to-doc
User: Implement a REST API endpoint for user auth and document it for students

→ Skill asks: Audience level? (intro, intermediate, advanced)
→ Skill asks: Which diagrams? ☑ Sequence ☑ Class ☑ State ☐ Use Case ☐ Activity
→ Codes the endpoint with tests
→ Generates sequence diagram (HTTP flow)
→ Generates class diagram (User, Token, Auth models)
→ Generates state diagram (token lifecycle)
→ Writes LaTeX explaining OAuth flow, error handling, security
→ Compiles PDF with 3 embedded diagrams and code
```

### Example 2: Project Exploration with Architecture Focus
```
/code-to-doc
User: Explore this Python project and create docs for new team members

→ Skill scans project structure
→ Skill asks: Which diagrams? ☑ Deployment ☑ Component ☑ ER ☐ Activity ☐ Others
→ Generates deployment diagram (Docker, Kubernetes setup)
→ Generates component diagram (modules, dependencies)
→ Generates ER diagram (database schema)
→ Extracts key classes and functions
→ Creates module-by-module LaTeX guide
→ Adds "getting started" section with examples
→ Compiles PDF with architecture diagrams
```

### Example 3: Workflow Design (Diagram-First)
```
/code-to-doc
User: Design a multi-step checkout flow with diagrams

→ Skill asks: Which diagrams? ☑ Activity ☑ Sequence ☑ State ☑ Flowchart
→ Generates activity diagram (checkout steps)
→ Generates sequence diagram (user-system interactions)
→ Generates state diagram (order status lifecycle)
→ Generates flowchart (decision logic)
→ User reviews, refines diagrams
→ Codes the checkout system
→ Generates LaTeX tying code to diagrams
```

## What the Skill Does FOR You

✅ **Saves time** — No manual LaTeX boilerplate, diagram drawing, or doc structure  
✅ **Keeps docs in sync** — Update code → regenerate docs from live source  
✅ **Looks professional** — Proper typography, consistent formatting, publication-ready  
✅ **Scales to projects** — Handles single files to multi-module systems  
✅ **Serves students** — Pedagogical explanations without sacrificing depth  

## What YOU Still Control

- **Content** — What goes in the docs, what's omitted, tone
- **Structure** — Chapter order, section depth, appendices
- **Visuals** — Diagram style, code highlighting, layout
- **Audience** — Tailor explanations for students, engineers, or executives

## Output Format

- **Primary**: `docs/main.pdf` — Ready to share, print, or publish
- **Sources**: `.tex` files — Editable, versionable, integrable with larger documents
- **Diagrams**: `.puml`, `.mmd` — Version control friendly, regenerable
- **Code listings**: Linked from live source or embedded as snapshots

---

**Use this skill whenever you code something and need docs to match, or when you're exploring a project and need to explain it to others.**

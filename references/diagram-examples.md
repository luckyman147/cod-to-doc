# Diagram Examples for Code-to-Doc

## PlantUML Examples

### Class Diagram
```puml
@startuml
class User {
  - id: int
  - username: string
  - email: string
  + register(): void
  + login(): bool
  + logout(): void
}

class AuthToken {
  - token: string
  - expiresAt: datetime
  + validate(): bool
  + refresh(): void
}

User --> AuthToken : creates
@enduml
```

### Deployment Diagram
```puml
@startuml
!define AWSPUML https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/v14.0/dist

actor Client
node "Web Application" {
  component API
  component Frontend
}

database "PostgreSQL" {
  entity Users
  entity Sessions
}

Client --> Frontend: uses
Frontend --> API: calls
API --> Users: queries
API --> Sessions: manages

@enduml
```

### Activity Diagram
```puml
@startuml
start
:User enters credentials;
if (Valid?) then (yes)
  :Create session token;
  :Redirect to dashboard;
else (no)
  :Show error message;
  :Retry login;
endif
stop
@enduml
```

## Mermaid Examples

### Flowchart
```mermaid
graph TD
    A[User Submits Form] --> B{Input Valid?}
    B -->|Yes| C[Create Account]
    B -->|No| D[Show Error]
    D --> A
    C --> E[Send Verification Email]
    E --> F{Email Confirmed?}
    F -->|Yes| G[Account Active]
    F -->|No| H[Expire Link After 24h]
```

### Sequence Diagram
```mermaid
sequenceDiagram
    actor User
    participant Frontend
    participant API
    participant Database
    
    User->>Frontend: Click Login
    Frontend->>API: POST /auth/login
    API->>Database: Query user by email
    Database-->>API: User record
    API->>API: Compare password hash
    API->>Database: Create session
    Database-->>API: Session token
    API-->>Frontend: Return token
    Frontend-->>User: Redirect to dashboard
```

### State Diagram
```mermaid
stateDiagram-v2
    [*] --> Logged Out
    Logged Out --> Authenticating: Enter credentials
    Authenticating --> Logged In: Success
    Authenticating --> Logged Out: Failure
    Logged In --> Session Active: Token valid
    Session Active --> Session Expired: Timeout
    Session Expired --> Logged Out
    Logged In --> Logged Out: Logout
```

### Entity Relationship Diagram
```mermaid
erDiagram
    USER ||--o{ AUTH_SESSION : creates
    USER ||--o{ POST : writes
    AUTH_SESSION ||--|| TOKEN : contains
    POST ||--o{ COMMENT : has
    
    USER {
        int id PK
        string username UK
        string email UK
        string password_hash
        datetime created_at
    }
    
    AUTH_SESSION {
        int id PK
        int user_id FK
        string token
        datetime expires_at
    }
    
    TOKEN {
        int id PK
        int session_id FK
        string value
        int ttl
    }
    
    POST {
        int id PK
        int user_id FK
        string title
        string content
        datetime created_at
    }
    
    COMMENT {
        int id PK
        int post_id FK
        string text
        datetime created_at
    }
```

### Gantt Chart (Timeline)
```mermaid
gantt
    title Project Timeline
    dateFormat YYYY-MM-DD
    
    section Planning
    Requirements Gathering :des1, 2024-01-01, 30d
    Design Review :des2, after des1, 20d
    
    section Development
    Backend API :dev1, 2024-02-01, 45d
    Frontend :dev2, 2024-02-15, 50d
    Integration Testing :dev3, after dev1, dev2, 15d
    
    section Deployment
    Staging :deploy1, after dev3, 10d
    Production :deploy2, after deploy1, 5d
```

## How to Use in LaTeX

### Embedding PlantUML as SVG
```latex
\begin{figure}[h]
  \centering
  \includegraphics[width=0.8\textwidth]{diagrams/generated/architecture.svg}
  \caption{System Architecture}
  \label{fig:architecture}
\end{figure}
```

### Embedding Mermaid as PNG
```latex
\begin{figure}[h]
  \centering
  \includegraphics[width=0.8\textwidth]{diagrams/generated/user-flow.png}
  \caption{User Authentication Flow}
  \label{fig:user-flow}
\end{figure}
```

### Cross-referencing
```latex
As shown in Figure \ref{fig:architecture}, the system consists of three layers...
```

## Tools for Conversion

### PlantUML to SVG/PNG
```bash
plantuml -tsvg diagrams/architecture.puml -o diagrams/generated/
plantuml -tpng diagrams/architecture.puml -o diagrams/generated/
```

### Mermaid to SVG/PNG (using mmdc)
```bash
mmdc -i diagrams/flowchart.mmd -o diagrams/generated/flowchart.svg
mmdc -i diagrams/sequence.mmd -o diagrams/generated/sequence.png
```

### Building LaTeX
```bash
pdflatex -interaction=nonstopmode -output-directory=docs/build docs/main.tex
# May need to run twice for TOC to update
pdflatex -interaction=nonstopmode -output-directory=docs/build docs/main.tex
```

## Best Practices

1. **Keep diagrams simple** — Complex diagrams should be broken into smaller ones
2. **Label everything** — Clear labels and legends improve understanding
3. **Use consistent styling** — Match color schemes and fonts with LaTeX theme
4. **Version your diagrams** — Commit .puml and .mmd files, not just generated images
5. **Layer information** — Provide detail-progressive diagrams (high-level first, then zoomed-in)
6. **Student-friendly** — Add brief explanations under each diagram

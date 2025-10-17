# Agent Catalog

Comprehensive guide to all available agents in this collection.

---

## 🔴 Priority Agents (Start Here)

### complexity-reducer

**Category**: Code Quality
**Difficulty**: Advanced
**MCP Requirements**: Neo4j

**Description**:
Performs comprehensive cyclomatic complexity reduction across entire codebases by analyzing dependencies, refactoring large modules into smaller ones (≤500-550 lines), and tracking all changes in Neo4j databases.

**When to Use**:
- After completing major features to maintain code quality
- When files exceed 500 lines
- To systematically reduce technical debt
- Before code reviews to improve maintainability

**Capabilities**:
- Creates timestamped Neo4j "before" and "after" databases
- Analyzes all module dependencies using AST parsing
- Refactors large files while preserving functionality
- Tracks every dependency to ensure nothing breaks
- Generates comprehensive reconciliation reports

**Example Usage**:
```
User: "Analyze the entire codebase and reduce complexity where needed"
Agent: Creates before_20251016_143022 and after_20251016_143022 databases,
       analyzes dependencies, refactors files >500 lines, reconciles changes
```

---

### ai-ml-architect

**Category**: AI/ML
**Difficulty**: Expert
**MCP Requirements**: Neo4j, DuckDuckGo, Sequential Thinking

**Description**:
Elite AI/ML architect with expertise in neural networks, deep learning, LLM fine-tuning, RAG systems (standard, CRAG, GraphRAG, HybridRAG), knowledge graphs, and vector embeddings.

**When to Use**:
- Designing AI/ML systems and architectures
- Implementing RAG pipelines
- Optimizing embedding strategies
- Creating knowledge graph schemas
- Integrating LLMs into applications

**Capabilities**:
- Designs GraphRAG systems with Neo4j optimization
- Researches latest AI/ML techniques via DuckDuckGo
- Tests graph schemas with real Cypher queries
- Uses Sequential Thinking for complex architectural decisions
- Provides production-ready implementations (no mock code)

**Example Usage**:
```
User: "Design a GraphRAG system for medical document retrieval"
Agent: Researches latest GraphRAG papers, designs Neo4j schema,
       tests with actual queries, provides implementation plan
```

---

### honest-broker

**Category**: Quality Assurance
**Difficulty**: Intermediate
**MCP Requirements**: GitHub

**Description**:
Uncompromising truth-teller and accountability enforcer. Verifies claims of completion, readiness, and success with rigorous scrutiny.

**When to Use**:
- When Claude claims "100% complete"
- Before production deployments
- To verify test results
- When assessing production readiness

**Capabilities**:
- Checks actual GitHub CI/CD test results
- Verifies deployment configurations
- Examines code for TODO/FIXME markers
- Provides brutally honest assessments
- Lists remaining work with file locations

**Example Usage**:
```
User: "Is the application production-ready?"
Agent: Uses GitHub MCP to check CI/CD runs, verifies tests,
       examines code, provides honest assessment with evidence
```

---

### backend-infrastructure-expert

**Category**: Backend Development
**Difficulty**: Advanced
**MCP Requirements**: GitHub, Neo4j

**Description**:
Elite backend infrastructure expert specializing in server-side development, distributed systems, database optimization, and security engineering.

**When to Use**:
- Reviewing API endpoints for security/performance
- Optimizing database queries
- Implementing authentication systems
- Designing microservice architectures
- Security audits

**Capabilities**:
- Analyzes GitHub repository structure and CI/CD
- Optimizes Neo4j queries with PROFILE analysis
- Reviews backend code for security vulnerabilities
- Implements production-grade server-side solutions
- Creates database indexes and performance optimizations

**Example Usage**:
```
User: "Review the user registration endpoint for security"
Agent: Uses GitHub to analyze code, checks for SQL injection,
       validates authentication, provides security recommendations
```

---

## 🟡 Specialized Agents

### database-architect-neo4j

**Category**: Database Architecture
**Difficulty**: Expert
**MCP Requirements**: Neo4j

**Description**:
Elite database architect specializing in Neo4j systems that combine graph and vector capabilities for RAG applications.

**When to Use**:
- Designing integrated database schemas
- Planning multi-database architectures
- Optimizing chunking/embedding strategies
- Creating efficient node/relationship structures

**Capabilities**:
- Validates schema designs with real Cypher queries
- Tests query performance against sample data
- Benchmarks alternative approaches
- Designs vector-graph hybrid systems

---

### neo4j-schema-architect

**Category**: Graph Database Design
**Difficulty**: Advanced
**MCP Requirements**: Neo4j

**Description**:
World-class Neo4j schema architect with expertise in graph database design, Cypher query optimization, and knowledge graph engineering.

**When to Use**:
- Starting new Neo4j implementations
- Refactoring existing graph schemas
- Optimizing for specific query patterns
- Establishing indexing strategies

**Capabilities**:
- Tests schema designs in real-time
- Verifies index performance with PROFILE queries
- Validates constraints against sample data
- Prototypes schema alternatives

---

### neo4j-chunking-strategist

**Category**: RAG Systems
**Difficulty**: Advanced
**MCP Requirements**: Neo4j, DuckDuckGo

**Description**:
Elite chunking strategy architect with expertise in document processing, information retrieval, and Neo4j optimization for RAG systems.

**When to Use**:
- Designing document ingestion pipelines
- Optimizing retrieval performance
- Troubleshooting poor search results
- Implementing hybrid chunking strategies

**Capabilities**:
- Tests chunking strategies in Neo4j
- Researches latest chunking techniques
- Benchmarks retrieval performance
- Validates chunk storage patterns

---

### chief-software-architect

**Category**: System Architecture
**Difficulty**: Expert
**MCP Requirements**: Sequential Thinking, DuckDuckGo

**Description**:
Chief software architect specializing in AI applications, distributed systems, and creating scalable, maintainable architectures.

**When to Use**:
- High-level system design
- Technology stack selection
- Architectural reviews
- Complex integration challenges

**Capabilities**:
- Uses Sequential Thinking for systematic decisions
- Researches architectural patterns via DuckDuckGo
- Evaluates trade-offs methodically
- Designs for scalability and maintainability

---

## ⚪ Supporting Agents

### autonomous-qa-engineer
**Category**: Testing
**MCP**: None
Automated testing and comprehensive quality assurance.

### compliance-enforcer
**Category**: Code Quality
**MCP**: None
Validates code against project rules and standards.

### frontend-expert
**Category**: Frontend Development
**MCP**: DuckDuckGo (optional)
Frontend development, React/Vue expertise, performance optimization.

### gui-designer
**Category**: UI/UX Design
**MCP**: DuckDuckGo (optional)
UI/UX design, accessibility, modern design standards.

### medical-imaging-expert
**Category**: Medical AI
**MCP**: None
DICOM processing, medical imaging, 3D reconstruction.

### task-completion-monitor
**Category**: Task Management
**MCP**: None
Ensures multi-step tasks complete without manual intervention.

---

## 🎯 Quick Selection Guide

**Need to...**
- Reduce code complexity? → **complexity-reducer**
- Design an AI/ML system? → **ai-ml-architect**
- Verify completion claims? → **honest-broker**
- Optimize a database? → **database-architect-neo4j** or **neo4j-schema-architect**
- Review backend code? → **backend-infrastructure-expert**
- Design system architecture? → **chief-software-architect**
- Optimize RAG retrieval? → **neo4j-chunking-strategist**

---

**See [USAGE.md](USAGE.md) for detailed usage instructions.**

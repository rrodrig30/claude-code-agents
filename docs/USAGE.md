# Usage Guide

Comprehensive guide for using Claude Code agents effectively in your development workflow.

---

## 🚀 Getting Started

### Basic Agent Invocation

Agents can be invoked in two ways:

**1. Explicit Invocation**
```
User: "Use the complexity-reducer agent to analyze my codebase"
Claude: "I'll launch the complexity-reducer agent to perform comprehensive complexity analysis..."
```

**2. Automatic Selection**
```
User: "My codebase has files over 1000 lines"
Claude: "I'm using the complexity-reducer agent to systematically refactor oversized modules..."
```

Claude Code automatically selects the appropriate agent based on your request when the task clearly matches an agent's description.

---

## 🎯 Agent Selection Guide

### When to Use Which Agent

**Code Quality & Complexity**
- File size issues (>500 lines) → **complexity-reducer**
- Code review needed → **compliance-enforcer**
- General refactoring → **complexity-reducer**

**AI/ML Development**
- Design RAG system → **ai-ml-architect**
- Optimize embeddings → **ai-ml-architect**
- GraphRAG architecture → **ai-ml-architect** + **database-architect-neo4j**

**Database Architecture**
- Design Neo4j schema → **neo4j-schema-architect**
- Optimize graph queries → **database-architect-neo4j**
- RAG chunking strategy → **neo4j-chunking-strategist**
- Vector-graph hybrid system → **database-architect-neo4j**

**Backend Development**
- API design → **backend-infrastructure-expert**
- Security audit → **backend-infrastructure-expert**
- Database optimization → **backend-infrastructure-expert**
- Authentication system → **backend-infrastructure-expert**

**System Architecture**
- High-level design → **chief-software-architect**
- Technology selection → **chief-software-architect**
- Microservices design → **chief-software-architect**

**Verification & QA**
- Verify completion claims → **honest-broker**
- Production readiness → **honest-broker**
- Automated testing → **autonomous-qa-engineer**

**Frontend & UI**
- React/Vue development → **frontend-expert**
- UI/UX design → **gui-designer**
- Accessibility review → **gui-designer**

**Specialized Tasks**
- Medical imaging → **medical-imaging-expert**
- Multi-step task tracking → **task-completion-monitor**

---

## 💡 Best Practices

### 1. Be Specific About Your Needs

**Good:**
```
"Use the ai-ml-architect agent to design a GraphRAG system for medical document retrieval with Neo4j"
```

**Less Effective:**
```
"Help me with RAG"
```

### 2. Combine Agents for Complex Workflows

**Example: Building a Production RAG System**

1. **Architecture Design** (chief-software-architect)
   - Define system components and data flow
   - Select technology stack

2. **Database Schema** (database-architect-neo4j)
   - Design Neo4j graph schema
   - Plan vector storage strategy

3. **Chunking Strategy** (neo4j-chunking-strategist)
   - Optimize document chunking
   - Design retrieval patterns

4. **Implementation** (ai-ml-architect)
   - Implement RAG pipeline
   - Integrate embeddings

5. **Backend Integration** (backend-infrastructure-expert)
   - Create API endpoints
   - Add authentication

6. **Quality Assurance** (autonomous-qa-engineer)
   - Comprehensive testing
   - Performance validation

7. **Production Verification** (honest-broker)
   - Verify readiness
   - Identify gaps

### 3. Leverage MCP Tools

Agents with MCP tools are more powerful:

**Neo4j MCP** (complexity-reducer, ai-ml-architect, database architects)
```
"Use the neo4j-schema-architect agent to design and test a schema in Neo4j"
```
The agent will execute actual Cypher queries to validate the design.

**GitHub MCP** (honest-broker, backend-infrastructure-expert)
```
"Use the honest-broker agent to verify our production deployment"
```
The agent will check actual CI/CD runs and deployment status.

**DuckDuckGo Search** (ai-ml-architect, neo4j-chunking-strategist, chief-software-architect)
```
"Use the ai-ml-architect agent to research the latest GraphRAG techniques"
```
The agent will search for recent papers and implementations.

**Sequential Thinking** (ai-ml-architect, chief-software-architect)
```
"Use the chief-software-architect agent to evaluate microservices vs monolith"
```
The agent will systematically analyze trade-offs step by step.

### 4. Provide Context

**Include:**
- Project constraints (timeline, team size, budget)
- Existing technology stack
- Performance requirements
- Security/compliance needs

**Example:**
```
"Use the backend-infrastructure-expert agent to review our user registration endpoint.
We're using Flask with PostgreSQL, need HIPAA compliance, and expect 10K users/day."
```

---

## 🔄 Common Workflows

### Workflow 1: Code Quality Improvement

```
1. User: "Analyze the entire codebase and reduce complexity"
   → complexity-reducer agent

2. Agent creates Neo4j before/after databases
   → Analyzes all dependencies
   → Refactors files >500 lines
   → Generates reconciliation report

3. User: "Verify the refactoring is complete"
   → honest-broker agent

4. Agent checks for TODO markers, tests, deployment readiness
```

### Workflow 2: New Feature Development

```
1. User: "Design architecture for real-time notification system"
   → chief-software-architect agent

2. Agent researches patterns, uses Sequential Thinking
   → Proposes architecture with WebSockets, Redis, PostgreSQL

3. User: "Implement the backend API"
   → backend-infrastructure-expert agent

4. Agent implements endpoints, authentication, testing

5. User: "Verify production readiness"
   → honest-broker agent
```

### Workflow 3: RAG System Development

```
1. User: "Design a GraphRAG system for legal document retrieval"
   → ai-ml-architect agent

2. Agent researches latest GraphRAG papers
   → Designs high-level architecture

3. User: "Create the Neo4j schema"
   → database-architect-neo4j agent

4. Agent designs schema, tests with Cypher queries

5. User: "Optimize the chunking strategy"
   → neo4j-chunking-strategist agent

6. Agent researches techniques, tests in Neo4j

7. User: "Verify the implementation"
   → honest-broker agent
```

---

## ⚠️ Common Patterns & Anti-Patterns

### ✅ Good Patterns

**1. Sequential Agent Use for Complex Projects**
```
Architecture → Database Design → Implementation → Testing → Verification
```

**2. Explicit Agent Selection for Critical Tasks**
```
"Use the honest-broker agent to verify production readiness"
(Don't rely on automatic selection for verification)
```

**3. Providing Full Context**
```
"Use the backend-infrastructure-expert agent to optimize our API.
Current: Flask, PostgreSQL, 100ms average latency, need <50ms for mobile app."
```

**4. Leveraging MCP Tools**
```
"Use the ai-ml-architect agent to research and implement GraphRAG"
(Agent will use DuckDuckGo to research, Neo4j MCP to test)
```

### ❌ Anti-Patterns

**1. Vague Requests**
```
❌ "Make it better"
✅ "Use the complexity-reducer agent to refactor files over 500 lines"
```

**2. Skipping Verification**
```
❌ Assuming implementation is complete
✅ Always use honest-broker agent to verify completion claims
```

**3. Wrong Agent for Task**
```
❌ Using frontend-expert for database schema design
✅ Use database-architect-neo4j for Neo4j schemas
```

**4. Not Providing Constraints**
```
❌ "Design a system"
✅ "Design a HIPAA-compliant system with <100ms latency for 10K users/day"
```

**5. Ignoring MCP Requirements**
```
❌ Using complexity-reducer without Neo4j MCP installed
✅ Install required MCP tools first (see MCP_SETUP.md)
```

---

## 🔧 Advanced Usage

### Running Agents in Parallel

For independent tasks, run agents in parallel:

```
User: "Use the frontend-expert agent to review the React components
AND use the backend-infrastructure-expert agent to review the API endpoints"

Claude Code will run both agents simultaneously.
```

### Chaining Agent Outputs

Use one agent's output as input to another:

```
1. chief-software-architect → System design document
2. database-architect-neo4j → Database schema from design
3. backend-infrastructure-expert → API implementation from schema
4. honest-broker → Verification of implementation
```

### Agent-Specific Configuration

Some agents accept configuration through context:

**complexity-reducer:**
```
"Use the complexity-reducer agent with maximum module size of 400 lines"
```

**ai-ml-architect:**
```
"Use the ai-ml-architect agent to design GraphRAG with Ollama models only (no cloud APIs)"
```

---

## 🐛 Troubleshooting

### Agent Not Available

**Problem:** "Agent not found" error

**Solution:**
```bash
# Check installed agents
ls ~/.claude/agents/

# Install missing agent
cp ~/claude-code-agents/agents/[agent-name].md ~/.claude/agents/

# Restart Claude Code
```

### MCP Tools Not Working

**Problem:** Agent says MCP tool failed or unavailable

**Solution:**
```bash
# Check MCP status
claude mcp list

# Reinstall failed MCP server
claude mcp remove [server-name] -s local
# Then reinstall (see MCP_SETUP.md)

# Restart Claude Code
```

### Agent Produces Incomplete Results

**Problem:** Agent finishes but work is incomplete

**Solution:**
1. Use **honest-broker** agent to verify completion
2. Provide more specific requirements
3. Check if MCP tools are required but not installed

### Wrong Agent Selected

**Problem:** Claude Code chose wrong agent automatically

**Solution:**
Use explicit invocation:
```
"Use the [specific-agent] agent to [task]"
```

---

## 📊 Agent Effectiveness Matrix

| Task Type | Best Agent | Alternative | Verify With |
|-----------|-----------|-------------|-------------|
| Code complexity | complexity-reducer | - | honest-broker |
| AI/ML architecture | ai-ml-architect | chief-software-architect | honest-broker |
| Neo4j schema | neo4j-schema-architect | database-architect-neo4j | honest-broker |
| API design | backend-infrastructure-expert | chief-software-architect | honest-broker |
| Security audit | backend-infrastructure-expert | - | honest-broker |
| System design | chief-software-architect | - | honest-broker |
| RAG optimization | neo4j-chunking-strategist | ai-ml-architect | honest-broker |
| Testing | autonomous-qa-engineer | - | honest-broker |
| Frontend | frontend-expert | - | gui-designer |
| UI/UX | gui-designer | frontend-expert | - |

---

## 🎓 Learning Path

**Week 1: Basics**
1. Install agents and MCP tools
2. Try complexity-reducer on small project
3. Use honest-broker to verify results

**Week 2: Specialization**
1. Experiment with ai-ml-architect for RAG design
2. Use database-architect-neo4j for schema design
3. Practice agent chaining

**Week 3: Advanced Workflows**
1. Combine multiple agents for full project
2. Use MCP tools effectively
3. Develop custom workflows

**Week 4: Teaching Others**
1. Share agents with team
2. Create team-specific examples
3. Document team workflows

---

## 📚 Additional Resources

- **[Agent Catalog](AGENT_CATALOG.md)** - Detailed agent descriptions
- **[MCP Setup](MCP_SETUP.md)** - Installing and configuring MCP tools
- **[Teaching Guide](TEACHING_GUIDE.md)** - Guide for instructors
- **[Examples](../examples/)** - Real-world usage examples

---

**Next Steps**: See [TEACHING_GUIDE.md](TEACHING_GUIDE.md) for instructor resources and curriculum planning.

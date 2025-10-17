# Example Conversations

Real-world examples demonstrating Claude Code agents in action.

---

## Overview

These examples show how to use agents for common development tasks. Each example includes:
- Complete conversation transcripts
- Agent selection rationale
- MCP tool usage
- Expected outputs
- Verification steps

---

## Examples

### [01_complexity_reduction.md](01_complexity_reduction.md)
**Agent**: complexity-reducer
**MCP Tools**: Neo4j
**Complexity**: Intermediate
**Time**: ~1 hour

Demonstrates systematic code complexity reduction with Neo4j dependency tracking. Shows how to refactor a 3500-line file into logical modules while preserving all dependencies.

**Key Learning Points:**
- Timestamped Neo4j databases for before/after comparison
- Dependency graph visualization
- Systematic refactoring workflow
- Verification with honest-broker

**Best For:**
- Learning complexity-reducer basics
- Understanding Neo4j MCP integration
- Code quality improvement projects

---

### [02_graphrag_system_design.md](02_graphrag_system_design.md)
**Agents**: chief-software-architect, database-architect-neo4j, neo4j-chunking-strategist, ai-ml-architect, honest-broker
**MCP Tools**: Neo4j, GitHub, DuckDuckGo, Sequential Thinking
**Complexity**: Advanced
**Time**: ~48 hours

Complete multi-agent workflow for designing and implementing a production GraphRAG system for medical document retrieval.

**Key Learning Points:**
- Agent chaining for complex projects
- Using multiple MCP tools together
- Researching with DuckDuckGo
- Decision-making with Sequential Thinking
- Production readiness verification

**Best For:**
- Advanced agent users
- AI/ML system design
- Learning multi-agent workflows
- Enterprise project planning

---

### [03_production_deployment_verification.md](03_production_deployment_verification.md)
**Agent**: honest-broker
**MCP Tools**: GitHub
**Complexity**: Beginner
**Time**: ~15 minutes

*(Coming Soon)*

Shows how to use honest-broker to verify a system is truly production-ready, including checking CI/CD runs, deployment configurations, and identifying gaps.

**Best For:**
- Learning honest-broker usage
- Production deployment validation
- Quality assurance

---

### [04_api_security_review.md](04_api_security_review.md)
**Agent**: backend-infrastructure-expert
**MCP Tools**: Neo4j, GitHub
**Complexity**: Intermediate
**Time**: ~2 hours

*(Coming Soon)*

Comprehensive security review of REST API endpoints, including authentication, authorization, input validation, and common vulnerabilities.

**Best For:**
- Backend security
- API design review
- Learning backend-infrastructure-expert

---

### [05_custom_agent_development.md](05_custom_agent_development.md)
**Agent**: N/A (teaching custom agent creation)
**MCP Tools**: Variable
**Complexity**: Advanced
**Time**: ~3 hours

*(Coming Soon)*

Step-by-step guide to creating custom agents for team-specific needs, including agent markdown format, MCP tool integration, and testing.

**Best For:**
- Creating custom agents
- Advanced users
- Team-specific workflows

---

## Example Categories

### By Complexity

**Beginner:**
- 03_production_deployment_verification.md

**Intermediate:**
- 01_complexity_reduction.md
- 04_api_security_review.md

**Advanced:**
- 02_graphrag_system_design.md
- 05_custom_agent_development.md

### By Agent Type

**Code Quality:**
- 01_complexity_reduction.md

**AI/ML:**
- 02_graphrag_system_design.md

**Backend:**
- 04_api_security_review.md

**Verification:**
- 03_production_deployment_verification.md

**Custom Development:**
- 05_custom_agent_development.md

### By MCP Tool

**Neo4j:**
- 01_complexity_reduction.md
- 02_graphrag_system_design.md
- 04_api_security_review.md

**GitHub:**
- 02_graphrag_system_design.md
- 03_production_deployment_verification.md
- 04_api_security_review.md

**DuckDuckGo:**
- 02_graphrag_system_design.md

**Sequential Thinking:**
- 02_graphrag_system_design.md

---

## How to Use These Examples

### 1. Read the Example
Start by reading the complete example to understand the workflow.

### 2. Set Up Your Environment
Ensure you have the required agents and MCP tools installed:

```bash
# Check installed agents
ls ~/.claude/agents/

# Check MCP tools
claude mcp list

# Install missing tools (see docs/MCP_SETUP.md)
```

### 3. Try on Your Own Project
Adapt the example to your own codebase or project:

```
"Use the [agent-name] agent to [task] on my project at [path]"
```

### 4. Verify Results
Always verify agent outputs:

```
"Use the honest-broker agent to verify this is complete"
```

---

## Example Template

When creating your own examples or documenting agent usage, use this template:

```markdown
# Example: [Task Name]

## Scenario
[Describe the business problem or technical challenge]

## User Request
```
[Exact user message to Claude Code]
```

## Agent Selection
**Agent**: [agent-name]
**MCP Tools**: [list of tools used]
**Rationale**: [Why this agent?]

## Agent Process
[Step-by-step breakdown of what the agent does]

## Agent Output
[Actual output from the agent]

## Verification
[How to verify the results]

## Key Takeaways
- [Learning point 1]
- [Learning point 2]
- [Learning point 3]
```

---

## Contributing Examples

Have a great example of agent usage? Contribute it!

1. Fork the repository
2. Create an example using the template above
3. Add it to this directory
4. Update this README
5. Submit a pull request

See [docs/CONTRIBUTING.md](../docs/CONTRIBUTING.md) for guidelines.

---

## Additional Resources

- **[Usage Guide](../docs/USAGE.md)** - How to use agents effectively
- **[Agent Catalog](../docs/AGENT_CATALOG.md)** - Detailed agent descriptions
- **[MCP Setup](../docs/MCP_SETUP.md)** - Installing MCP tools
- **[Teaching Guide](../docs/TEACHING_GUIDE.md)** - For instructors

---

**Note**: Examples marked *(Coming Soon)* are planned for future releases. Check back for updates or contribute your own!

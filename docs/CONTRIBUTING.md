# Contributing to Claude Code Agent Collection

We welcome contributions! This guide will help you contribute agents, examples, and improvements.

---

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How to Contribute](#how-to-contribute)
- [Agent Contribution Guidelines](#agent-contribution-guidelines)
- [Documentation Standards](#documentation-standards)
- [Example Contribution Guidelines](#example-contribution-guidelines)
- [Pull Request Process](#pull-request-process)

---

## Code of Conduct

This project follows a simple code of conduct:

- Be respectful and constructive
- Focus on what's best for the community
- Show empathy toward other community members
- Accept constructive criticism gracefully

---

## How to Contribute

### Types of Contributions

**Agents:**
- New specialized agents
- Improvements to existing agents
- Bug fixes in agent prompts

**Documentation:**
- Usage examples
- Tutorial improvements
- Translation to other languages

**Examples:**
- Real-world usage scenarios
- Integration patterns
- Best practices

**Infrastructure:**
- Installation script improvements
- MCP tool integrations
- Testing frameworks

---

## Agent Contribution Guidelines

### Agent Quality Standards

All agents must meet these criteria:

1. **Clear Purpose**: Agent solves a specific, well-defined problem
2. **Proper Scope**: Not too broad, not too narrow
3. **MCP Integration**: Uses appropriate MCP tools when beneficial
4. **Documentation**: Includes description with usage examples
5. **Testing**: Tested on real-world projects

### Agent Markdown Format

Use this template for all agents:

```markdown
---
name: agent-name
description: [Agent description with usage examples in <example> tags]
model: sonnet|haiku|inherit
color: blue|green|red|purple|pink|yellow
---

[Agent system prompt]

## MCP Tool Integration (if applicable)

**CRITICAL: You have access to [tool names] for [purposes].**

**[Tool Name]** - Use for:
- [Use case 1]
- [Use case 2]

**Example Usage:**
[Show concrete examples]

[Rest of agent instructions]
```

### Agent Naming Conventions

- Use kebab-case: `database-architect-neo4j`
- Be descriptive: `frontend-expert` not `fe-agent`
- Indicate specialization: `neo4j-schema-architect` not `schema-architect`

### Agent Description Format

The description field is critical - it determines when Claude Code invokes your agent. Use this format:

```markdown
description: Use this agent when [conditions]. Specifically invoke this agent when: [specific scenarios with examples].

Examples:
<example>
Context: [Situation]
user: "[User request]"
assistant: "[Claude Code response]"
<commentary>[Why this agent is appropriate]</commentary>
</example>
```

### MCP Tool Selection

Choose MCP tools based on agent capabilities:

| Agent Type | Recommended MCP Tools |
|------------|----------------------|
| Database-related | Neo4j |
| Verification | GitHub |
| Research-heavy | DuckDuckGo |
| Complex decisions | Sequential Thinking |

### Testing Your Agent

Before submitting:

1. **Install the agent**
   ```bash
   cp your-agent.md ~/.claude/agents/
   ```

2. **Test invocation**
   ```
   User: "Use the [your-agent] agent to [task]"
   ```

3. **Verify MCP tools work**
   ```bash
   claude mcp list  # Check required tools are installed
   ```

4. **Test on real project**
   - Use agent on actual codebase
   - Document results
   - Identify edge cases

5. **Get peer review**
   - Share with colleague
   - Get feedback on usefulness
   - Iterate based on feedback

---

## Documentation Standards

### Writing Style

- **Clear and Concise**: No jargon without explanation
- **Actionable**: Include concrete examples
- **Structured**: Use headers, lists, code blocks
- **Complete**: Don't assume prior knowledge

### Code Examples

Always include:
- Complete, runnable code
- Expected output
- Explanation of what it does

**Good Example:**
```markdown
Use the complexity-reducer agent to analyze your codebase:

```
User: "Use the complexity-reducer agent to analyze my project"
```

Expected Output:
- Neo4j databases created: before_YYYYMMDD_HHMMSS, after_YYYYMMDD_HHMMSS
- Refactoring recommendations for files >500 lines
- Dependency reconciliation report
```

### Screenshots and Diagrams

When helpful, include:
- Architecture diagrams (use Mermaid, PlantUML, or ASCII art)
- Screenshots of Neo4j Browser showing graphs
- Terminal output examples

---

## Example Contribution Guidelines

### Example Structure

Use this template:

```markdown
# Example: [Task Name]

## Scenario
[Describe the problem]

**Project Structure:**
```
[Directory tree]
```

## User Request
```
[Exact user message]
```

## Agent: [agent-name]

**MCP Tools**: [tools used]
**Why This Agent**: [rationale]

## Agent Process

### Step 1: [Step Name]
[Detailed explanation]

[Code or queries if applicable]

### Step 2: [Step Name]
...

## Agent Output
[Actual output]

## Verification
[How to verify]

## Key Takeaways
- [Learning 1]
- [Learning 2]

## Files Changed
[List of files created/modified/deleted]
```

### Example Quality Standards

1. **Real-World Relevance**: Based on actual use cases
2. **Complete Workflow**: Shows full agent interaction
3. **Reproducible**: Others can follow along
4. **Educational**: Teaches best practices

---

## Pull Request Process

### 1. Fork and Clone

```bash
# Fork the repository on GitHub, then:
git clone https://github.com/YOUR_USERNAME/claude-code-agents.git
cd claude-code-agents
```

### 2. Create a Branch

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b agent/new-agent-name
# or
git checkout -b docs/documentation-improvement
```

### 3. Make Your Changes

**For New Agents:**
```bash
# Create agent file
cat > agents/your-agent.md << 'EOF'
---
name: your-agent
description: ...
---
[Agent content]
EOF

# Test it
cp agents/your-agent.md ~/.claude/agents/
# Test with Claude Code

# Document it
# Add to docs/AGENT_CATALOG.md
# Add usage example to examples/
```

**For Documentation:**
```bash
# Edit relevant .md files
# Ensure formatting is correct
# Check all links work
```

### 4. Test Thoroughly

**Agent Checklist:**
- [ ] Agent installs without errors
- [ ] Agent invokes correctly
- [ ] MCP tools work as expected
- [ ] Real-world testing completed
- [ ] Edge cases considered

**Documentation Checklist:**
- [ ] All code examples work
- [ ] All links are valid
- [ ] Formatting is consistent
- [ ] No typos or grammar errors

### 5. Commit Your Changes

```bash
git add .
git commit -m "feat: Add database-migration-expert agent

- Specializes in zero-downtime database migrations
- Integrates with PostgreSQL MCP
- Includes rollback procedures
- Tested on production migration scenarios"
```

**Commit Message Format:**
```
<type>: <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature (agent, example, etc.)
- `fix`: Bug fix
- `docs`: Documentation changes
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Maintenance tasks

### 6. Push and Create PR

```bash
git push origin feature/your-feature-name
```

Then create a Pull Request on GitHub with:

**Title:**
```
feat(agent): Add database-migration-expert agent
```

**Description Template:**
```markdown
## Description
[What does this PR do?]

## Type of Change
- [ ] New agent
- [ ] Agent improvement
- [ ] Documentation
- [ ] Example
- [ ] Bug fix

## Agent Details (if applicable)
- **Name**: database-migration-expert
- **Purpose**: Zero-downtime database migrations
- **MCP Tools**: PostgreSQL
- **Testing**: Tested on 3 production migrations

## Checklist
- [ ] Tested on real project
- [ ] Documentation updated
- [ ] Examples provided
- [ ] Follows agent template
- [ ] No sensitive data included

## Related Issues
Closes #123
```

### 7. Code Review Process

Maintainers will review your PR and may:
- Request changes
- Ask questions
- Suggest improvements
- Approve and merge

**Be Responsive:**
- Address feedback promptly
- Ask for clarification if needed
- Make requested changes

---

## Agent Review Criteria

When reviewing agent PRs, maintainers check:

### 1. Quality
- [ ] Agent solves a real problem
- [ ] Description is clear with examples
- [ ] System prompt is well-structured
- [ ] MCP tool integration is appropriate

### 2. Documentation
- [ ] Added to AGENT_CATALOG.md
- [ ] Usage examples provided
- [ ] MCP requirements documented

### 3. Testing
- [ ] Tested on real projects
- [ ] Edge cases considered
- [ ] MCP tools verified

### 4. Code Quality
- [ ] Follows template format
- [ ] No hardcoded credentials
- [ ] Proper markdown formatting
- [ ] No typos

---

## Getting Help

**Questions?**
- Open a [Discussion](https://github.com/yourusername/claude-code-agents/discussions)
- Ask in [Issues](https://github.com/yourusername/claude-code-agents/issues)

**Need Feedback?**
- Create a draft PR
- Tag maintainers
- Request specific feedback

---

## Recognition

Contributors will be:
- Listed in README.md
- Credited in release notes
- Acknowledged in agent metadata

---

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for contributing! 🎉**

Your agents and examples help the entire Claude Code community build better software.

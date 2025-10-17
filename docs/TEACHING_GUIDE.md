# Teaching Guide for Claude Code Agents

Comprehensive curriculum and teaching resources for instructors teaching Claude Code with professional agents.

---

## 📚 Course Overview

### Target Audience
- **Beginner**: Students new to AI-assisted development
- **Intermediate**: Developers familiar with Claude but new to agents
- **Advanced**: Teams implementing Claude Code in production

### Prerequisites
- Basic programming knowledge (Python, JavaScript, or similar)
- Familiarity with command-line interfaces
- Understanding of version control (Git)
- Access to Claude Code installation

### Learning Objectives

By the end of this course, students will be able to:
1. Install and configure Claude Code agents
2. Select appropriate agents for specific tasks
3. Use MCP tools to extend agent capabilities
4. Chain multiple agents for complex workflows
5. Verify agent outputs and production readiness
6. Create custom agents for team-specific needs

---

## 🎓 Curriculum Structure

### Week 1: Foundations (4 hours)

**Session 1: Introduction to Claude Code (2 hours)**

**Topics:**
- What is Claude Code?
- How Claude Code differs from ChatGPT/Copilot
- The agent system architecture
- Installing Claude Code

**Hands-On:**
```bash
# Verify Claude Code installation
claude --version

# Explore basic commands
claude --help

# First conversation with Claude Code
```

**Assignment:**
- Install Claude Code
- Complete first successful conversation
- Document challenges encountered

---

**Session 2: Agent Basics (2 hours)**

**Topics:**
- What are agents?
- Agent invocation (explicit vs automatic)
- Understanding agent scopes (local, project, user)
- Installing the agent collection

**Hands-On:**
```bash
# Clone agent repository
git clone [repository-url]

# Run installer
cd claude-code-agents
./install.sh --yes

# Verify installation
ls ~/.claude/agents/

# Restart Claude Code
```

**Exercise:**
```
Task: "Use the complexity-reducer agent to analyze a small Python project"

Expected Outcome:
- Agent creates Neo4j databases
- Identifies files >500 lines
- Provides refactoring recommendations
```

**Assignment:**
- Install all agents
- Try 3 different agents on personal projects
- Document which agents were most useful

---

### Week 2: Core Agents (6 hours)

**Session 3: Code Quality Agents (2 hours)**

**Focus Agents:**
- complexity-reducer
- compliance-enforcer
- task-completion-monitor

**Topics:**
- Measuring code complexity
- Automated refactoring
- Dependency tracking with Neo4j
- Code compliance validation

**Hands-On Exercise:**
```
Scenario: Legacy codebase with 5 files over 1000 lines each

Task 1: "Use complexity-reducer to analyze and refactor"
Task 2: "Use honest-broker to verify completeness"
Task 3: "Use compliance-enforcer to validate against coding standards"

Success Criteria:
- All files reduced to <500 lines
- All dependencies tracked
- No broken imports
- Compliance passes
```

**Teaching Notes:**
- Emphasize the importance of the honest-broker for verification
- Show Neo4j browser to visualize dependency graphs
- Demonstrate how timestamped databases prevent contamination

---

**Session 4: AI/ML Architecture (2 hours)**

**Focus Agents:**
- ai-ml-architect
- neo4j-schema-architect
- neo4j-chunking-strategist

**Topics:**
- RAG system architecture
- GraphRAG vs traditional RAG
- Knowledge graph design
- Document chunking strategies

**Hands-On Exercise:**
```
Scenario: Design a medical document retrieval system

Task 1: "Use ai-ml-architect to design a GraphRAG system for medical literature"
Task 2: "Use neo4j-schema-architect to create the knowledge graph schema"
Task 3: "Use neo4j-chunking-strategist to optimize document chunking"

Success Criteria:
- Complete system architecture diagram
- Tested Neo4j schema with sample data
- Chunking strategy with benchmarks
```

**Teaching Notes:**
- Show how agents use DuckDuckGo to research latest techniques
- Demonstrate Sequential Thinking for architectural decisions
- Explain the value of testing schemas with real Cypher queries

---

**Session 5: Backend & Verification (2 hours)**

**Focus Agents:**
- backend-infrastructure-expert
- honest-broker
- autonomous-qa-engineer

**Topics:**
- API design and security
- Database optimization
- Production readiness verification
- Automated testing

**Hands-On Exercise:**
```
Scenario: RESTful API for user authentication

Task 1: "Use backend-infrastructure-expert to implement JWT authentication"
Task 2: "Use autonomous-qa-engineer to create comprehensive tests"
Task 3: "Use honest-broker to verify production readiness"

Success Criteria:
- Secure authentication endpoint
- Test coverage >80%
- Honest-broker gives >90% production readiness score
```

**Teaching Notes:**
- Emphasize security best practices
- Show how GitHub MCP verifies actual CI/CD results
- Demonstrate the value of skeptical verification

---

### Week 3: MCP Tools (4 hours)

**Session 6: MCP Tool Setup (2 hours)**

**Topics:**
- What is Model Context Protocol?
- MCP servers vs Task agents
- Installing and configuring MCP tools
- Troubleshooting MCP connections

**Hands-On:**
```bash
# Install Neo4j with Docker
docker run -d --name neo4j \
  -p 7474:7474 -p 7687:7687 \
  -e NEO4J_AUTH=neo4j/password \
  neo4j:latest

# Install Neo4j MCP
claude mcp add --transport stdio neo4j \
  --env NEO4J_URI=bolt://localhost:7687 \
  --env NEO4J_USERNAME=neo4j \
  --env NEO4J_PASSWORD=password \
  -- npx -y @johnymontana/neo4j-mcp

# Verify connection
claude mcp list
# Should show: ✓ Connected

# Test with agent
"Use neo4j-schema-architect to create a test schema"
```

**Common Issues & Solutions:**

| Issue | Cause | Solution |
|-------|-------|----------|
| Connection failed | Neo4j not running | `docker ps \| grep neo4j` |
| Wrong password | Incorrect credentials | Check .claude.json config |
| Port conflict | 7687 in use | Stop conflicting service |
| Node.js too old | Version <18 | Update Node.js |

**Assignment:**
- Install all 4 MCP tools (Neo4j, GitHub, DuckDuckGo, Sequential Thinking)
- Verify each connection
- Document any issues encountered

---

**Session 7: Advanced MCP Usage (2 hours)**

**Topics:**
- Neo4j MCP for graph operations
- GitHub MCP for verification
- DuckDuckGo for research
- Sequential Thinking for complex decisions

**Hands-On Exercise:**
```
Multi-Agent Workflow with MCP:

1. "Use chief-software-architect to design a microservices architecture"
   - Agent uses Sequential Thinking for trade-off analysis
   - Agent uses DuckDuckGo to research patterns

2. "Use database-architect-neo4j to design service communication graph"
   - Agent uses Neo4j MCP to test schema

3. "Use backend-infrastructure-expert to implement API gateway"
   - Agent uses GitHub MCP to check existing implementations

4. "Use honest-broker to verify the implementation"
   - Agent uses GitHub MCP to verify CI/CD runs
```

**Teaching Notes:**
- Show MCP logs to demonstrate tool usage
- Compare agent results with and without MCP tools
- Explain when to use which MCP tool

---

### Week 4: Advanced Workflows (6 hours)

**Session 8: Agent Chaining (2 hours)**

**Topics:**
- Sequential agent workflows
- Parallel agent execution
- Passing context between agents
- Error handling in agent chains

**Complex Exercise:**
```
Project: Production-Ready RAG System

Workflow:
1. chief-software-architect → System design
2. database-architect-neo4j → Schema design
3. neo4j-chunking-strategist → Chunking strategy
4. ai-ml-architect → Implementation
5. backend-infrastructure-expert → API layer
6. autonomous-qa-engineer → Testing
7. honest-broker → Verification

Time Budget: 90 minutes for full workflow
```

**Evaluation Criteria:**
- [ ] Complete system architecture document
- [ ] Tested Neo4j schema
- [ ] Documented chunking strategy
- [ ] Working RAG implementation
- [ ] API endpoints with authentication
- [ ] Test coverage >80%
- [ ] Production readiness >85%

---

**Session 9: Real-World Project (2 hours)**

**Scenario: E-commerce Platform Modernization**

**Business Requirements:**
- Migrate monolith to microservices
- Add AI-powered product recommendations
- Implement GraphRAG for customer support
- Ensure GDPR compliance
- Handle 100K requests/day

**Student Task:**
Create a complete implementation plan using appropriate agents.

**Expected Agent Usage:**
1. `chief-software-architect` - Migration strategy
2. `backend-infrastructure-expert` - Microservices implementation
3. `ai-ml-architect` - Recommendation engine design
4. `database-architect-neo4j` - Customer support knowledge graph
5. `compliance-enforcer` - GDPR validation
6. `honest-broker` - Production readiness assessment

**Deliverables:**
- Architecture diagram
- Technology stack with justifications
- Implementation timeline
- Risk assessment
- Production deployment plan

---

**Session 10: Custom Agent Development (2 hours)**

**Topics:**
- Agent markdown format
- Writing effective agent descriptions
- Defining agent scope and capabilities
- MCP tool integration in custom agents
- Testing custom agents

**Hands-On:**
Create a custom agent for team-specific needs.

**Example: Database Migration Agent**

```markdown
---
name: database-migration-expert
description: Use this agent for planning and executing database migrations
model: sonnet
color: purple
---

You are a database migration expert specializing in zero-downtime migrations...

## MCP Tool Integration

**PostgreSQL MCP** - Use for:
- Schema analysis
- Migration testing
- Rollback planning

Your core responsibilities:
1. Analyze current schema
2. Plan migration steps
3. Generate migration scripts
4. Test in staging
5. Provide rollback procedures
```

**Assignment:**
- Create a custom agent for your domain (e.g., kubernetes-expert, terraform-architect)
- Test with real project
- Share with class for peer review

---

## 📊 Assessment Strategy

### Week 1-2: Basic Competency
**Quiz (20 points):**
- Agent types and when to use them
- MCP tool requirements
- Installation procedures

**Practical (30 points):**
- Install agents and MCP tools
- Successfully invoke 5 different agents
- Document results

### Week 3: MCP Mastery
**Hands-On Evaluation (50 points):**
- Install all 4 MCP tools
- Demonstrate each tool with appropriate agent
- Troubleshoot a broken MCP connection

### Week 4: Final Project
**Comprehensive Project (100 points):**

**Requirements:**
1. Real-world scenario (provided or student-selected)
2. Use minimum 5 different agents
3. Demonstrate MCP tool usage
4. Agent chaining workflow
5. Production-ready deliverable
6. Documentation of process

**Grading Rubric:**
- Appropriate agent selection (20%)
- Effective MCP tool usage (20%)
- Workflow organization (20%)
- Code quality and completeness (20%)
- Documentation and presentation (20%)

---

## 🎯 Teaching Best Practices

### 1. Start Simple, Build Complexity

**Week 1:** Single agent, simple tasks
```
"Use complexity-reducer on this file"
```

**Week 2:** Multiple agents, sequential
```
"Use complexity-reducer, then honest-broker to verify"
```

**Week 3:** Agent chains with MCP tools
```
"Use ai-ml-architect (researches with DuckDuckGo) →
 neo4j-schema-architect (tests with Neo4j MCP) →
 honest-broker (verifies with GitHub MCP)"
```

### 2. Show Real Failures

Students learn more from seeing agents fail and recover:

**Example: MCP Connection Failure**
```
Student: "Use neo4j-schema-architect to design a schema"
Agent: "Error: Neo4j MCP connection failed"

Teaching Moment:
1. Show `claude mcp list` - identify failed connection
2. Check `docker ps | grep neo4j` - verify Neo4j is running
3. Review ~/.claude.json - verify credentials
4. Reinstall MCP server
5. Retry original task successfully
```

### 3. Emphasize Verification

**Always use honest-broker after major work:**
```
✗ Wrong: Accept agent's claim of completion
✓ Right: "Use honest-broker to verify this is production-ready"
```

### 4. Encourage Experimentation

**Weekly Challenge:**
"Find a new use case for an agent that isn't in the documentation"

**Student Examples:**
- Using `complexity-reducer` for dependency visualization
- Using `ai-ml-architect` for code review
- Using `neo4j-schema-architect` for data modeling

### 5. Pair Programming with AI

**Exercise Format:**
- Student works on task
- Student invokes agent for specific subtasks
- Student integrates agent output
- Student learns when to use agents vs. manual work

---

## 🔧 Common Student Challenges

### Challenge 1: Over-Reliance on Agents

**Symptom:** Student asks agent to "do everything"

**Solution:**
Teach the "Driver-Navigator" model:
- Student is the **driver** (makes decisions, owns code)
- Agent is the **navigator** (provides expertise, catches errors)

**Good Pattern:**
```
Student: Designs system architecture manually
Student: "Use ai-ml-architect to review my architecture and suggest improvements"
Student: Evaluates suggestions and makes informed decisions
```

### Challenge 2: Wrong Agent Selection

**Symptom:** Using `frontend-expert` for database design

**Solution:**
Provide decision tree:
```
Task: Design database schema
↓
Is it Neo4j? → YES → Use neo4j-schema-architect
             → NO  → Use backend-infrastructure-expert
```

### Challenge 3: Ignoring MCP Requirements

**Symptom:** Agent fails because MCP tool isn't installed

**Solution:**
Create "Pre-Flight Checklist":
```
Before using complexity-reducer:
□ Neo4j Docker container running
□ Neo4j MCP installed and connected (claude mcp list)
□ Can execute Cypher queries in Neo4j Browser
```

### Challenge 4: Not Verifying Results

**Symptom:** Accepting agent output without testing

**Solution:**
**Mandatory verification workflow:**
```
1. Agent completes task
2. Student reviews output
3. Student uses honest-broker for verification
4. Student runs tests manually
5. Only then accept as complete
```

---

## 📖 Recommended Reading & Resources

### For Students
- Claude Code Documentation: https://docs.claude.com/en/docs/claude-code
- MCP Protocol Specification: https://modelcontextprotocol.io/
- Neo4j Graph Academy: https://neo4j.com/graphacademy/
- RAG Systems Guide: [Link to relevant resources]

### For Instructors
- Agent Development Guide: docs/CONTRIBUTING.md
- MCP Server Development: https://modelcontextprotocol.io/docs/tools/index
- Teaching AI Literacy: [Relevant pedagogy resources]

---

## 🎬 Example Lesson Plan (90 minutes)

**Topic: Introduction to Code Quality Agents**

**Objectives:**
- Understand code complexity metrics
- Use complexity-reducer agent
- Verify results with honest-broker

**Lesson Flow:**

**0:00-0:15 - Introduction (15 min)**
- What is cyclomatic complexity?
- Why does code quality matter?
- How agents help maintain quality

**0:15-0:30 - Demonstration (15 min)**
- Instructor shows complexity-reducer on sample project
- Explain Neo4j dependency tracking
- Show before/after databases

**0:30-0:60 - Hands-On Practice (30 min)**
Students work individually:
```
Task: Analyze provided Python project
1. Use complexity-reducer to analyze
2. Review refactoring recommendations
3. Use honest-broker to verify
4. Document findings
```

**0:60-0:75 - Group Discussion (15 min)**
- What patterns did you notice in complex code?
- How did the agent structure refactoring?
- What did honest-broker catch?

**0:75-0:90 - Wrap-Up & Assignment (15 min)**
- Review key concepts
- Assign homework: Use complexity-reducer on personal project
- Preview next session: AI/ML Architects

---

## 🏆 Success Metrics

### Student Success Indicators
- [ ] Can install agents and MCP tools independently
- [ ] Selects appropriate agents for tasks
- [ ] Understands when to use MCP tools
- [ ] Chains agents effectively for complex workflows
- [ ] Verifies agent outputs critically
- [ ] Can create custom agents for specific needs

### Instructor Success Indicators
- [ ] 80%+ students complete all installations successfully
- [ ] Students demonstrate agent usage in final projects
- [ ] Class produces reusable custom agents
- [ ] Students report increased productivity with Claude Code

---

## 💬 Discussion Questions

**Week 1:**
- How do AI agents differ from traditional code generators?
- When should you use an agent vs. doing the task manually?

**Week 2:**
- What are the risks of over-relying on agents?
- How do you verify an agent's output is correct?

**Week 3:**
- How do MCP tools extend agent capabilities?
- What are the security implications of MCP tools?

**Week 4:**
- How would you explain agent workflows to non-technical stakeholders?
- What ethical considerations exist when using AI for code generation?

---

## 📝 Additional Resources

### Sample Projects
- `examples/complexity-reducer-demo/` - Code refactoring example
- `examples/graphrag-system/` - Complete RAG implementation
- `examples/microservices-migration/` - Architecture transformation

### Student Handouts
- Agent Quick Reference Card (1-page PDF)
- MCP Troubleshooting Guide
- Agent Selection Flowchart
- Common Error Messages & Solutions

### Video Tutorials
- Agent Installation Walkthrough (10 min)
- MCP Tools Setup (15 min)
- Building Your First Agent Chain (20 min)
- Custom Agent Development (25 min)

---

## 🔄 Course Iteration & Feedback

### Student Feedback Form

**After Each Session:**
1. What agent did you find most useful?
2. What challenges did you encounter?
3. What would you like to learn more about?
4. Rate the session (1-5): Content | Pace | Hands-On

**End of Course:**
1. Which agents do you plan to use in your work?
2. What additional agents would you like to see?
3. How has Claude Code changed your development workflow?
4. What improvements would you suggest for this course?

### Instructor Notes Section

Keep track of:
- Difficult concepts that need more explanation
- Agents students struggle with most
- Common MCP installation issues
- Successful student projects for future examples

---

**Next Steps:**
- Review [AGENT_CATALOG.md](AGENT_CATALOG.md) for detailed agent descriptions
- Set up your teaching environment using [MCP_SETUP.md](MCP_SETUP.md)
- Explore [examples/](../examples/) for hands-on scenarios
- Join instructor community: [Link to community forum]

# Claude Code Professional Agent Collection

A curated collection of specialized Claude Code agents for AI/ML development, database architecture, code quality, and enterprise software engineering.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude-Code-blue.svg)](https://claude.ai/code)

## 🎯 Overview

This repository contains **14 professional-grade agents** designed to enhance Claude Code's capabilities across multiple domains:

- **AI/ML Architecture** - Design GraphRAG systems, optimize embeddings, plan ML pipelines
- **Database Architecture** - Neo4j schema design, vector-graph hybrid systems, query optimization
- **Code Quality** - Complexity reduction, dependency tracking, refactoring automation
- **Backend Infrastructure** - API design, security audits, performance optimization
- **System Architecture** - High-level design, technology selection, integration planning

## 📦 Quick Start

### Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/claude-code-agents.git
cd claude-code-agents

# Run the installer
./install.sh

# Restart Claude Code
```

### Manual Installation

```bash
# Copy agents to Claude Code directory
cp claude-code-agents/agents/*.md ~/.claude/agents/

# Restart Claude Code
```

## 🤖 Available Agents

### 🔴 High Priority (Recommended for Everyone)

| Agent | Description | MCP Requirements |
|-------|-------------|------------------|
| **complexity-reducer** | Analyzes and reduces code complexity with Neo4j dependency tracking | Neo4j |
| **ai-ml-architect** | Designs AI/ML systems, RAG pipelines, knowledge graphs | Neo4j, DuckDuckGo, Sequential Thinking |
| **honest-broker** | Verifies completion claims and production readiness | GitHub |
| **backend-infrastructure-expert** | Server-side development, database optimization, security | GitHub, Neo4j |

### 🟡 Specialized Agents

| Agent | Description | MCP Requirements |
|-------|-------------|------------------|
| **database-architect-neo4j** | Neo4j schemas for vector-graph hybrid systems | Neo4j |
| **neo4j-schema-architect** | Creates and optimizes Neo4j graph database schemas | Neo4j |
| **neo4j-chunking-strategist** | Optimal chunking strategies for RAG systems | Neo4j, DuckDuckGo |
| **chief-software-architect** | High-level system design and architectural decisions | Sequential Thinking, DuckDuckGo |
| **autonomous-qa-engineer** | Automated testing and quality assurance | - |
| **compliance-enforcer** | Validates code against project rules | - |
| **frontend-expert** | Frontend development and optimization | DuckDuckGo |
| **gui-designer** | UI/UX design and accessibility | DuckDuckGo |
| **medical-imaging-expert** | Medical imaging and DICOM processing | - |
| **task-completion-monitor** | Ensures multi-step tasks complete fully | - |

## 🔧 MCP Tools Setup

Many agents require Model Context Protocol (MCP) tools. See [docs/MCP_SETUP.md](docs/MCP_SETUP.md) for detailed installation instructions.

### Quick MCP Install

```bash
# Neo4j (required for database/AI agents)
claude mcp add --transport stdio neo4j \
  --env NEO4J_URI=bolt://localhost:7687 \
  --env NEO4J_USERNAME=neo4j \
  --env NEO4J_PASSWORD=your_password \
  -- npx -y @johnymontana/neo4j-mcp

# GitHub (required for verification agents)
claude mcp add --transport stdio github \
  --env GITHUB_PERSONAL_ACCESS_TOKEN=your_token \
  -- npx -y @modelcontextprotocol/server-github

# DuckDuckGo Search (for research capabilities)
claude mcp add --transport stdio duckduckgo \
  -- npx -y duckduckgo-mcp-server

# Sequential Thinking (for complex decisions)
claude mcp add --transport stdio sequential-thinking \
  -- npx -y @modelcontextprotocol/server-sequential-thinking
```

## 📚 Documentation

- **[Agent Catalog](docs/AGENT_CATALOG.md)** - Detailed description of each agent
- **[MCP Setup Guide](docs/MCP_SETUP.md)** - Installing and configuring MCP tools
- **[Usage Guide](docs/USAGE.md)** - How to use agents effectively
- **[Teaching Guide](docs/TEACHING_GUIDE.md)** - Guide for instructors teaching Claude Code
- **[Example Conversations](examples/)** - Real-world usage examples

## 🎓 For Students and Learners

New to Claude Code agents? Start here:

1. Read the [Usage Guide](docs/USAGE.md) for basic concepts
2. Install agents using the [Quick Start](#quick-start) instructions
3. Try the [Example Conversations](examples/) to see agents in action
4. Join discussions in [GitHub Issues](../../issues)

## 🤝 Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](docs/CONTRIBUTING.md) before submitting agents.

### Agent Quality Standards

All agents must:
- Include clear descriptions with usage examples
- Document MCP tool requirements
- Follow the established agent template
- Be tested with real-world scenarios

## 📄 License

MIT License - See [LICENSE](LICENSE) for details.

## 🙏 Acknowledgments

Built for the Claude Code community. Special thanks to:
- Anthropic for Claude Code
- Contributors of MCP servers
- The open-source community

## 📞 Support

- **Issues**: [GitHub Issues](../../issues)
- **Discussions**: [GitHub Discussions](../../discussions)
- **Documentation**: [docs/](docs/)

---

**Made with ❤️ for the Claude Code community**

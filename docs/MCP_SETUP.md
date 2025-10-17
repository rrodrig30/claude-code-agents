# MCP Tools Setup Guide

Model Context Protocol (MCP) tools extend Claude Code's capabilities with direct access to databases, version control systems, web search, and structured thinking.

## Prerequisites

- **Claude Code** installed and working
- **Node.js and npm** (v18 or later) - [Install Node.js](https://nodejs.org/)
- **Neo4j Database** (for database-related agents) - [Install Neo4j](https://neo4j.com/download/)
- **GitHub Account** (for GitHub MCP) - [Create account](https://github.com/join)

---

## Quick Install (All Tools)

Run these commands to install all MCP tools at once:

```bash
# 1. Neo4j MCP (replace with your actual credentials)
claude mcp add --transport stdio neo4j \
  --env NEO4J_URI=bolt://localhost:7687 \
  --env NEO4J_USERNAME=neo4j \
  --env NEO4J_PASSWORD=your_password_here \
  -- npx -y @johnymontana/neo4j-mcp

# 2. GitHub MCP (replace with your GitHub token)
claude mcp add --transport stdio github \
  --env GITHUB_PERSONAL_ACCESS_TOKEN=ghp_your_token_here \
  -- npx -y @modelcontextprotocol/server-github

# 3. DuckDuckGo Search (no credentials needed)
claude mcp add --transport stdio duckduckgo \
  -- npx -y duckduckgo-mcp-server

# 4. Sequential Thinking (no credentials needed)
claude mcp add --transport stdio sequential-thinking \
  -- npx -y @modelcontextprotocol/server-sequential-thinking
```

**Verify Installation**:
```bash
claude mcp list
```

You should see all tools with ✓ Connected status.

---

## Detailed Setup Instructions

### 1. Neo4j MCP

**Required For**: complexity-reducer, ai-ml-architect, database-architect-neo4j, neo4j-schema-architect, neo4j-chunking-strategist, backend-infrastructure-expert

**Prerequisites**:
- Neo4j database running (Docker, Neo4j Desktop, or AuraDB)
- Neo4j credentials (URI, username, password)

**Setup Neo4j (Docker)**:
```bash
# Start Neo4j with Docker
docker run -d \
  --name neo4j \
  -p 7474:7474 \
  -p 7687:7687 \
  -e NEO4J_AUTH=neo4j/your_password \
  neo4j:latest

# Verify Neo4j is running
docker logs neo4j
```

**Install Neo4j MCP**:
```bash
claude mcp add --transport stdio neo4j \
  --env NEO4J_URI=bolt://localhost:7687 \
  --env NEO4J_USERNAME=neo4j \
  --env NEO4J_PASSWORD=your_password \
  -- npx -y @johnymontana/neo4j-mcp
```

**Test**:
```bash
claude mcp get neo4j
# Should show: Status: ✓ Connected
```

---

### 2. GitHub MCP

**Required For**: backend-infrastructure-expert, honest-broker

**Prerequisites**:
- GitHub account
- GitHub Personal Access Token

**Create GitHub Token**:
1. Go to https://github.com/settings/tokens
2. Click "Generate new token" → "Generate new token (classic)"
3. Select scopes:
   - `repo` (full repository access)
   - `workflow` (for CI/CD access)
   - `read:org` (if working with organizations)
4. Click "Generate token"
5. Copy the token (starts with `ghp_`)

**Install GitHub MCP**:
```bash
claude mcp add --transport stdio github \
  --env GITHUB_PERSONAL_ACCESS_TOKEN=ghp_your_token_here \
  -- npx -y @modelcontextprotocol/server-github
```

**Test**:
```bash
claude mcp get github
# Should show: Status: ✓ Connected
```

---

### 3. DuckDuckGo Search

**Required For**: ai-ml-architect, neo4j-chunking-strategist, chief-software-architect

**Prerequisites**: None! No API keys needed.

**Install**:
```bash
claude mcp add --transport stdio duckduckgo \
  -- npx -y duckduckgo-mcp-server
```

**Test**:
```bash
claude mcp get duckduckgo
# Should show: Status: ✓ Connected
```

---

### 4. Sequential Thinking

**Required For**: ai-ml-architect, chief-software-architect

**Prerequisites**: None!

**Install**:
```bash
claude mcp add --transport stdio sequential-thinking \
  -- npx -y @modelcontextprotocol/server-sequential-thinking
```

**Test**:
```bash
claude mcp get sequential-thinking
# Should show: ✓ Connected
```

---

## Agent-Specific Requirements

| Agent | Neo4j | GitHub | DuckDuckGo | Sequential Thinking |
|-------|-------|--------|------------|---------------------|
| complexity-reducer | ✓ | | | |
| ai-ml-architect | ✓ | | ✓ | ✓ |
| database-architect-neo4j | ✓ | | | |
| neo4j-schema-architect | ✓ | | | |
| neo4j-chunking-strategist | ✓ | | ✓ | |
| backend-infrastructure-expert | ✓ | ✓ | | |
| honest-broker | | ✓ | | |
| chief-software-architect | | | ✓ | ✓ |
| autonomous-qa-engineer | | | | |
| compliance-enforcer | | | | |
| frontend-expert | | | (optional) | |
| gui-designer | | | (optional) | |
| medical-imaging-expert | | | | |
| task-completion-monitor | | | | |

---

## Troubleshooting

### MCP Server Failed to Connect

**Problem**: `claude mcp list` shows "✗ Failed to connect"

**Solutions**:

1. **Check Node.js version**:
   ```bash
   node --version  # Should be v18 or later
   ```

2. **Check credentials**:
   ```bash
   # For Neo4j
   docker logs neo4j  # Verify Neo4j is running

   # For GitHub
   curl -H "Authorization: token ghp_your_token" https://api.github.com/user
   # Should return your GitHub user info
   ```

3. **Reinstall MCP server**:
   ```bash
   claude mcp remove <server-name> -s local
   # Then reinstall using the commands above
   ```

4. **Check logs**:
   ```bash
   # MCP logs are in Claude Code output
   # Look for error messages when starting Claude Code
   ```

---

### Neo4j Connection Issues

**Problem**: Neo4j MCP shows "Failed to connect"

**Check Neo4j is running**:
```bash
# Docker
docker ps | grep neo4j

# Test connection manually
nc -zv localhost 7687
# Should show: Connection succeeded
```

**Verify credentials**:
```bash
# Try connecting with cypher-shell
docker exec -it neo4j cypher-shell -u neo4j -p your_password
```

---

### GitHub Token Issues

**Problem**: GitHub MCP fails to connect

**Verify token**:
```bash
curl -H "Authorization: token ghp_your_token" \
  https://api.github.com/user
```

**Token expired**:
- GitHub tokens don't expire unless you set an expiration
- Create a new token if needed: https://github.com/settings/tokens

---

### Permission Issues

**Problem**: "Permission denied" when installing MCP tools

**Solution**:
```bash
# Fix npm permissions
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH

# Add to ~/.bashrc or ~/.zshrc
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
```

---

## Updating MCP Tools

Keep your MCP tools up to date:

```bash
# List current versions
claude mcp list

# Update a specific tool (remove and reinstall)
claude mcp remove neo4j -s local
claude mcp add --transport stdio neo4j \
  --env NEO4J_URI=bolt://localhost:7687 \
  --env NEO4J_USERNAME=neo4j \
  --env NEO4J_PASSWORD=your_password \
  -- npx -y @johnymontana/neo4j-mcp
```

---

## Security Best Practices

1. **Never commit credentials** to version control
2. **Use environment variables** for sensitive data
3. **Rotate tokens regularly** (especially GitHub tokens)
4. **Use local scope** for MCP configs (not project scope)
5. **Review MCP server permissions** before installing

---

## Advanced Configuration

### Using Environment Variables

Instead of hardcoding credentials:

```bash
# Set environment variables
export NEO4J_PASSWORD="your_password"
export GITHUB_TOKEN="ghp_your_token"

# Install MCP tools using env vars
claude mcp add --transport stdio neo4j \
  --env NEO4J_URI=bolt://localhost:7687 \
  --env NEO4J_USERNAME=neo4j \
  --env NEO4J_PASSWORD="${NEO4J_PASSWORD}" \
  -- npx -y @johnymontana/neo4j-mcp
```

### Project-Specific MCP Configuration

For project-specific MCP tools, use `.mcp.json`:

```json
{
  "mcpServers": {
    "neo4j": {
      "command": "npx",
      "args": ["-y", "@johnymontana/neo4j-mcp"],
      "env": {
        "NEO4J_URI": "bolt://localhost:7687",
        "NEO4J_USERNAME": "neo4j",
        "NEO4J_PASSWORD": "${NEO4J_PASSWORD}"
      }
    }
  }
}
```

Place this file in your project root and commit to version control (with environment variable placeholders).

---

## Getting Help

- **MCP Documentation**: https://docs.claude.com/en/docs/claude-code/mcp
- **Neo4j MCP Issues**: https://github.com/neo4j-contrib/mcp-neo4j/issues
- **GitHub MCP Issues**: https://github.com/modelcontextprotocol/servers/issues
- **This Repository Issues**: [Create an issue](../../issues)

---

**Next Steps**: See [USAGE.md](USAGE.md) for how to use agents with MCP tools.

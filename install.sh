#!/bin/bash

# Claude Code Professional Agent Collection Installer
# Installs agents and optionally sets up MCP tools

set -e  # Exit on error

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored output
print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_header() {
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
}

# Check if Claude Code is installed
check_claude_code() {
    print_info "Checking for Claude Code installation..."

    if command -v claude &> /dev/null; then
        print_success "Claude Code is installed"
        return 0
    else
        print_error "Claude Code is not installed or not in PATH"
        print_info "Please install Claude Code first: https://docs.claude.com/en/docs/claude-code"
        exit 1
    fi
}

# Create agents directory if it doesn't exist
setup_agent_directory() {
    print_info "Setting up agent directory..."

    AGENT_DIR="$HOME/.claude/agents"

    if [ ! -d "$AGENT_DIR" ]; then
        mkdir -p "$AGENT_DIR"
        print_success "Created $AGENT_DIR"
    else
        print_success "Agent directory exists: $AGENT_DIR"
    fi
}

# Install agents
install_agents() {
    print_info "Installing agents..."

    AGENT_DIR="$HOME/.claude/agents"
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    AGENTS_SOURCE="$SCRIPT_DIR/agents"

    if [ ! -d "$AGENTS_SOURCE" ]; then
        print_error "Agents directory not found: $AGENTS_SOURCE"
        exit 1
    fi

    # Count agents
    AGENT_COUNT=$(ls -1 "$AGENTS_SOURCE"/*.md 2>/dev/null | wc -l)

    if [ "$AGENT_COUNT" -eq 0 ]; then
        print_error "No agent files found in $AGENTS_SOURCE"
        exit 1
    fi

    print_info "Found $AGENT_COUNT agents to install"

    # Ask for confirmation unless --yes flag is used
    if [ "$AUTO_YES" != "true" ]; then
        echo ""
        read -p "Install all agents to $AGENT_DIR? (y/n) " -n 1 -r
        echo ""
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_warning "Installation cancelled"
            exit 0
        fi
    fi

    # Copy agents
    INSTALLED=0
    SKIPPED=0

    for agent_file in "$AGENTS_SOURCE"/*.md; do
        agent_name=$(basename "$agent_file")
        destination="$AGENT_DIR/$agent_name"

        if [ -f "$destination" ]; then
            if [ "$FORCE_INSTALL" = "true" ]; then
                cp "$agent_file" "$destination"
                print_success "Updated: $agent_name"
                ((INSTALLED++))
            else
                print_warning "Skipped (already exists): $agent_name"
                ((SKIPPED++))
            fi
        else
            cp "$agent_file" "$destination"
            print_success "Installed: $agent_name"
            ((INSTALLED++))
        fi
    done

    echo ""
    print_success "Installation complete: $INSTALLED installed, $SKIPPED skipped"

    if [ "$SKIPPED" -gt 0 ]; then
        print_info "Use --force to overwrite existing agents"
    fi
}

# Check Node.js installation
check_nodejs() {
    print_info "Checking for Node.js..."

    if command -v node &> /dev/null; then
        NODE_VERSION=$(node --version)
        print_success "Node.js is installed: $NODE_VERSION"

        # Check version (need v18+)
        MAJOR_VERSION=$(echo $NODE_VERSION | cut -d'.' -f1 | tr -d 'v')
        if [ "$MAJOR_VERSION" -lt 18 ]; then
            print_warning "Node.js v18 or later is recommended (current: $NODE_VERSION)"
        fi
        return 0
    else
        print_warning "Node.js is not installed"
        print_info "Node.js is required for MCP tools. Install from: https://nodejs.org/"
        return 1
    fi
}

# MCP Tools Installation Menu
install_mcp_tools() {
    print_header "MCP Tools Setup (Optional)"

    if ! check_nodejs; then
        print_warning "Skipping MCP tools installation"
        return
    fi

    echo "Many agents require MCP (Model Context Protocol) tools to function."
    echo ""
    echo "Available MCP tools:"
    echo "  1. Neo4j          - Required for: complexity-reducer, ai-ml-architect, database architects"
    echo "  2. GitHub         - Required for: honest-broker, backend-infrastructure-expert"
    echo "  3. DuckDuckGo     - Required for: ai-ml-architect, neo4j-chunking-strategist, chief-software-architect"
    echo "  4. Sequential Thinking - Required for: ai-ml-architect, chief-software-architect"
    echo "  5. All of the above"
    echo "  6. Skip MCP setup"
    echo ""

    if [ "$AUTO_YES" = "true" ]; then
        print_info "Auto-mode: Skipping MCP setup"
        return
    fi

    read -p "Choose an option (1-6): " -n 1 -r
    echo ""

    case $REPLY in
        1) install_neo4j_mcp ;;
        2) install_github_mcp ;;
        3) install_duckduckgo_mcp ;;
        4) install_sequential_thinking_mcp ;;
        5)
            install_neo4j_mcp
            install_github_mcp
            install_duckduckgo_mcp
            install_sequential_thinking_mcp
            ;;
        6)
            print_info "Skipping MCP setup"
            ;;
        *)
            print_warning "Invalid option. Skipping MCP setup"
            ;;
    esac
}

# Install Neo4j MCP
install_neo4j_mcp() {
    print_header "Neo4j MCP Setup"

    echo "Neo4j MCP requires a running Neo4j database."
    echo ""

    read -p "Do you have Neo4j running? (y/n) " -n 1 -r
    echo ""

    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Please start Neo4j first. See docs/MCP_SETUP.md for instructions"
        return
    fi

    read -p "Neo4j URI (default: bolt://localhost:7687): " NEO4J_URI
    NEO4J_URI=${NEO4J_URI:-bolt://localhost:7687}

    read -p "Neo4j Username (default: neo4j): " NEO4J_USERNAME
    NEO4J_USERNAME=${NEO4J_USERNAME:-neo4j}

    read -sp "Neo4j Password: " NEO4J_PASSWORD
    echo ""

    if [ -z "$NEO4J_PASSWORD" ]; then
        print_error "Password is required"
        return
    fi

    print_info "Installing Neo4j MCP..."

    claude mcp add --transport stdio neo4j \
        --env NEO4J_URI="$NEO4J_URI" \
        --env NEO4J_USERNAME="$NEO4J_USERNAME" \
        --env NEO4J_PASSWORD="$NEO4J_PASSWORD" \
        -- npx -y @johnymontana/neo4j-mcp

    if [ $? -eq 0 ]; then
        print_success "Neo4j MCP installed"
    else
        print_error "Neo4j MCP installation failed"
    fi
}

# Install GitHub MCP
install_github_mcp() {
    print_header "GitHub MCP Setup"

    echo "GitHub MCP requires a Personal Access Token."
    echo "Create one at: https://github.com/settings/tokens"
    echo "Required scopes: repo, workflow, read:org"
    echo ""

    read -sp "GitHub Personal Access Token (ghp_...): " GITHUB_TOKEN
    echo ""

    if [ -z "$GITHUB_TOKEN" ]; then
        print_error "Token is required"
        return
    fi

    print_info "Installing GitHub MCP..."

    claude mcp add --transport stdio github \
        --env GITHUB_PERSONAL_ACCESS_TOKEN="$GITHUB_TOKEN" \
        -- npx -y @modelcontextprotocol/server-github

    if [ $? -eq 0 ]; then
        print_success "GitHub MCP installed"
    else
        print_error "GitHub MCP installation failed"
    fi
}

# Install DuckDuckGo MCP
install_duckduckgo_mcp() {
    print_header "DuckDuckGo MCP Setup"

    print_info "Installing DuckDuckGo MCP (no credentials required)..."

    claude mcp add --transport stdio duckduckgo \
        -- npx -y duckduckgo-mcp-server

    if [ $? -eq 0 ]; then
        print_success "DuckDuckGo MCP installed"
    else
        print_error "DuckDuckGo MCP installation failed"
    fi
}

# Install Sequential Thinking MCP
install_sequential_thinking_mcp() {
    print_header "Sequential Thinking MCP Setup"

    print_info "Installing Sequential Thinking MCP (no credentials required)..."

    claude mcp add --transport stdio sequential-thinking \
        -- npx -y @modelcontextprotocol/server-sequential-thinking

    if [ $? -eq 0 ]; then
        print_success "Sequential Thinking MCP installed"
    else
        print_error "Sequential Thinking MCP installation failed"
    fi
}

# Show completion message
show_completion() {
    print_header "Installation Complete"

    echo "✨ Claude Code agents have been installed!"
    echo ""
    echo "Next steps:"
    echo "  1. Restart Claude Code to load the new agents"
    echo "  2. Read the documentation:"
    echo "     - docs/USAGE.md - How to use agents"
    echo "     - docs/AGENT_CATALOG.md - Agent descriptions"
    echo "     - docs/MCP_SETUP.md - MCP tools setup"
    echo ""
    echo "Verify installation:"
    echo "  claude mcp list   # Check MCP tools"
    echo ""
    echo "Example usage:"
    echo '  "Use the complexity-reducer agent to analyze my codebase"'
    echo ""
    print_success "Happy coding with Claude Code agents!"
}

# Main installation flow
main() {
    # Parse command line arguments
    FORCE_INSTALL=false
    AUTO_YES=false

    while [[ $# -gt 0 ]]; do
        case $1 in
            --force)
                FORCE_INSTALL=true
                shift
                ;;
            --yes|-y)
                AUTO_YES=true
                shift
                ;;
            --help|-h)
                echo "Claude Code Agent Installer"
                echo ""
                echo "Usage: ./install.sh [OPTIONS]"
                echo ""
                echo "Options:"
                echo "  --force    Overwrite existing agents"
                echo "  --yes, -y  Skip confirmation prompts"
                echo "  --help, -h Show this help message"
                echo ""
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                echo "Use --help for usage information"
                exit 1
                ;;
        esac
    done

    print_header "Claude Code Professional Agent Collection"

    # Check prerequisites
    check_claude_code

    # Install agents
    setup_agent_directory
    install_agents

    # Offer MCP setup
    echo ""
    install_mcp_tools

    # Show completion message
    echo ""
    show_completion
}

# Run main function
main "$@"

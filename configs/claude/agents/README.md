# Claude Subagents Configuration

This directory contains specialized subagent configurations for different types of tasks.

## Available Agents

### `code-reviewer.json`
**Purpose**: Thorough code review and quality assessment

**Specializes in**:
- Security vulnerability detection
- Performance analysis
- Code quality and maintainability
- Testing coverage review
- Documentation completeness
- Coding standards compliance

**Use when**: You need detailed code review, security analysis, or quality assessment of existing code.

### `engineer.json`
**Purpose**: Complex engineering tasks and system implementation

**Specializes in**:
- System architecture and design
- Full-stack development
- Database design and optimization
- API development and integration
- DevOps and infrastructure
- Performance optimization
- Complex debugging and refactoring

**Use when**: Building new features, architecting systems, solving complex technical problems, or implementing large-scale changes.

## Usage Examples

```bash
# Use code reviewer for security audit
claude --agent code-reviewer "Review this authentication module for security issues"

# Use engineer for feature implementation
claude --agent engineer "Implement a user notification system with email and push notifications"

# Use engineer for system design
claude --agent engineer "Design and implement a caching layer for our API"
```

## Configuration Notes

- **Tools**: Each agent has different tool permissions based on their role
- **Timeouts**: Engineer has longer timeouts for complex build/deploy operations
- **Behavior**: Code reviewer focuses on analysis, engineer on implementation
- **Specializations**: Each agent has domain-specific knowledge areas configured

## Customization

Modify the agent configurations to:
- Add/remove tool permissions
- Adjust behavior preferences
- Configure language-specific standards
- Set workflow preferences
- Define quality standards
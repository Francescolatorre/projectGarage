# Claude Custom Commands Catalog

## 📚 Available Commands

### Productivity & Process
| Command | Description | Tags | Origin |
|---------|-------------|------|--------|
| [process-improve](productivity/process-improve.md) | Derive lightweight process improvements from learnings | process, improvement, learning | tiktoksaas |

### Quality Assurance
| Command | Description | Tags | Origin |
|---------|-------------|------|--------|
| *(Coming soon)* | | | |

### Architecture & Design
| Command | Description | Tags | Origin |
|---------|-------------|------|--------|
| *(Coming soon)* | | | |

### AI Integration
| Command | Description | Tags | Origin |
|---------|-------------|------|--------|
| *(Coming soon)* | | | |

### DevOps & Deployment
| Command | Description | Tags | Origin |
|---------|-------------|------|--------|
| *(Coming soon)* | | | |

## 🎯 Quick Selection Guide

### By Problem Type
- **Repeated issues occurring**: Use `process-improve`
- **Code quality problems**: *(Coming: code-quality-audit)*
- **Performance issues**: *(Coming: performance-analyzer)*
- **Security concerns**: *(Coming: security-checker)*

### By Project Phase
- **Project setup**: *(Coming: project-initializer)*
- **Active development**: `process-improve`
- **Pre-release**: *(Coming: release-checklist)*
- **Post-mortem**: *(Coming: retrospective-analyzer)*

## 📝 Command Template

When adding new commands, use this structure:

```markdown
---
description: One-line description of what the command does
allowed-tools: List of allowed Claude tools
origin: project-name
tags: comma, separated, tags
tested: true/false
---

# Command Name

## Purpose
Detailed explanation of what problem this solves

## Use Case
When and why to use this command

## Command
The actual command implementation

## Success Metrics
How to know if it worked

## Prerequisites
What needs to be in place

## Real Usage Example
Actual example from origin project

## Origin Story
Context about why this was created
```

## 🔍 Search Commands

```bash
# Search by tag
grep -l "tag-name" claude-commands/*/*.md

# Search by problem
grep -i "your problem" claude-commands/*/*.md

# List all commands
find claude-commands -name "*.md" -not -name "CATALOG.md"
```

## 📊 Statistics
- **Total Commands**: 1
- **Categories**: 5
- **Origin Projects**: 1
- **Last Updated**: 2025-09-13

---

*Building a library of battle-tested development accelerators*
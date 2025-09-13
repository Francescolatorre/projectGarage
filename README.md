# 🚀 Project Garage

A curated collection of reusable tools, commands, and patterns for accelerating software development across projects.

## 📚 What's Inside

### Claude Custom Commands Library
Reusable Claude Code custom commands for common development tasks, organized by category.

### Project Templates
Battle-tested project structures and configurations.

### Development Patterns
Proven patterns and practices from successful projects.

## 🎯 Quick Start

### Using a Claude Command in Your Project

```bash
# Browse available commands
./garage browse claude-commands

# Search for specific command
./garage search "process improvement"

# Install command to your project
./garage install process-improve ./your-project/.claude-code/commands/

# Or copy manually
cp claude-commands/productivity/process-improve.md /path/to/project/.claude-code/commands/
```

### Contributing a New Command

```bash
# Add your battle-tested command
./garage add-command ./path/to/command.md --category productivity

# Share learnings
./garage add-learning "Your insight here" --tags "cli,automation"
```

## 📂 Structure

```
projectGarage/
├── claude-commands/          # Claude Code custom commands
│   ├── productivity/        # Process improvement, automation
│   ├── quality/            # Testing, validation, security
│   ├── architecture/       # System design, patterns
│   ├── ai-integration/     # LLM, AI service patterns
│   └── devops/             # CI/CD, deployment, monitoring
├── project-templates/       # Starter templates
├── patterns/               # Development patterns
├── learnings/              # Documented insights
└── scripts/                # Management scripts
```

## 🏷️ Command Categories

- **Productivity**: Process automation, diary systems, workflow optimization
- **Quality**: Testing strategies, code review, definition of done
- **Architecture**: System design reviews, ADR management, tech debt tracking
- **AI Integration**: Prompt engineering, cost optimization, fallback strategies
- **DevOps**: CI/CD pipelines, deployment checklists, monitoring setup

## 🔍 Command Metadata

Each command includes:
- **Description**: What it does
- **Use Case**: When to use it
- **Prerequisites**: Required setup
- **Example**: Real usage example
- **Origin**: Which project it came from
- **Success Metrics**: How to measure effectiveness

## 📈 Learning Philosophy

"Every project teaches something. Every learning prevents future pain."

This repository captures hard-won insights from real projects, making each new project start from a higher baseline.

## 🤝 Contributing

1. Test commands in real projects first
2. Document the problem it solves
3. Include success/failure indicators
4. Tag with relevant categories
5. Add origin project for context

## 📊 Stats

- Commands Available: 0 (just started!)
- Projects Using: 1
- Learnings Captured: 0

---

*Building better projects by learning from every project.*
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

### Choose Your Integration Pattern

**New to projectGarage?** → [Read the Integration Guide](INTEGRATION_GUIDE.md)

**Need quick setup?** → [Submodule + Direct Usage](integration-patterns/submodule-direct/README.md)

**Large team project?** → [Submodule + Memory Bank](integration-patterns/submodule-memorybank/README.md)

**Just experimenting?** → [Manual Copy](integration-patterns/manual-copy/README.md)

### Quick Integration (Submodule + Direct)

```bash
# 1. Add garage to your project
git submodule add https://github.com/Francescolatorre/projectGarage.git .garage

# 2. Copy setup script and run
cp .garage/templates/submodule-direct/setup_garage.sh .
./setup_garage.sh

# 3. Start using commands
npm run garage:browse
npm run garage:search -- "process improvement"
```

### Using Commands

```bash
# Use directly from garage (always latest)
claude-code --custom .garage/claude-commands/productivity/process-improve.md

# Import to your project for customization
./scripts/import_pattern.sh process-improve

# Share your learnings back
./scripts/share_learning.sh "your insight" productivity
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
├── integration-patterns/    # Integration approaches for projects
│   ├── submodule-direct/   # Git submodule + direct usage
│   ├── submodule-memorybank/ # Git submodule + local cache
│   └── manual-copy/        # Simple copy approach
├── templates/              # Setup templates for each pattern
├── learnings/              # Documented insights from projects
└── scripts/                # Management and utility scripts
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
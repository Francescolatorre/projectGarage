# Manual Copy Pattern

**Origin**: Learning/experimental projects
**Complexity**: Very Low
**Best for**: One-off projects, learning phase, restricted environments

## Overview

The simplest integration pattern - manually copy individual commands from the garage as needed. No git submodules, no automation, full local control.

## Pros
- ✅ Extremely simple setup
- ✅ No git submodule knowledge required
- ✅ Full offline access once copied
- ✅ Complete local customization freedom
- ✅ No network dependencies
- ✅ Works in any environment

## Cons
- ❌ Manual sync process
- ❌ Easy to miss updates
- ❌ No automatic sharing back to garage
- ❌ Potential duplication across projects
- ❌ No centralized learning capture

## Setup Instructions

### 1. Browse Available Commands
Visit: https://github.com/Francescolatorre/projectGarage/tree/main/claude-commands

### 2. Copy What You Need
```bash
# Create commands directory
mkdir -p .claude/commands

# Copy specific command (example)
curl -o .claude/commands/process-improve.md \
  https://raw.githubusercontent.com/Francescolatorre/projectGarage/main/claude-commands/productivity/process-improve.md
```

### 3. Customize Locally
Edit the copied commands to fit your project needs.

## Daily Workflow

### Finding Commands
1. Browse garage repository on GitHub
2. Read command descriptions in catalog
3. Copy raw content of needed commands

### Using Commands
```bash
# Use copied command
claude-code --custom .claude/commands/process-improve.md

# Edit for project specifics
nano .claude/commands/process-improve.md
```

### Sharing Back (Optional)
If you create valuable improvements:
1. Create issue in garage repository
2. Share your enhanced version
3. Describe the improvements made

## Customization

Since everything is local, you have complete freedom:
- Modify commands for your project structure
- Add project-specific sections
- Remove irrelevant parts
- Combine multiple commands

## Maintenance

### Checking for Updates
Periodically:
1. Visit garage repository
2. Check if commands you use have updates
3. Manually review and merge improvements
4. Update your local copies

### Version Control
Commit your copied commands to your project repository:
```bash
git add .claude/commands/
git commit -m "add: claude commands from projectGarage"
```

## Success Stories

**Learning Projects**: Perfect for trying out new patterns without commitment. Quick setup allows focus on learning rather than infrastructure.

**Restricted Environments**: Works where git submodules or external dependencies aren't allowed.

## When to Choose This Pattern

✅ **Choose this if**:
- Learning or experimental project
- One-off project with short timeline
- Restricted network environment
- Team unfamiliar with git submodules
- Need heavy customization
- Want maximum simplicity

❌ **Avoid this if**:
- Long-term project
- Need frequent updates from garage
- Want to contribute learnings back
- Team wants automated workflows
- Multiple projects sharing patterns

## Upgrade Path

### To Submodule-Direct
1. Add submodule: `git submodule add https://github.com/Francescolatorre/projectGarage.git .garage`
2. Compare your local commands with garage versions
3. Set up automation scripts
4. Start using garage commands directly

### To Submodule-MemoryBank
1. Add submodule
2. Create memory_bank structure
3. Move your customized commands to memory_bank/garage_imports/
4. Set up import/export automation

## Quick Start Commands

```bash
# Browse commands
curl -s https://api.github.com/repos/Francescolatorre/projectGarage/contents/claude-commands | \
  jq -r '.[] | select(.type=="dir") | .name'

# Copy specific command
curl -o .claude/commands/COMMAND_NAME.md \
  https://raw.githubusercontent.com/Francescolatorre/projectGarage/main/claude-commands/CATEGORY/COMMAND_NAME.md

# List available commands in category
curl -s https://api.github.com/repos/Francescolatorre/projectGarage/contents/claude-commands/productivity | \
  jq -r '.[] | select(.name | endswith(".md")) | .name'
```

## Template Files

No templates needed - just copy and customize as required.
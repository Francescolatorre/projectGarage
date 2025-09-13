# Git Submodule + Direct Usage Pattern

**Origin**: TikTok SaaS project
**Complexity**: Low
**Best for**: Small teams, rapid development, simple project structures

## Overview

This pattern uses git submodules for live access to the garage repository with direct command usage and lightweight automation scripts for sharing learnings.

## Pros
- ✅ Minimal setup overhead
- ✅ Always up-to-date with latest patterns
- ✅ Direct access to all garage commands
- ✅ Automatic bidirectional sync
- ✅ Integrates with diary systems

## Cons
- ❌ Requires git submodule knowledge
- ❌ Limited offline access
- ❌ Less project-specific customization
- ❌ Network dependency for updates

## Directory Structure

```
your-project/
├── .garage/                    # Git submodule to projectGarage
├── .claude/commands/           # Local commands (imported from garage)
├── scripts/                    # Automation scripts
│   ├── setup_garage.sh        # Initialize integration
│   ├── share_learning.sh      # Export insights to garage
│   └── sync_insights.sh       # Bidirectional sync
├── garage-link                 # CLI wrapper
├── docs/diary/                 # Project diary (optional)
└── package.json               # NPM scripts for garage commands
```

## Setup Instructions

### 1. Add Submodule
```bash
git submodule add https://github.com/Francescolatorre/projectGarage.git .garage
```

### 2. Copy Template Files
```bash
# Copy from a project that already has this setup (like tiktoksaas)
cp path/to/tiktoksaas/.claude/commands/processImprovement.md .claude/commands/
cp path/to/tiktoksaas/scripts/setup_garage.sh scripts/
cp path/to/tiktoksaas/scripts/share_learning.sh scripts/
cp path/to/tiktoksaas/scripts/sync_insights.sh scripts/
cp path/to/tiktoksaas/garage-link ./
chmod +x scripts/*.sh garage-link
```

### 3. Initialize Setup
```bash
./scripts/setup_garage.sh
```

### 4. Add NPM Scripts (optional)
Add to your `package.json`:
```json
{
  "scripts": {
    "garage": "./garage-link",
    "garage:browse": "./garage-link browse",
    "garage:search": "./garage-link search",
    "garage:sync": "./scripts/sync_insights.sh"
  }
}
```

## Daily Workflow

### Browsing & Using Commands
```bash
# Browse available commands
npm run garage:browse [category]

# Search for specific functionality
npm run garage:search -- "keyword"

# Use command directly from garage
claude-code --custom .garage/claude-commands/productivity/process-improve.md

# Import command to local project
./scripts/import_pattern.sh process-improve
```

### Sharing Learnings
```bash
# Manual sharing
./scripts/share_learning.sh "your insight" category

# Automatic sync (detects #key tags in diary)
./scripts/sync_insights.sh
```

## Integration with Diary Systems

If your project has a diary system (like the one in tiktoksaas):

1. Tag important learnings with `#key`
2. Run `./scripts/sync_insights.sh` periodically
3. System automatically exports tagged learnings to garage

## Customization Points

### Script Customization
- Modify `share_learning.sh` for different learning formats
- Adjust `sync_insights.sh` for project-specific diary structures
- Customize `setup_garage.sh` for project-specific initialization

### Command Usage
```bash
# Use directly from garage (always latest)
claude-code --custom .garage/claude-commands/category/command.md

# Import and customize locally
cp .garage/claude-commands/category/command.md .claude/commands/
# Edit .claude/commands/command.md as needed
```

## Maintenance

### Updating Garage
```bash
# Update submodule
git submodule update --remote .garage

# Commit submodule reference
git add .garage
git commit -m "update: sync garage submodule to latest"
```

### Team Onboarding
```bash
# New team member setup
git submodule update --init --recursive
./scripts/setup_garage.sh
```

## Success Stories

**TikTok SaaS Project**: Reduced process improvement implementation time from hours to minutes by reusing battle-tested patterns. Automatic diary integration captured 15+ key learnings in first sprint.

## When to Choose This Pattern

✅ **Choose this if**:
- Small team (1-5 developers)
- Rapid development cycles
- Good internet connectivity
- Comfortable with git submodules
- Want latest patterns automatically

❌ **Avoid this if**:
- Need extensive offline access
- Heavy project-specific customizations required
- Team unfamiliar with git submodules
- Strict network restrictions
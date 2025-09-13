# Git Submodule + Memory Bank Pattern

**Origin**: Other Claude project
**Complexity**: Medium
**Best for**: Large teams, complex projects, offline-first workflows

## Overview

This pattern combines git submodules with a local memory bank system that caches imported patterns and allows for project-specific adaptations while maintaining connection to the shared garage.

## Pros
- ✅ Full offline access to imported patterns
- ✅ Project-specific adaptations preserved
- ✅ Comprehensive local pattern library
- ✅ Team can work without network dependency
- ✅ Detailed adaptation tracking

## Cons
- ❌ More complex setup and maintenance
- ❌ Higher local storage overhead
- ❌ Manual import/export process
- ❌ Potential sync conflicts with adaptations

## Directory Structure

```
your-project/
├── .garage/                    # Git submodule to projectGarage
├── .claude/commands/           # Process improvement and management commands
│   └── processImprovement.md  # Central reference and automation
├── memory_bank/               # Local pattern cache
│   └── garage_imports/        # Imported patterns with adaptations
├── scripts/                   # Automation scripts
│   ├── share_learning.sh     # Export insights to garage
│   ├── import_pattern.sh     # Import with adaptation template
│   └── sync_insights.sh      # Bidirectional synchronization
└── package.json              # NPM scripts for workflow
```

## Setup Instructions

### 1. Add Submodule
```bash
git submodule add https://github.com/Francescolatorre/projectGarage.git .garage
```

### 2. Create Directory Structure
```bash
mkdir -p .claude/commands memory_bank/garage_imports scripts
```

### 3. Create Process Improvement Command
Create `.claude/commands/processImprovement.md` with comprehensive workflow documentation and command references.

### 4. Build Automation Scripts

**share_learning.sh** - Export insights to garage:
```bash
#!/bin/bash
# Export learning with context and categorization
# Usage: ./scripts/share_learning.sh "learning" "category"
```

**import_pattern.sh** - Import with adaptation template:
```bash
#!/bin/bash
# Import pattern and create adaptation template
# Usage: ./scripts/import_pattern.sh pattern-name
```

**sync_insights.sh** - Two-way synchronization:
```bash
#!/bin/bash
# Sync learnings to garage and check for new patterns
```

### 5. Create Memory Bank Structure
```bash
# Create import directory with README
mkdir -p memory_bank/garage_imports
echo "# Garage Imports

This directory contains patterns imported from projectGarage and adapted for this project.

## Usage
- Import: \`./scripts/import_pattern.sh pattern-name\`
- Adapt: Edit files in this directory as needed
- Sync: \`./scripts/sync_insights.sh\`
" > memory_bank/garage_imports/README.md
```

## Daily Workflow

### Importing Patterns
```bash
# Browse available patterns
./.garage/garage browse [category]

# Import pattern with adaptation template
./scripts/import_pattern.sh process-improve

# Edit adaptation in memory_bank/garage_imports/
# Add project-specific notes and modifications
```

### Using Adapted Patterns
```bash
# Use adapted version
claude-code --custom memory_bank/garage_imports/process-improve.md

# Or use original from garage
claude-code --custom .garage/claude-commands/productivity/process-improve.md
```

### Sharing Learnings
```bash
# Share insight to garage
./scripts/share_learning.sh "your learning" "category"

# Periodic sync
./scripts/sync_insights.sh
```

## Memory Bank Organization

### Import Process
1. Pattern copied from garage to `memory_bank/garage_imports/`
2. Adaptation template added with:
   - Original pattern content
   - Project-specific modification section
   - Usage notes area
   - Related files tracking

### Adaptation Tracking
Each imported pattern includes:
- **Import Date**: When pattern was brought into project
- **Source**: Original garage location
- **Adaptations**: What was changed for this project
- **Usage Notes**: How it's used in this specific context
- **Related Files**: Links to project files using the pattern

## Integration with Claude Commands

Central `.claude/commands/processImprovement.md` provides:
- Comprehensive command reference
- Quick setup commands
- Integration workflow documentation
- Copy-paste templates for new projects

## Offline Capabilities

- Full access to imported patterns without network
- Local adaptation and customization
- Independent development cycles
- Sync when network available

## Team Collaboration

### Onboarding New Members
```bash
git submodule update --init --recursive
./scripts/setup_memory_bank.sh
```

### Sharing Adaptations
- Commit `memory_bank/` changes to project repo
- Team gets project-specific pattern adaptations
- Original garage patterns remain unchanged

## Maintenance

### Updating Patterns
```bash
# Update garage submodule
git submodule update --remote .garage

# Check for pattern updates
./scripts/sync_insights.sh

# Re-import updated patterns if needed
./scripts/import_pattern.sh pattern-name --force-update
```

### Managing Storage
- Regularly review `memory_bank/garage_imports/`
- Remove unused adapted patterns
- Archive old adaptations if needed

## Success Stories

**Complex Enterprise Project**: Maintained 25+ adapted patterns with project-specific modifications while staying connected to shared garage. Team of 8 developers could work offline with full pattern access.

## When to Choose This Pattern

✅ **Choose this if**:
- Large team (5+ developers)
- Complex project with specific needs
- Frequent offline development
- Need extensive pattern customization
- Long-term project with evolving patterns

❌ **Avoid this if**:
- Small team or simple project
- Rapid prototyping phase
- Minimal pattern customization needed
- Prefer always-latest patterns
- Limited local storage

## Migration from Other Patterns

### From Submodule-Direct
1. Create memory_bank structure
2. Import currently used patterns
3. Adapt automation scripts for memory bank
4. Update team workflow documentation

### From Manual-Copy
1. Add submodule connection
2. Move copied patterns to memory_bank
3. Add adaptation templates
4. Set up automation scripts
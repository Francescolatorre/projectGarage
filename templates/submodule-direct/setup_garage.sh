#!/bin/bash

# Setup projectGarage integration for new project (Submodule-Direct pattern)
# Copy this script to your project and run it

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GARAGE_DIR="$PROJECT_ROOT/.garage"

echo "🚀 Setting up projectGarage integration (Submodule-Direct pattern)..."

# Ensure directories exist
mkdir -p .claude/commands scripts

# Initialize submodule if needed
if [ ! -f "$GARAGE_DIR/garage" ]; then
    echo "📥 Initializing garage submodule..."
    git submodule update --init --recursive
fi

# Create garage-link wrapper
cat > garage-link << 'EOF'
#!/bin/bash

# Link to Project Garage submodule
# This script provides easy access to the shared command library

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GARAGE_PATH="$SCRIPT_DIR/.garage"

# Ensure submodule is initialized
if [ ! -f "$GARAGE_PATH/garage" ]; then
    echo "Initializing Project Garage submodule..."
    git submodule update --init --recursive
fi

# Execute garage command
exec "$GARAGE_PATH/garage" "$@"
EOF

chmod +x garage-link

# Import initial process improvement command
if [ -f "$GARAGE_DIR/claude-commands/productivity/process-improve.md" ] && [ ! -f ".claude/commands/process-improve.md" ]; then
    echo "📥 Importing initial process-improve command..."
    cp "$GARAGE_DIR/claude-commands/productivity/process-improve.md" ".claude/commands/"
fi

# Create share_learning.sh
cat > scripts/share_learning.sh << 'EOF'
#!/bin/bash

# Share learning from current project to projectGarage
# Usage: ./scripts/share_learning.sh "learning description" [category]

set -e

LEARNING="$1"
CATEGORY="${2:-productivity}"
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GARAGE_DIR="$PROJECT_ROOT/.garage"

if [ -z "$LEARNING" ]; then
    echo "Usage: $0 \"learning description\" [category]"
    echo "Categories: productivity, quality, architecture, ai-integration, devops"
    exit 1
fi

echo "📤 Sharing learning to projectGarage..."

# Ensure garage is up to date
cd "$GARAGE_DIR"
git pull origin main

# Create learning entry
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
PROJECT_NAME=$(basename "$PROJECT_ROOT")
LEARNING_FILE="learnings/${PROJECT_NAME}_${TIMESTAMP}.md"

cat > "$LEARNING_FILE" << EOFF
# Learning from $PROJECT_NAME

**Date**: $(date +"%Y-%m-%d %H:%M:%S")
**Project**: $PROJECT_NAME
**Category**: $CATEGORY

## Learning
$LEARNING

## Context
Generated during development of $PROJECT_NAME project.

---
*Exported from project learning system*
EOFF

# Commit and push
git add "$LEARNING_FILE"
git commit -m "learning: $CATEGORY insight from $PROJECT_NAME

$LEARNING"

git push origin main

echo "✅ Learning shared: $LEARNING_FILE"
echo "🔄 projectGarage updated with your insight!"
EOF

chmod +x scripts/share_learning.sh

# Create import_pattern.sh
cat > scripts/import_pattern.sh << 'EOF'
#!/bin/bash

# Import specific pattern from projectGarage to current project
# Usage: ./scripts/import_pattern.sh pattern-name

set -e

PATTERN="$1"
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GARAGE_DIR="$PROJECT_ROOT/.garage"

if [ -z "$PATTERN" ]; then
    echo "Usage: $0 pattern-name"
    echo ""
    echo "Available patterns:"
    find "$GARAGE_DIR/claude-commands" -name "*.md" -not -name "CATALOG.md" | while read -r file; do
        basename=$(basename "$file" .md)
        category=$(basename $(dirname "$file"))
        echo "  $basename (from $category)"
    done
    exit 1
fi

echo "📥 Importing pattern '$PATTERN' from projectGarage..."

# Find pattern file
PATTERN_FILE=$(find "$GARAGE_DIR/claude-commands" -name "${PATTERN}.md" -o -name "${PATTERN}" | head -1)

if [ -z "$PATTERN_FILE" ] || [ ! -f "$PATTERN_FILE" ]; then
    echo "❌ Pattern '$PATTERN' not found in projectGarage"
    exit 1
fi

# Copy to .claude/commands
mkdir -p "$PROJECT_ROOT/.claude/commands"
COMMAND_FILE="$PROJECT_ROOT/.claude/commands/$(basename "$PATTERN_FILE")"

cp "$PATTERN_FILE" "$COMMAND_FILE"
echo "✅ Pattern copied to: $COMMAND_FILE"
echo "🎯 Pattern ready for use!"
EOF

chmod +x scripts/import_pattern.sh

# Create sync_insights.sh
cat > scripts/sync_insights.sh << 'EOF'
#!/bin/bash

# Bidirectional sync between project insights and projectGarage
# Usage: ./scripts/sync_insights.sh

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GARAGE_DIR="$PROJECT_ROOT/.garage"

echo "🔄 Syncing insights between project and garage..."

# Update garage
echo "📥 Updating garage from remote..."
cd "$GARAGE_DIR"
git pull origin main

# Update submodule reference
echo "📝 Updating submodule reference..."
cd "$PROJECT_ROOT"
git add .garage
if git diff --staged --quiet; then
    echo "✅ No garage updates to commit"
else
    git commit -m "update: sync garage submodule to latest" || true
fi

echo "✅ Sync complete!"
EOF

chmod +x scripts/sync_insights.sh

# Update package.json if it exists
if [ -f "package.json" ] && ! grep -q "garage:" package.json; then
    echo "📦 Adding garage commands to package.json..."

    # Create temporary script to update package.json
    cat > /tmp/update_package.js << 'EOF'
const fs = require('fs');
const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));

if (!pkg.scripts) pkg.scripts = {};

// Add garage commands
Object.assign(pkg.scripts, {
  "garage": "./garage-link",
  "garage:browse": "./garage-link browse",
  "garage:search": "./garage-link search",
  "garage:sync": "./scripts/sync_insights.sh"
});

fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2) + '\n');
console.log('✅ Updated package.json with garage commands');
EOF

    node /tmp/update_package.js
    rm /tmp/update_package.js
fi

echo "✅ projectGarage integration complete!"
echo ""
echo "Available commands:"
echo "  npm run garage:browse        # Browse commands"
echo "  npm run garage:search        # Search patterns"
echo "  ./scripts/share_learning.sh  # Share insights"
echo "  ./scripts/import_pattern.sh  # Import patterns"
echo "  ./scripts/sync_insights.sh   # Sync all"
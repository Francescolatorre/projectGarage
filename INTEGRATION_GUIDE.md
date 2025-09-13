# ProjectGarage Integration Guide

Choose the integration pattern that best fits your project needs and team structure.

## Quick Decision Tree

### Start Here: What's Your Project Context?

#### 🚀 **Rapid Development / Small Team**
- Team size: 1-5 developers
- Timeline: Weeks to months
- Connectivity: Good internet access
- Experience: Comfortable with git

→ **Use: [Submodule + Direct Usage](integration-patterns/submodule-direct/README.md)**

#### 🏢 **Enterprise / Large Team**
- Team size: 5+ developers
- Timeline: Months to years
- Connectivity: Sometimes offline
- Customization: Heavy project-specific needs

→ **Use: [Submodule + Memory Bank](integration-patterns/submodule-memorybank/README.md)**

#### 🧪 **Learning / Experimental**
- Project type: One-off, experimental
- Timeline: Days to weeks
- Constraints: Restricted environment
- Goal: Try patterns without commitment

→ **Use: [Manual Copy](integration-patterns/manual-copy/README.md)**

## Detailed Comparison

| Aspect | Submodule-Direct | Submodule-MemoryBank | Manual Copy |
|--------|------------------|----------------------|-------------|
| **Setup Time** | 10 minutes | 30 minutes | 2 minutes |
| **Maintenance** | Low | Medium | Very Low |
| **Network Dependency** | Medium | Low | None (after copy) |
| **Offline Access** | Limited | Full | Full |
| **Customization** | Limited | High | Complete |
| **Auto-Sync** | Yes | Semi-auto | No |
| **Team Onboarding** | Simple | Medium | Immediate |
| **Storage Overhead** | Minimal | Medium | Minimal |

## Feature Matrix

| Feature | Submodule-Direct | Submodule-MemoryBank | Manual Copy |
|---------|:----------------:|:--------------------:|:-----------:|
| Live pattern updates | ✅ | ✅ | ❌ |
| Offline pattern access | ⚠️ | ✅ | ✅ |
| Project-specific adaptations | ❌ | ✅ | ✅ |
| Automatic learning export | ✅ | ✅ | ❌ |
| Pattern version tracking | ✅ | ✅ | ❌ |
| Local pattern cache | ❌ | ✅ | ✅ |
| Bidirectional sync | ✅ | ✅ | ❌ |
| Zero network setup | ❌ | ❌ | ✅ |

## Migration Paths

### From Manual Copy → Submodule-Direct
1. Add submodule: `git submodule add https://github.com/Francescolatorre/projectGarage.git .garage`
2. Run setup: `cp .garage/templates/submodule-direct/setup_garage.sh . && ./setup_garage.sh`
3. Compare your local commands with garage versions
4. Start using automation scripts

### From Submodule-Direct → Submodule-MemoryBank
1. Create memory bank: `mkdir -p memory_bank/garage_imports`
2. Copy current .claude/commands to memory_bank with adaptation templates
3. Update scripts to use memory bank pattern
4. Set up import/export workflows

### From Submodule-MemoryBank → Submodule-Direct
1. Review memory_bank adaptations
2. Contribute useful adaptations back to garage
3. Switch to direct garage usage
4. Simplify automation scripts

## Real-World Examples

### TikTok SaaS (Submodule-Direct)
- **Context**: Solo developer, rapid MVP development
- **Result**: 15+ key learnings captured automatically, process improvements implemented in minutes
- **Why it worked**: Simple setup, automatic sync, focus on speed

### Enterprise Project (Submodule-MemoryBank)
- **Context**: 8-person team, complex customizations needed
- **Result**: 25+ adapted patterns, offline development capability
- **Why it worked**: Local adaptations, team coordination, offline access

### Learning Project (Manual Copy)
- **Context**: Experimenting with Claude commands
- **Result**: Quick pattern testing without infrastructure overhead
- **Why it worked**: Zero commitment, immediate access, full customization

## Success Metrics

Track these to know if your integration is working:

### Leading Indicators
- Time to solve similar problems (should decrease)
- Pattern reuse frequency (should increase)
- Learning capture rate (should be > 1 per week)

### Lagging Indicators
- Repeated mistakes across projects (should decrease)
- Team onboarding time (should decrease)
- Cross-project knowledge transfer (should increase)

## Troubleshooting

### Common Issues

#### Submodule not updating
```bash
git submodule update --remote .garage
git add .garage && git commit -m "update garage"
```

#### Missing automation scripts
```bash
cp .garage/templates/[your-pattern]/setup_garage.sh .
./setup_garage.sh
```

#### Sync conflicts
```bash
cd .garage
git status  # Check for conflicts
git pull    # Resolve and retry
```

## Getting Help

1. **Check integration patterns**: Each pattern has detailed troubleshooting
2. **Review examples**: Look at real project implementations
3. **Ask questions**: Create issue in projectGarage repository
4. **Share improvements**: Contribute back successful adaptations

## Contributing New Patterns

Have a better integration approach?

1. Create directory: `integration-patterns/your-pattern-name/`
2. Write comprehensive README with:
   - Setup instructions
   - Pros/cons analysis
   - Real usage examples
   - Troubleshooting guide
3. Add template files in `templates/your-pattern-name/`
4. Update this guide with comparison info
5. Test with real project before submitting

---

**Remember**: The best integration pattern is the one your team actually uses consistently. Start simple and evolve as needs grow.
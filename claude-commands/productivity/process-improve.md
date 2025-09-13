---
description: Automatically derive lightweight process updates from session learnings without over-engineering
allowed-tools: Read(*), Edit(*), MultiEdit(*), Glob(*), Grep(*), TodoWrite(*), Bash(git log*), WebFetch(*)
origin: tiktoksaas
tags: process, improvement, learning, lightweight
tested: true
---

# Process Improvement Analyzer

## Purpose
Analyze session patterns and derive minimal, targeted process improvements from learnings without over-engineering.

## Use Case
- After encountering repeated issues or blockers
- End of sprint retrospectives
- When patterns emerge across multiple sessions
- To prevent future occurrences of solved problems

## Command

**Analysis Target**: $ARGUMENTS (optional: session-summary, current-issues, or auto-detect)

**Analysis Steps:**
1. **Issue Pattern Recognition**: Review recent diary entries, git commits, and session challenges
2. **Root Cause Analysis**: Identify underlying process gaps (not individual mistakes)
3. **Impact Assessment**: Focus on high-impact, low-overhead improvements
4. **Existing Process Review**: Check current ADRs, definition of done, and guidelines
5. **Lightweight Solution Design**: Create simple rules, checklists, or guidelines

**Update Targets:**
- Add 1-3 critical checkboxes to Definition of Done
- Insert targeted guidance in documentation (1-2 sentences max)
- Create simple decision trees or checklists
- Update diary with process learning entries marked with #key tag
- **Avoid**: Complex workflows, heavy documentation, elaborate processes

**Core Philosophy**: "Make the right thing easy, wrong thing obvious" - focus on judgment aids, not bureaucracy

**Output**: Specific file updates with rationale, targeting prevention of recurring issues through minimal process enhancements

## Examples of Good Improvements
- Adding "Run linting before commit" checkbox to catch code quality issues
- "Test all API endpoints" rule to prevent delivery of broken functionality
- "Multi-platform testing" requirement for cross-platform features
- "Check for API rate limits" reminder for third-party integrations

## Examples to Avoid
- Complex approval workflows
- Detailed documentation requirements for every change
- Heavy architectural review processes
- Elaborate tracking systems beyond existing tools

## Success Metrics
- Reduction in repeated issues
- Faster problem resolution
- Team adopts improvements naturally
- Process stays lightweight

## Prerequisites
- Project diary system (or similar learning capture)
- Definition of Done document
- Version control with commit history

## Real Usage Example
```bash
# After sprint with multiple API timeout issues
npm run process:improve -- "api-timeout-issues"

# Result: Added "API timeout handling" checkbox to DoD
# and "Set 30s default timeout for all external APIs" guideline
```

## Origin Story
Created for TikTok SaaS project after realizing we needed systematic way to capture and apply learnings without creating bureaucracy. Inspired by "make the right thing easy" principle.
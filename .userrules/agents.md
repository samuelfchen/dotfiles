# Global Agent Rules

## MANDATORY: Repository-Specific Rules Loading

These are global rules that apply to ALL interactions. You MUST follow these instructions at the start of EVERY conversation.

### Rule Loading Logic

**IMPORTANT**: Check the current working directory at the start of every conversation and load the appropriate repository-specific rules:

1. **If working in the `jira` git repository:**
   - Load and follow ALL rules from: `~/.userrules/jira/agents.md`
   - These rules contain Java and Jira-specific development guidelines
   - Confirmation: Start every message with 🫘 emoji

2. **If working in the `atlassian-frontend-monorepo` git repository:**
   - Load and follow ALL rules from: `~/.userrules/afm/agents.md`
   - These rules contain React/TypeScript and AFM-specific guidelines
   - Confirmation: Start every message with 🎨 emoji

3. **If working in any other directory:**
   - Only follow these global rules
   - No emoji prefix required

### Validation Checklist

At the start of each conversation:
- [ ] Check the current working directory
- [ ] Identify which git repository (if any) you're in
- [ ] Load the corresponding repository-specific rules file
- [ ] Apply the appropriate emoji prefix to confirm rule loading

---

## General Guidelines

These apply to all repositories and contexts:

### User Preferences
- Always refer to the user as "Sam"

### Development Standards
- Always prioritize code quality and maintainability
- Follow existing code patterns and conventions in the project
- Ask for clarification when requirements are ambiguous
- Provide context and reasoning for technical decisions

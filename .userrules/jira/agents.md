# Jira Repository Agent Rules

## MANDATORY REQUIREMENTS

**Context**: You are working in the Jira server monolith repository, a large-scale Java enterprise application.

**Confirmation Required**: You MUST start EVERY message with the 🫘 emoji to confirm you have loaded and understood these rules.

---

## Repository Information

- **Primary Language**: Java
- **Build System**: Maven
- **Architecture**: Monolithic server application
- **Key Technologies**: Spring, Hibernate, REST APIs

---

## Environment & Tools

### Shell & Commands
- **Shell**: Always use ZSH
- **File Search**: Use `fd` instead of `find`

### Context Awareness
- Use currently opened file folders as search starting point (unless specified otherwise)

---

## Workflow & Planning

### Planning Requirements
- **Always provide plan** before changes (concise for small changes)
- **Skip planning** only if prompt includes "send it"
- **⚠️ CRITICAL**: Read user rules on EVERY prompt; start with 🫘 if followed, 🚨 WARNING if not

### Pattern Discovery
- **IMPORTANT**: When presented a task, look for similar implementations within the repo
- **Search strategy**: Start within the domain of the required task and expand outwards only if the pattern cannot be found within the domain
- Check existing patterns in same package before implementing

---

## Development Guidelines

### Code Style & Formatting
- Follow existing Java code conventions in the repository
- **Use spaces, not tabs** for formatting
- Maintain consistency with surrounding code patterns
- Use proper JavaDoc comments for public APIs
- Verify correct indentation
- Avoid unnecessary comments (only when code isn't self-descriptive)

### Code Quality
- **Debug logs**: Prefix with `DEBUG:` for easy filtering
- Ensure code compiles without warnings

### Code References & Navigation
- Include clear file/line links in all code references
- Add clickable links next to code snippets

### Testing Requirements

#### General Testing
- Write unit tests for new functionality
- Update existing tests when modifying code
- Run relevant test suites before committing

#### Test Execution
- **Test isolation**: Run focused/isolated tests initially, then verify full suite passes
- **After cleanup**: Run changed tests to verify changes

### Build and Compilation
- Ensure code compiles without warnings
- Run `mvn clean install` to verify builds
- Check for dependency conflicts

### Common Patterns
- Follow existing service layer patterns
- Use dependency injection appropriately
- Maintain separation of concerns

---

## Git Operations

### Inspecting Changes
- Use `git diff --cached master...HEAD` to inspect staged changes

---

**Remember**: Always start your messages with 🫘 to confirm you're following these Jira-specific rules!

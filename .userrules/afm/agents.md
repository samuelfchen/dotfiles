# Atlassian Frontend Monorepo (AFM) Agent Rules

## MANDATORY REQUIREMENTS

**Context**: You are working in the Atlassian Frontend Monorepo, a large-scale TypeScript/React monorepo containing shared UI components and applications.

**Confirmation Required**: You MUST start EVERY message with the 🎨 emoji to confirm you have loaded and understood these rules.

---

## Repository Information

- **Primary Languages**: TypeScript, React
- **Build System**: Yarn workspaces, Bolt
- **Architecture**: Monorepo with multiple packages
- **Key Technologies**: React, TypeScript, Emotion (CSS-in-JS), Jest, Testing Library

---

## Environment & Tools

### Shell & Commands
- **Shell**: Always use ZSH
- **File Search**: Use `fd` instead of `find`
- **Node Version**: Run `nvm use` after directory changes (once per session)

### Context Awareness
- Use currently opened file folders as search starting point (unless specified otherwise)

---

## Workflow & Planning

### Planning Requirements
- **Always provide plan** before changes (concise for small changes)
- **Skip planning** only if prompt includes "send it"
- **Check existing patterns** in same package before implementing
- **⚠️ CRITICAL**: Read user rules on EVERY prompt; start with 🎨 if followed, 🚨 WARNING if not

---

## Development Guidelines

### File Naming Conventions
- **Avoid**: `index.*` naming (especially for GraphQL files)
- **Use**: Filenames matching export names

### Code Style
- Follow TypeScript strict mode conventions
- Use React functional components and hooks
- Follow existing naming conventions in the monorepo
- Use proper TypeScript types (avoid `any`)
- Verify correct indentation
- Avoid unnecessary comments (only when code isn't self-descriptive)

### Code Quality
- **Debug logs**: Prefix with `DEBUG:` for easy filtering

### Code References & Navigation
- Include clear file/line links in all code references
- Add clickable links next to code snippets

### Testing Requirements

#### General Testing
- Write unit tests using Jest and Testing Library
- Aim for high test coverage on new code
- Update snapshot tests when UI changes

#### Test Execution
- **Command format**: `nvm use; afm test [filename]`
- **Isolate tests**: Use `.only` initially, remove after verification
- **Verify full suite**: Ensure entire test file passes after removing `.only`
- **After feature gate cleanup**: Run changed tests to verify

#### Testing Patterns
- **Hook testing**: Use `renderHook`, not `renderWithDi` with dummy component

### Build and Type Checking
- Ensure TypeScript compilation succeeds without errors
- Run `yarn build` to verify builds
- Check for type errors with `yarn typecheck`
- Verify no lint errors with `yarn lint`
- **Important**: Check both source files AND related test files

### Common Patterns
- Use Design System components from `@atlaskit/*` packages
- Follow accessibility (a11y) best practices
- Implement proper error boundaries
- Use React hooks appropriately
- **Feature gates**: Use `componentWithFG` convention at file root (prevents recomputation)

### Package Management
- Add dependencies at the correct workspace level
- Update `package.json` with appropriate version ranges
- Be mindful of bundle size implications

---

## Git Operations

### Inspecting Changes
- Use `git diff --cached master...HEAD` to inspect staged changes

---

**Remember**: Always start your messages with 🎨 to confirm you're following these AFM-specific rules!

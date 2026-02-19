# Global Agent Rules

## MANDATORY: Repository-Specific Rules Loading

⚠️ **CRITICAL REQUIREMENT** ⚠️

These are global rules that apply to ALL interactions. You MUST follow these instructions at the start of EVERY conversation.

**FAILURE TO LOAD REPOSITORY-SPECIFIC RULES IS UNACCEPTABLE** - Sam relies on you to follow the patterns and tools specified for each repository. Not doing so wastes Sam's time and breaks workflows.

### Rule Loading Logic

**IMPORTANT**: Identify which git repository you're working in at the start of every conversation and load the appropriate repository-specific rules. The determination MUST be based on the git repository itself, NOT the folder name or path.

⚠️ **COMMON MISTAKE**: The `atlassian-frontend-monorepo` often has a `jira/` subdirectory. If you see a path like `/Users/.../afm-2/jira` or `/Users/.../atlassian-frontend-monorepo/jira`, this is NOT the Java Jira repo - it's the AFM repo with a jira subdirectory!

**How to identify the repository** (follow these steps in order):

1. **Check the Workspace Path** in the `<user_info>` block:

   - If it contains `/afm/` or `/afm-2/` or `/atlassian-frontend-monorepo/` → This is likely the atlassian-frontend-monorepo
   - If it ends with just `/jira` (no afm or atlassian-frontend-monorepo in path) → This is likely the Java jira repository

2. **Verify by reading `.git/config`**:

   - Start with the workspace path shown in `<user_info>`
   - Navigate UP to find `.git/config` (it may be 1-2 levels up from current directory)
   - Read the file and look for the `[remote "origin"]` section
   - Check the `url` field:
     - Contains `atlassian/jira.git` → **jira repository** (Java monolith)
     - Contains `atlassian-frontend-monorepo.git` → **atlassian-frontend-monorepo** (React/TypeScript)
     - Other URL → Follow only global rules

3. **If `.git/config` cannot be found**:
   - Run `git remote -v` to see the repository URL
   - Apply same URL matching logic as above

**Load the correct rules based on repository:**

1. **If working in the `jira` git repository (Java monolith):**

   - Repository URL: `atlassian/jira.git`
   - Load and follow ALL rules from: `~/.userrules/jira/agents.md`
   - These rules contain Java and Jira server-specific development guidelines
   - Confirmation: Start every message with 🫘 emoji

2. **If working in the `atlassian-frontend-monorepo` git repository:**

   - Repository URL: `atlassian-frontend-monorepo.git`
   - Load and follow ALL rules from: `~/.userrules/afm/agents.md`
   - These rules contain React/TypeScript and AFM-specific guidelines
   - **This includes work in the `/jira` subdirectory of AFM!**
   - Confirmation: Start every message with 🎨 emoji

3. **If working in any other git repository or non-git directory:**
   - Only follow these global rules
   - No emoji prefix required

**Examples to clarify:**

- ✅ `/Users/schen5/atlassian/afm-2/jira` → AFM repo (🎨) - note "afm-2" in path
- ✅ `/Users/schen5/atlassian/afm/platform` → AFM repo (🎨)
- ✅ `/Users/schen5/atlassian/atlassian-frontend-monorepo` → AFM repo (🎨)
- ✅ `/Users/schen5/atlassian/jira/src/main/java` → Jira Java repo (🫘)
- ✅ `/Users/schen5/atlassian/jira/jira-core` → Jira Java repo (🫘)

### Validation Checklist

⚠️ **YOU MUST COMPLETE THIS CHECKLIST AT THE START OF EVERY CONVERSATION** ⚠️

At the start of each conversation:

- [ ] Check workspace path in `<user_info>` for quick identification
- [ ] Read `.git/config` (navigate up from workspace if needed) to verify repository
- [ ] Identify which git repository based on the remote URL
- [ ] Load the corresponding repository-specific rules file
- [ ] Apply the appropriate emoji prefix to confirm rule loading

**During every conversation:**

- [ ] Before using ANY command-line tool, verify if the repo-specific rules specify a preferred tool
- [ ] Before making code changes, verify you're following repo-specific code style guidelines
- [ ] Before running tests, verify you're following repo-specific test execution patterns

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

### Git Operations

- **Never use `git commit` without `-m`** — Sam's git editor is nvim; opening an interactive editor for commit messages can fail or hang in agent contexts. Always use `git commit -m "message"` to pass the message inline.
- **Prefer Sam's git aliases** when committing — See `~/.gitconfig` for aliases. Useful ones:
  - `git cm "message"` — commit with message (equivalent to `git commit -m`)
  - `git ac "message"` — add all and commit with message

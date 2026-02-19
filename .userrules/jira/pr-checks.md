# Pre-PR Checklist for LLM-Generated Changes

Use this checklist **before** raising a PR.  
If any item does not hold, either fix the code or explain why in the PR description.

---

## ⚠️ MANDATORY: Read Actual Code Before Auditing

**Before starting the checklist, you MUST:**

1. [ ] Run `git diff master` or `git diff master --stat` to see all changed files
2. [ ] **Read EVERY changed file** using `read_files` tool with the actual file paths
3. [ ] **Do NOT rely on memory** of what was discussed earlier - code may have changed
4. [ ] For each checklist item, **quote actual code snippets** from the files you just read
5. [ ] If you catch yourself saying "the code does X" without quoting it, STOP and re-read the file

**Why this matters:**
- Files may have been edited since you last saw them
- Memory is unreliable for code details
- Skimming leads to missing obvious issues (like redundant comments)
- Actual code review requires seeing the actual code

**Example of WRONG approach:**
> "✅ No redundant comments - the code looks clean"

**Example of CORRECT approach:**
> "❌ Found redundant comment on line 78: `// Must have exactly one type clause` - this is obvious from `if (typeClauses.size() != 1)`, removing it..."

---

## 1. Correctness & Scope

- [ ] Change is **minimal and focused** on the ticket; no unrelated refactors.
- [ ] Existing behavior is **preserved**, unless an intentional change is clearly documented.
- [ ] For any behavior change, the **what** and **why** are explained in the PR description.

---

## 2. Use of Existing Services & Calls

- [ ] I checked for **existing services/helpers** (Roadmaps, board admin, project features, versions, timeline settings) and **reused them** instead of re‑implementing logic.
- [ ] For each new **service call** I added:
  - [ ] I verified the same data is **not already fetched** elsewhere in the same flow.
  - [ ] If it is, I **consolidated** calls to fetch once and reuse the result.
- [ ] No obviously **duplicated queries** (e.g. fetching the same config/versions/settings multiple times in one request path).

---

## 3. Structure & Separation of Concerns

**📖 Action Required: Read the actual method implementations to verify structure.**

- [ ] Methods/classes have **single, clear responsibilities** (fetch vs business logic vs mapping).
- [ ] Non‑trivial logic that is reused (or likely reused) is **extracted** into:
  - [ ] A mapper/transformer, or
  - [ ] A parser, or
  - [ ] A dedicated service,
  following existing patterns.
- [ ] Extracted logic has **focused unit tests**.

---

## 4. Error Handling & Nullability

- [ ] Nullability matches **existing contracts** (GraphQL schema, interfaces, domain models).
- [ ] “Not applicable” cases use `null` or the established pattern, **not** exceptions.
- [ ] Exceptions are handled **close to the source** (e.g. JSON parsing, external calls), with safe fallbacks.
- [ ] No expected, common cases rely on **exception control flow**.

---

## 5. Performance & Efficiency

- [ ] No obvious **redundant service calls** or repeated expensive operations.
- [ ] Where appropriate, I use the **higher-level configuration APIs** (e.g. `getConfiguration`) instead of multiple low-level calls.
- [ ] Board vs project behavior:
  - [ ] I avoid unnecessary work for the irrelevant scope (e.g. skipping unneeded aggregation for boards).

---

## 6. Comments & Naming

**📖 Action Required: Read each changed file and inspect EVERY comment line by line.**

- [ ] I **removed ALL redundant comments** that narrate what the code does.
  - ❌ BAD: `// Parse JQL using native parser` (obvious from `jqlQueryParser.parseQuery()`)
  - ❌ BAD: `// Extract operator and values` (obvious from variable names)
  - ❌ BAD: `// Must have exactly one type clause` (obvious from `if (size != 1)`)
  - ❌ BAD: `// Single value: type = "Epic"` (obvious from `instanceof SingleValueOperand`)
  - ✅ GOOD: `// Invalid JQL - return false (conservative approach)` (explains WHY)
  - ✅ GOOD: `// Note: isValid() checks if clauses are inside OR/NOT despite the vague name` (explains quirk)
  - ✅ GOOD: `// Functions and empty operands - conservative fallback` (explains strategy)
  
- [ ] **Rule: If the code is self-explanatory, DELETE the comment.** Only keep comments that explain:
  - WHY a decision was made (not WHAT the code does)
  - Domain quirks or business rules that aren't obvious from code
  - External API contracts or confusing terminology
  - Workarounds or non-obvious edge cases
  
- [ ] Names for variables/methods/fields are **clear and descriptive**, matching local conventions.

---

## 7. GraphQL & API Changes (if applicable)

- [ ] Monolith GraphQL schema, datafetchers, and services are **consistent** with each other.
- [ ] Where relevant, graphql‑central schema changes are **kept in sync**.
- [ ] New/changed fields, queries, or mutations:
  - [ ] Have **integration tests** covering expected behavior.
  - [ ] Correctly handle **board vs project** semantics.
  - [ ] Use **appropriate nullability** and defaults.

---

## 8. Tests

**📖 Action Required: Read both the implementation AND test files to verify coverage.**

- [ ] Existing tests are updated where needed.
- [ ] New logic (especially parsers/mappers/services) has **unit tests** for:
  - [ ] Normal cases,
  - [ ] Edge cases,
  - [ ] Error/fallback behavior.
- [ ] Tests are **readable** and use representative data.

---

## 9. Feature Flags & Cleanup (if applicable)

- [ ] New behavior behind feature flags uses the **standard rollout pattern** in this codebase.
- [ ] Old and new code paths are **clearly separated**.
- [ ] A plan exists (ticket or note) for **cleaning up** the flag and old path after rollout.

---

## 10. PR Title & Description

### Title Format
- [ ] Title includes the **branch issue key** (e.g., "JSC-3650: Refactor JQL parsing")
- [ ] Title is **concise** and describes the change clearly

### Description Format
- [ ] Description is **concise** (no unnecessary details)
- [ ] Description has exactly **two sections**:

#### **Changes** section:
- [ ] Brief bullet points of what changed
- [ ] Focus on WHAT, not HOW
- [ ] 3-5 bullets maximum

#### **Notes** section:
- [ ] Any behavior changes or trade-offs
- [ ] Testing approach
- [ ] Follow-up work (if applicable)
- [ ] Context reviewers need to know

**Example:**

```markdown
# Changes
- Replaced regex-based JQL parsing with native `JqlQueryParser`
- Now uses platform's `SimpleNavigatorCollectorVisitor` for OR/NOT detection
- Removed 45 lines of custom regex and recursion code

# Notes
- Also rejects type clauses inside NOT (safer, conservative approach)
- All 36 tests pass (34 existing + 4 new edge cases)
- No follow-up work needed
```

# Pre-PR Checklist for LLM-Generated Changes

Use this checklist **before** raising a PR.  
If any item does not hold, either fix the code or explain why in the PR description.

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

- [ ] I **avoided unnecessary comments** that just narrate the code.
- [ ] Any comments explain **why**, or capture domain quirks / external contracts, not what the code obviously does.
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

## 10. PR Description

- [ ] PR description briefly explains:
  - [ ] What changed (1–3 sentences),
  - [ ] Why it changed,
  - [ ] Any behavior changes or trade‑offs,
  - [ ] Any follow‑up work (e.g. cleanup PRs).

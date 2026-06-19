# Lessons Learned

Append project lessons only after real research tasks or workflow failures.

## Template
```markdown
---
## Lesson #N - YYYY-MM-DD
**Trigger:** What happened.
**Rule:** One concrete, actionable rule.
**Source:** Project or task name.
```

---
## Lesson #1 - 2026-06-19
**Trigger:** PowerShell validation script failed when a variable was followed by `:` inside a double-quoted string.
**Rule:** When a PowerShell interpolated string appends `:` immediately after a variable name, wrap the variable as `${Variable}`.
**Source:** Research-Team AGENTS completion.

---
## Lesson #2 - 2026-06-20
**Trigger:** `opencode.jsonc` parsed as JSON but OpenCode 1.17.8 rejected its custom root keys.
**Rule:** Validate OpenCode configuration with `opencode debug config --pure`; JSON parsing alone does not verify the OpenCode schema.
**Source:** OpenCode Research Team startup repair.

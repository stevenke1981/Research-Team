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

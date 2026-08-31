# Research-Team

Docs-only research-agent pack for Google Antigravity (`agy`), OpenCode, Claude Code, and Codex research workflows.

## Use
- Start with `AGENTS.md` (or `GEMINI.md` for Antigravity).
- Apply `TEAM.md` as the operating charter.
- Run roles in the execution order from `AGENTS.md`.
- Use `workflows/` for study type and lifecycle control.
- Use `policies/` before finalizing claims, citations, evidence grades, and reviews.

## Validate
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/validate.ps1
```

## Layout
| Path | Purpose |
|------|---------|
| `AGENTS.md` | Agent entrypoint and execution contract (Codex / OpenCode / Claude) |
| `GEMINI.md` | Antigravity agent instructions and execution rules |
| `SKILL.md` | Antigravity / Agent Skill definition entrypoint |
| `TEAM.md` | Mission, rules, acceptance criteria |
| `usage.md` | Antigravity, Codex, and OpenCode activation steps |
| `roles/` | Specialist agent briefs |
| `workflows/` | Research lifecycle and study-specific workflows |
| `policies/` | Citation, hallucination, evidence, review guardrails |
| `templates/` | Reusable output templates |
| `scripts/validate.ps1` | Local validation gate |
| `FAILURE_LOG.md` | Real failed attempts and recovery notes |
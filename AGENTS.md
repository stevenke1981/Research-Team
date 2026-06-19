# Agent Instructions

## Package Manager
Docs-only pack. No package manager. Use PowerShell validation commands.

## File-Scoped Commands
| Task | Command |
|------|---------|
| Validate one Markdown file | `powershell -NoProfile -ExecutionPolicy Bypass -File scripts/validate.ps1 -Path path/to/file.md` |
| Validate full pack | `powershell -NoProfile -ExecutionPolicy Bypass -File scripts/validate.ps1` |

## Execution Order
1. `roles/orchestrator.md`
2. `roles/scholar-search.md`
3. `roles/literature-reviewer.md`
4. `roles/fact-checker.md`
5. `roles/methodology-reviewer.md`
6. `roles/statistician.md`
7. `roles/gap-finder.md`
8. `roles/peer-reviewer-1.md`
9. `roles/peer-reviewer-2.md`
10. `roles/area-chair.md`
11. `roles/academic-writer.md`
12. `roles/citation-manager.md`

## Research Rules
- Use `TEAM.md` as the charter.
- Follow `workflows/research-pipeline.md` unless a workflow in `workflows/` is more specific.
- Never invent citations; apply `policies/citation-policy.md` and `policies/anti-hallucination.md`.
- Grade evidence with `policies/evidence-grading.md`.
- Separate facts, interpretations, speculation, and limitations.
- Major claims require three independent sources or explicit `Low` confidence.
- Manuscripts require `roles/peer-reviewer-1.md`, `roles/peer-reviewer-2.md`, and `roles/area-chair.md` review.

## Deliverables
- Executive summary
- Evidence table
- Contradiction analysis
- Key findings and limitations
- Research gaps and future work
- Verified references or explicit missing-citation notes

## Commit Attribution
AI commits MUST include:
```
Co-Authored-By: (the agent model's name and attribution byline)
```

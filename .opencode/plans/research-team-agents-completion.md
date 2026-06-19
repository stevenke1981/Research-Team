## Plan: Research-Team AGENTS completion
**Goal:** Turn the batch archives into a complete, validated research-team agent pack.
**Complexity:** L3

### Sub-tasks
1. [x] Inspect batch archives and current workspace state -> output: source inventory
2. [x] Create root agent instructions -> file: AGENTS.md -> output: concise execution contract
3. [x] Consolidate team charter -> file: TEAM.md -> output: merged mission, rules, criteria
4. [x] Organize specialist roles -> files: roles/*.md -> output: reusable role briefs
5. [x] Organize research workflows and policies -> files: workflows/*.md, policies/*.md -> output: research guardrails
6. [x] Add validation tooling -> file: scripts/validate.ps1 -> output: repeatable checks
7. [x] Verify project and create git commit -> output: clean committed baseline

### Risks
| Risk | Mitigation |
|------|------------|
| Duplicate TEAM.md entries from batches | Merge both into one charter instead of overwriting |
| OpenCode runtime files pollute git | Ignore memory DB, Tantivy, vectors, and source zip imports |
| Agent docs drift from manifest | Validate referenced paths and JSON config |

### Definition of Done
- [x] `scripts/validate.ps1` passes
- [x] `AGENTS.md` is under 100 lines
- [x] `CLAUDE.md` points to `AGENTS.md`
- [x] git commit created

### Assumptions
- The zip files are source imports and should remain local but not become the canonical tracked deliverable.
- This is a docs-only agent pack, so no package manager is required.

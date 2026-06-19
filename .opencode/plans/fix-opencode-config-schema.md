## Plan: Fix OpenCode config schema
**Goal:** Make OpenCode 1.17.8 load the Research Team instructions without unsupported configuration keys.
**Complexity:** L3

### Sub-tasks
1. [x] Reproduce the schema error and verify the official configuration contract.
2. [x] Replace custom root keys with supported instruction paths and globs.
3. [x] Add configuration regression checks to `scripts/validate.ps1`.
4. [x] Record the real failure and reusable lesson.
5. [x] Run project validation and OpenCode smoke checks.
6. [x] Commit the verified fix; push only after explicit approval for `main`.

### Risks
| Risk | Mitigation |
|------|------------|
| Research role files stop loading | Resolve every instruction path or glob during validation. |
| Schema changes again | Keep release validation against the installed OpenCode resolved-config command. |
| Interactive TUI blocks automation | Validate with `opencode debug config --pure` and a bounded `opencode run` smoke test. |

### Definition of Done
- [x] `opencode debug config --pure` accepts the project configuration.
- [x] Every Research Team instruction glob resolves to files.
- [x] `scripts/validate.ps1` passes.
- [x] Changes are ready for a verified commit; `main` push requires explicit approval.

### Assumptions
- `AGENTS.md` is loaded automatically by OpenCode project rule discovery.
- `TEAM.md`, roles, workflows, and policies should be included as additional instructions.

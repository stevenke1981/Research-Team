# Research-Team Usage

## Goal
Let OpenCode or Codex use `D:\Research-Team` as the active research organization.

## Recommended Mode
Use global skill links. This makes Research-Team callable from any project without replacing global `AGENTS.md`, `config.toml`, or `opencode.jsonc`.

## Mode A: Use Inside This Project
Open a terminal inside the project:

```powershell
cd D:\Research-Team
powershell -NoProfile -ExecutionPolicy Bypass -File scripts\validate.ps1
opencode
```

Or use Codex:

```powershell
cd D:\Research-Team
codex
```

When the current workspace is `D:\Research-Team`, OpenCode or Codex reads `AGENTS.md` and applies the Research-Team workflow.

## Mode B: Install As Global Skill
Create the skill entrypoint:

```powershell
cd D:\Research-Team

@'
---
name: research-team
description: Use when the task needs academic research, literature review, PRISMA, SLR, citation verification, peer review, thesis planning, meta-analysis, benchmark studies, or evidence synthesis.
---

# Research-Team Skill

Use this repository as the active research organization.

1. Read AGENTS.md.
2. Apply TEAM.md.
3. Route work through roles/, workflows/, and policies/.
4. Validate the pack with scripts/validate.ps1.
'@ | Set-Content -Encoding UTF8 SKILL.md
```

Create junctions so Codex, OpenCode, and local agents use the same source:

```powershell
$src = "D:\Research-Team"
$targets = @(
  "$env:USERPROFILE\.codex\skills\research-team",
  "$env:USERPROFILE\.config\opencode\skills\research-team",
  "$env:USERPROFILE\.agents\skills\research-team"
)

foreach ($target in $targets) {
  New-Item -ItemType Directory -Force -Path (Split-Path $target) | Out-Null
  if (Test-Path $target) {
    Write-Host "exists: $target"
  } else {
    New-Item -ItemType Junction -Path $target -Target $src | Out-Null
    Write-Host "linked: $target -> $src"
  }
}
```

Verify the install:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File D:\Research-Team\scripts\validate.ps1
Get-Item $env:USERPROFILE\.codex\skills\research-team
Get-Item $env:USERPROFILE\.config\opencode\skills\research-team
Get-Item $env:USERPROFILE\.agents\skills\research-team
```

Restart Codex or OpenCode after creating the links.

Call the skill:

```text
使用 research-team：幫我針對 [主題] 做系統性文獻回顧，依 AGENTS.md 的流程執行。
```

Or:

```text
$research-team 請啟動 PRISMA + citation verification，研究主題是 [主題]。
```

## Mode C: Make OpenCode Default To Research-Team
This affects all OpenCode sessions. Prefer Mode B unless you explicitly want a global default.

Back up the current global file:

```powershell
$global = "$env:USERPROFILE\.config\opencode\AGENTS.md"
$backup = "$global.bak-$(Get-Date -Format yyyyMMdd-HHmmss)"

if (Test-Path $global) {
  Copy-Item $global $backup
  Write-Host "backup: $backup"
}
```

Use a small pointer in the global `AGENTS.md`:

```markdown
# OpenCode Global Research Mode

For academic research tasks, use `D:\Research-Team\AGENTS.md`.
Follow `D:\Research-Team\TEAM.md`, roles, workflows, policies, and validation script.
```

## Daily Prompt
Use this prompt when you want the full team behavior:

```text
使用 research-team。請以 orchestrator 開始，依 scholar-search -> literature-reviewer -> fact-checker -> methodology-reviewer -> statistician -> gap-finder -> peer-reviewer-1 -> peer-reviewer-2 -> area-chair -> academic-writer -> citation-manager 的順序處理。所有重要 claim 都要 evidence、confidence、contradiction analysis。
```

## Quality Level
PRODUCTION: Mode B is the recommended setup because it is callable from any project and does not overwrite global agent configuration.

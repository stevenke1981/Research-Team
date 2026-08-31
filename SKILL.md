---
name: research-team
description: >-
  Comprehensive multi-agent academic and empirical research organization for Antigravity (agy),
  Claude Code, OpenCode, and Codex. Covers PRISMA, SLR, literature review, citation verification,
  methodology audit, statistical review, fact checking, and peer-reviewed report drafting.
tags:
  - research
  - academic
  - literature-review
  - prisma
  - slr
  - citation-verification
  - fact-check
  - peer-review
triggers:
  - research-team
  - 系統性文獻回顧
  - 論文研究
  - academic research
  - literature review
  - PRISMA
  - SLR
  - fact-check
---

# Research-Team Skill

Use this repository as the active research organization in Google Antigravity (`agy`), Claude Code, OpenCode, or Codex.

## Execution Procedure
1. Read `AGENTS.md` (or `GEMINI.md`) for the agent execution pipeline.
2. Apply `TEAM.md` as the operating charter and quality standard.
3. Route tasks through specialist roles:
   - `roles/orchestrator.md` -> Initial study design and role assignment
   - `roles/scholar-search.md` -> Multi-database academic search queries
   - `roles/literature-reviewer.md` -> Synthesis and thematic categorization
   - `roles/fact-checker.md` -> Independent adversarial factual verification
   - `roles/methodology-reviewer.md` -> Experimental design & risk of bias audit
   - `roles/statistician.md` -> Quantitative, statistical, and power analysis
   - `roles/gap-finder.md` -> Unresolved research gaps and whitespace
   - `roles/peer-reviewer-1.md` & `roles/peer-reviewer-2.md` -> Independent double-blind review
   - `roles/area-chair.md` -> Meta-review and acceptance decision
   - `roles/academic-writer.md` -> Academic manuscript drafting
   - `roles/citation-manager.md` -> Verification of DOIs, BibTeX, and citation integrity
4. Adhere strictly to guardrails:
   - `policies/anti-hallucination.md` (zero unverified citations)
   - `policies/evidence-grading.md` (Oxford CEBM / GRADE tiers)
   - `policies/citation-policy.md` (triple-source verification for high-impact claims)
   - `policies/review-policy.md` (formal rejection criteria)
5. Output structured deliverables according to `templates/`.
6. Validate with `powershell -NoProfile -ExecutionPolicy Bypass -File scripts/validate.ps1`.
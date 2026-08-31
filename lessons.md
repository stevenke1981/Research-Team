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

---
## Lesson #3 - 2026-06-27
**Trigger:** Building `skills/c-llm-professional/` required 27 files across 8 sub-directories covering the full ggml/llama.cpp stack from tensor library to production deployment.
**Rule:** When designing a professional C/C++ skill for an ML ecosystem, structure into these 8 domains: core-architecture → model-lifecycle → inference → ui-systems → build-deploy → performance → tooling. Each domain should have 3-4 focused files rather than one monolithic document.
**Source:** Research-Team C/LLM Professional skill creation.

---
## Lesson #4 - 2026-06-27
**Trigger:** Building `skills/rust-llm-professional/` required understanding the three-pillar Rust LLM ecosystem (Candle, Burn, Rig) and creating 26 files across 8 domains.
**Rule:** When designing a Rust LLM skill, structure into 8 domains that mirror the three pillars: core-tensors → model-lifecycle → inference-engines → training-fine-tuning → agent-applications → server-api → build-deploy → testing-observability. Each domain addresses a distinct layer from tensor ops to production observability.
**Source:** Research-Team Rust LLM Professional skill creation.

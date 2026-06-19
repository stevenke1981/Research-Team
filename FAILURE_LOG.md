# Failure Log

## 2026-06-19 - OpenCode memory search unavailable
Attempt: Query OpenCode memory for `D:\Research-Team` context.

Result:
- `scope=project` failed because the tool rejected the scope value.
- Retrying without scope failed with an embedding API 404.

Action:
- Continued from local archive inspection and live workspace state.

## 2026-06-19 - PowerShell interpolation parse error
Attempt: Run `scripts/validate.ps1`.

Result:
- PowerShell parsed `$RelativePath:$LineNumber` as an invalid scoped variable reference.

Action:
- Changed the string to `${RelativePath}:$LineNumber`.

## 2026-06-20 - OpenCode rejected Research Team metadata
Attempt: Start OpenCode 1.17.8 from `D:\Research-Team`.

Result:
- OpenCode rejected `opencode.jsonc` because its custom root keys were not part of the official schema.
- The existing validator only parsed JSON and therefore missed schema incompatibility.

Action:
- Replaced the custom metadata keys with the supported `instructions` array.
- Added supported-key and instruction-pattern checks to `scripts/validate.ps1`.
- Verified the repaired configuration manually with `opencode debug config --pure` and `opencode run --pure`.

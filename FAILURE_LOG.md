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

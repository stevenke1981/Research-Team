[CmdletBinding()]
param(
    [string]$Path
)

$ErrorActionPreference = "Stop"
$Root = Resolve-Path (Join-Path $PSScriptRoot "..")

function Resolve-ProjectPath {
    param([string]$RelativePath)
    if ([System.IO.Path]::IsPathRooted($RelativePath)) {
        return $RelativePath
    }
    return Join-Path $Root $RelativePath
}

function Assert-File {
    param([string]$RelativePath)
    $FullPath = Resolve-ProjectPath $RelativePath
    if (-not (Test-Path -LiteralPath $FullPath -PathType Leaf)) {
        throw "Missing file: $RelativePath"
    }
    return $FullPath
}

function Test-Markdown {
    param([string]$RelativePath)
    $FullPath = Assert-File $RelativePath
    $Lines = Get-Content -LiteralPath $FullPath
    for ($Index = 0; $Index -lt $Lines.Count; $Index++) {
        if ($Lines[$Index] -match "[ \t]+$") {
            $LineNumber = $Index + 1
            throw "Trailing whitespace: ${RelativePath}:$LineNumber"
        }
    }
}

if ($Path) {
    Test-Markdown $Path
    Write-Host "OK: $Path"
    exit 0
}

$RequiredFiles = @(
    "AGENTS.md",
    "CLAUDE.md",
    "GEMINI.md",
    "SKILL.md",
    "FAILURE_LOG.md",
    "TEAM.md",
    "usage.md",
    "README.md",
    "lessons.md",
    "opencode.jsonc",
    "roles/orchestrator.md",
    "roles/scholar-search.md",
    "roles/literature-reviewer.md",
    "roles/fact-checker.md",
    "roles/methodology-reviewer.md",
    "roles/statistician.md",
    "roles/gap-finder.md",
    "roles/peer-reviewer-1.md",
    "roles/peer-reviewer-2.md",
    "roles/area-chair.md",
    "roles/academic-writer.md",
    "roles/citation-manager.md",
    "roles/thesis-supervisor.md",
    "roles/rebuttal-writer.md",
    "workflows/research-pipeline.md",
    "workflows/PRISMA.md",
    "workflows/SLR.md",
    "workflows/META_ANALYSIS.md",
    "workflows/REPRODUCIBILITY.md",
    "workflows/BENCHMARK_STUDY.md",
    "workflows/SURVEY.md",
    "workflows/RSI.md",
    "policies/anti-hallucination.md",
    "policies/evidence-grading.md",
    "policies/citation-policy.md",
    "policies/review-policy.md",
    "templates/evidence-table.md",
    "templates/fact-check.md",
    "templates/review.md"
)

foreach ($File in $RequiredFiles) {
    Test-Markdown $File
}

$AgentsLineCount = (Get-Content -LiteralPath (Resolve-ProjectPath "AGENTS.md")).Count
if ($AgentsLineCount -gt 100) {
    throw "AGENTS.md has $AgentsLineCount lines; keep it at or below 100."
}

$ConfigPath = Assert-File "opencode.jsonc"
$Config = Get-Content -LiteralPath $ConfigPath -Raw | ConvertFrom-Json
$SupportedConfigKeys = @('$schema', 'instructions')
$UnsupportedConfigKeys = @(
    $Config.PSObject.Properties.Name | Where-Object { $_ -notin $SupportedConfigKeys }
)
if ($UnsupportedConfigKeys.Count -gt 0) {
    throw "Unsupported opencode.jsonc keys: $($UnsupportedConfigKeys -join ', ')"
}

if ($Config.'$schema' -ne "https://opencode.ai/config.json") {
    throw "opencode.jsonc must use the official OpenCode schema."
}

if (-not $Config.instructions -or $Config.instructions.Count -eq 0) {
    throw "opencode.jsonc must declare at least one instruction path or pattern."
}

foreach ($InstructionPattern in $Config.instructions) {
    $ResolvedPattern = Resolve-ProjectPath $InstructionPattern
    $Matches = @(Get-ChildItem -Path $ResolvedPattern -File -ErrorAction SilentlyContinue)
    if ($Matches.Count -eq 0) {
        throw "Instruction pattern matched no files: $InstructionPattern"
    }
}

Write-Host "OK: Research-Team pack validated ($($RequiredFiles.Count) files, AGENTS.md $AgentsLineCount lines)."

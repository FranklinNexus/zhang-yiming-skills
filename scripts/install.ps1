param(
    [ValidateSet("cursor", "claude", "antigravity", "all")]
    [string[]]$Platform = @("cursor", "claude"),

    [ValidateSet("personal", "project")]
    [string]$Scope = "personal",

    [string]$ProjectPath = (Get-Location).Path,

    [switch]$Force
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$skillRoot = Join-Path $repoRoot "skills"
$skill = Get-ChildItem -Path $skillRoot -Directory | Select-Object -First 1

if ($null -eq $skill) {
    throw "No skill directory found under $skillRoot"
}

function Install-JunctionSkill {
    param(
        [string]$DestinationRoot
    )

    New-Item -ItemType Directory -Path $DestinationRoot -Force | Out-Null
    $target = Join-Path $DestinationRoot $skill.Name

    if (Test-Path $target) {
        $item = Get-Item $target
        if ($item.LinkType -eq "Junction" -or $item.LinkType -eq "SymbolicLink") {
            Remove-Item $target -Force
        } elseif ($Force) {
            Remove-Item $target -Recurse -Force
        } else {
            Write-Warning "Skipping existing non-link path: $target (use -Force to replace)"
            return
        }
    }

    New-Item -ItemType Junction -Path $target -Target $skill.FullName | Out-Null
    Write-Output "Installed $($skill.Name) -> $target"
}

function Add-ManagedBlock {
    param(
        [string]$FilePath,
        [string]$BlockId,
        [string]$Content
    )

    $start = "<!-- $BlockId:START -->"
    $end = "<!-- $BlockId:END -->"
    $block = "$start`n$Content`n$end"

    if (Test-Path $FilePath) {
        $text = Get-Content $FilePath -Raw
        $pattern = [regex]::Escape($start) + ".*?" + [regex]::Escape($end)
        if ([regex]::IsMatch($text, $pattern, [System.Text.RegularExpressions.RegexOptions]::Singleline)) {
            $text = [regex]::Replace($text, $pattern, $block, [System.Text.RegularExpressions.RegexOptions]::Singleline)
        } else {
            $text = $text.TrimEnd() + "`n`n" + $block + "`n"
        }
    } else {
        $text = "# Agent Instructions`n`n$block`n"
    }

    Set-Content -Path $FilePath -Value $text -Encoding UTF8
}

if ($Platform -contains "all") {
    $Platform = @("cursor", "claude", "antigravity")
}

foreach ($p in $Platform) {
    if ($p -eq "cursor") {
        $root = if ($Scope -eq "personal") { "$env:USERPROFILE\.cursor\skills" } else { Join-Path $ProjectPath ".cursor\skills" }
        Install-JunctionSkill -DestinationRoot $root
    }

    if ($p -eq "claude") {
        $root = if ($Scope -eq "personal") { "$env:USERPROFILE\.claude\skills" } else { Join-Path $ProjectPath ".claude\skills" }
        Install-JunctionSkill -DestinationRoot $root
    }

    if ($p -eq "antigravity") {
        $agentSkillRoot = Join-Path $ProjectPath ".agents\skills"
        New-Item -ItemType Directory -Path $agentSkillRoot -Force | Out-Null
        Copy-Item -Path (Join-Path $repoRoot ".agents\skills\*.md") -Destination $agentSkillRoot -Force

        $agentsPath = Join-Path $ProjectPath "AGENTS.md"
        $relativeSkill = ".agents/skills/$($skill.Name).md"
        $content = "When the user explicitly asks for the $($skill.Name) lens, or when this repository's evaluation prompts mention it, read and apply `$relativeSkill`. Do not impersonate the source person; use the skill as a decision framework."
        Add-ManagedBlock -FilePath $agentsPath -BlockId "PERSONA-SKILL-$($skill.Name)" -Content $content
        Write-Output "Installed Antigravity adapter into $ProjectPath"
    }
}

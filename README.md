# Zhang Yiming Skills

Zhang Yiming / 张一鸣 distilled into portable AI-agent skills for Cursor, Claude Code, Antigravity, and AGENTS.md-compatible tools.

This repository is intentionally standalone. Install only this repo if you only want the Zhang Yiming / 张一鸣 lens.

## What Is Inside

```text
zhang-yiming-skills/
├── README.md
├── PRINCIPLES.md
├── AGENTS.md
├── EVALUATION.md
├── SOURCE_POLICY.md
├── skills/zhang-yiming/
│   ├── SKILL.md
│   └── PLAYBOOK.md
├── .agents/skills/zhang-yiming.md
├── adapters/
│   ├── AGENTS.md
│   └── GEMINI.md
└── scripts/
    ├── install.ps1
    └── validate.py
```

## Platforms

### Cursor

```powershell
.\scripts\install.ps1 -Platform cursor
```

For project-local installation:

```powershell
.\scripts\install.ps1 -Platform cursor -Scope project -ProjectPath "C:\path\to\project"
```

### Claude Code

Claude Code supports personal skills at `~/.claude/skills/<skill-name>/SKILL.md` and project skills at `.claude/skills/<skill-name>/SKILL.md`.

```powershell
.\scripts\install.ps1 -Platform claude
```

For project-local installation:

```powershell
.\scripts\install.ps1 -Platform claude -Scope project -ProjectPath "C:\path\to\project"
```

### Antigravity / AGENTS.md

Antigravity works best with project rules. This installer copies `.agents/skills/zhang-yiming.md` into the target project and adds a managed block to the target project's `AGENTS.md`.

```powershell
.\scripts\install.ps1 -Platform antigravity -Scope project -ProjectPath "C:\path\to\project"
```

If you prefer manual setup, copy `adapters/AGENTS.md` into your project `AGENTS.md`, and copy `.agents/skills/zhang-yiming.md` into your project `.agents/skills/`.

### Install Everywhere

```powershell
.\scripts\install.ps1 -Platform all -Scope project -ProjectPath "C:\path\to\project"
```

## Validate

```powershell
python .\scripts\validate.py
```

## Source Policy

This is a distilled behavioral package, not a mirrored corpus. It avoids long quotations, private paths, contact details, and source reconstruction.

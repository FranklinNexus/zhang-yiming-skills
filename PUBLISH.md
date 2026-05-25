# Publish Checklist

Suggested repository name: `zhang-yiming-skills`

Suggested description:

```text
Portable Zhang Yiming-inspired product, organization, rational judgment, and long-term execution skill package for Cursor, Claude Code, Antigravity, and AGENTS.md-compatible agents.
```

## Before Creating The Remote

Run:

```powershell
python .\scripts\validate.py
git status --short
```

Expected result:

- Validation passes.
- `git status --short` is empty.

## Create The GitHub Repository

Create an empty GitHub repository named `zhang-yiming-skills`.

Do not initialize it with a README, license, or `.gitignore`; this repository already contains those files where needed.

## Push

Use HTTPS:

```powershell
git remote add origin https://github.com/<your-github-user>/zhang-yiming-skills.git
git branch -M main
git push -u origin main
```

Or use SSH:

```powershell
git remote add origin git@github.com:<your-github-user>/zhang-yiming-skills.git
git branch -M main
git push -u origin main
```

## After Push

Open the GitHub repository page and confirm these paths are visible:

- `skills/zhang-yiming/SKILL.md`
- `skills/zhang-yiming/PLAYBOOK.md`
- `.agents/skills/zhang-yiming.md`
- `scripts/install.ps1`
- `scripts/validate.py`

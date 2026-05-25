from __future__ import annotations

import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SKILLS = ROOT / "skills"
NAME_RE = re.compile(r"^[a-z0-9-]{1,64}$")
PHONE_RE = re.compile(r"(?<!\d)1[3-9]\d{9}(?!\d)")
BANNED = ["30_Library", "Obsidian", "attachments/", "原文：", "电话", "联系方式", "微信号"]
REQUIRED = ["README.md", "PRINCIPLES.md", "AGENTS.md", "EVALUATION.md", "SOURCE_POLICY.md"]


def parse_frontmatter(text: str, path: Path) -> dict[str, str]:
    if not text.startswith("---\n"):
        raise ValueError(f"{path}: missing opening frontmatter")
    end = text.find("\n---\n", 4)
    if end == -1:
        raise ValueError(f"{path}: missing closing frontmatter")
    data: dict[str, str] = {}
    for line in text[4:end].splitlines():
        if not line.strip():
            continue
        if ":" not in line:
            raise ValueError(f"{path}: invalid frontmatter line {line!r}")
        key, value = line.split(":", 1)
        data[key.strip()] = value.strip().strip('"').strip("'")
    return data


def main() -> int:
    errors: list[str] = []
    for rel in REQUIRED:
        if not (ROOT / rel).is_file():
            errors.append(f"Missing required file: {rel}")

    skill_files = sorted(SKILLS.glob("*/SKILL.md"))
    if len(skill_files) != 1:
        errors.append(f"Expected exactly one skill; found {len(skill_files)}")

    for path in skill_files:
        text = path.read_text(encoding="utf-8")
        try:
            meta = parse_frontmatter(text, path)
        except ValueError as exc:
            errors.append(str(exc))
            continue
        name = meta.get("name", "")
        desc = meta.get("description", "")
        if not NAME_RE.match(name):
            errors.append(f"{path}: invalid name {name!r}")
        if path.parent.name != name:
            errors.append(f"{path}: folder name does not match name {name!r}")
        if not desc or len(desc) > 1024:
            errors.append(f"{path}: missing or too-long description")
        for required in ["## Failure Modes", "## Self-Test"]:
            if required not in text:
                errors.append(f"{path}: missing {required}")
        playbook = path.parent / "PLAYBOOK.md"
        if not playbook.is_file():
            errors.append(f"{playbook}: missing")
        elif "## Edge Cases" not in playbook.read_text(encoding="utf-8"):
            errors.append(f"{playbook}: missing Edge Cases")

    for md in sorted(ROOT.rglob("*.md")):
        text = md.read_text(encoding="utf-8", errors="ignore")
        for banned in BANNED:
            if banned in text:
                errors.append(f"{md}: banned marker {banned!r}")
        if PHONE_RE.search(text):
            errors.append(f"{md}: possible phone number")

    if errors:
        print("Validation failed:")
        for error in errors:
            print(f"- {error}")
        return 1
    print(f"Validation passed: {len(skill_files)} skill checked.")
    return 0


if __name__ == "__main__":
    sys.exit(main())

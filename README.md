# Robot Framework Python Skill

Production-ready skill for generating, reviewing, and refactoring **Robot Framework** tests in Python-centric projects.

This repository is a standalone `SKILL.md` package that can be installed via the Skills CLI and used with coding agents.

---

## Why this skill?

This skill helps teams create reliable Robot Framework automation faster, with strong structure and reduced hallucination risk.

- ✅ Valid `.robot` suites and `.resource` files
- ✅ API testing workflows with `RequestsLibrary`
- ✅ Reusable keyword design for maintainable suites
- ✅ Python custom keyword libraries (module + class styles)
- ✅ Deterministic assertions and anti-hallucination guardrails

---

## Install

```bash
npx skills add https://github.com/arvind3/robot-framework-py-skill --skill robot-framework-py
```

---

## Explore the solution

- **Product showcase** (what the skill does, value proposition, and usage examples):
  [https://arvind3.github.io/robot-framework-py-skill/](https://arvind3.github.io/robot-framework-py-skill/)
- **Engineering blog** (how it was built with a Microsoft-aligned skill framework, automated tests, and a RALF optimization loop):
  [https://arvind3.github.io/robot-framework-py-skill/engineering-blog.html](https://arvind3.github.io/robot-framework-py-skill/engineering-blog.html)

---

## Quick usage prompts

Use prompts like these in your coding assistant:

- `Create a Robot Framework smoke suite for a health endpoint.`
- `Refactor this suite by moving repeated steps into resources/common.resource.`
- `Write a Python keyword library with Normalize Text and Is Even Number.`
- `In GitHub Copilot Chat, generate a Robot suite for checkout API smoke tests with reusable resource keywords.`

---

## Repository layout

```text
SKILL.md
references/
  acceptance-criteria.md
examples/
  health-check.robot
  math_keywords.py
tests/scenarios/robot-framework-py/
  scenarios.yaml
```

---

## Local validation

```bash
# From this repository root
npx skills add . --skill robot-framework-py --yes --agent codex
```

---

## Compatibility

- Skills CLI
- Codex and other agent runtimes that support `SKILL.md`-based packages

---

## License

MIT

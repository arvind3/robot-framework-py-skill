# Robot Framework Python Skill

Production-ready agent skill for generating and refactoring Robot Framework tests in Python-centric projects.

This repository is a standalone skill package that can be installed through the Skills CLI and used with coding agents.

## Install

```bash
npx skills add https://github.com/arvind3/robot-framework-py-skill --skill robot-framework-py
```

## Explore The Solution

- Product showcase (what the skill does, value, and concrete usage examples):  
  `https://arvind3.github.io/robot-framework-py-skill/`
- Engineering blog (how it was built with Microsoft-aligned skill framework, automated tests, and RALF optimization loop):  
  `https://arvind3.github.io/robot-framework-py-skill/engineering-blog.html`

## What This Skill Covers

- Authoring valid `.robot` suites and `.resource` files
- API testing flows with `RequestsLibrary`
- Reusable keyword design and suite structure
- Python custom keyword libraries (module and class style)
- Deterministic assertions and anti-hallucination guardrails

## Quick Usage Prompts

- `Create a Robot Framework smoke suite for a health endpoint.`
- `Refactor this suite by moving repeated steps into resources/common.resource.`
- `Write a Python keyword library with Normalize Text and Is Even Number.`
- `In GitHub Copilot Chat, generate a Robot suite for checkout API smoke tests with reusable resource keywords.`

## Repository Layout

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

## Local Validation

```bash
# From this repository root
npx skills add . --skill robot-framework-py --yes --agent codex
```

## Compatibility

- Skills CLI
- Codex and other agent runtimes that support SKILL.md-based packages

## License

MIT

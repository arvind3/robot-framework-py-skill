# Robot Framework Python Skill

Production-ready skill for generating, reviewing, and refactoring **Robot Framework** automation across five enterprise libraries:

- SeleniumLibrary
- RequestsLibrary
- Browser Library (Playwright)
- AppiumLibrary
- DatabaseLibrary

## What is included

- Updated `SKILL.md` with golden patterns, setup guidance, pitfalls, and do/don'ts for each library.
- Example suites for each library with:
  - minimal smoke flow
  - enterprise-style flow
  - reusable resource + variable pattern
- Scenario-driven quality checks and acceptance criteria aligned to Microsoft-style test strategy.
- RALF (Review–Analyze–Learn–Fix) notes documenting improvement loop outcomes.

## Repository layout

```text
SKILL.md
CHANGELOG.md
references/
  acceptance-criteria.md
.github/skills/robot-framework-py/references/
  acceptance-criteria.md
examples/
  selenium/
  requests/
  browser/
  appium/
  database/
tests/
  scenarios/robot-framework-py/scenarios.yaml
  quality/test_skill_quality.py
.github/workflows/ci.yml
```

## PR test plan (thorough coverage)

Each PR should satisfy these planned checks:

- **Scenario coverage:** 7 scenarios total
  - basic usage
  - error handling
  - advanced features
  - mock responses for CI
- **Quality unit tests:** 4 tests total
- **Total planned checks per PR:** **11**


## Quality process policy (applies to every future change)

This repository enforces a high-stakes quality process on every PR:

- Acceptance criteria must be maintained at:
  - `.github/skills/robot-framework-py/references/acceptance-criteria.md`
  - `references/acceptance-criteria.md` (synchronized copy)
- Scenario coverage must be maintained in `tests/scenarios/robot-framework-py/scenarios.yaml`.
- PRs must include test evidence for:
  - `python -m unittest tests.quality.test_skill_quality -v`
  - `cd tests && pnpm harness robot-framework-py --mock --verbose`
  - `cd tests && pnpm harness robot-framework-py --ralph --mock --max-iterations 5 --threshold 85`

The PR template (`.github/pull_request_template.md`) and quality tests enforce this policy.

## Run quality checks

```bash
python -m unittest tests.quality.test_skill_quality -v
```

## Run scenario harness (when harness tooling is available)

```bash
cd tests && pnpm harness robot-framework-py --mock --verbose
```

## Run Robot examples (library specific)

> Install dependencies first for the libraries you want to execute.

```bash
# SeleniumLibrary
pip install robotframework robotframework-seleniumlibrary
robot examples/selenium/smoke.robot

# RequestsLibrary
pip install robotframework robotframework-requests
robot examples/requests/smoke.robot

# Browser Library (Playwright)
pip install robotframework robotframework-browser
rfbrowser init
robot examples/browser/smoke.robot

# AppiumLibrary
pip install robotframework robotframework-appiumlibrary
robot examples/appium/smoke.robot

# DatabaseLibrary
pip install robotframework robotframework-databaselibrary
robot examples/database/smoke.robot
```

## Microsoft-style quality strategy

This repository follows an engineering loop that mirrors Microsoft-style skill validation:

1. **Understand + Plan**: map prompts to expected and forbidden patterns.
2. **Build**: encode reusable resource-driven examples.
3. **Validate**: run scenario and quality checks in CI.
4. **Iterate**: execute RALF loop updates and lock in guidance.

## Explore docs

- Product showcase: https://arvind3.github.io/robot-framework-py-skill/
- Engineering blog: https://arvind3.github.io/robot-framework-py-skill/engineering-blog.html

## License

MIT

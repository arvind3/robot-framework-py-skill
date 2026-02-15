# Changelog

## 2026-02-15

### Added
- Expanded top-5 Robot Framework library guidance in `SKILL.md`.
- Added per-library smoke + enterprise + reusable resource examples under `examples/`.
- Added quality tests for scenario coverage and guardrails.
- Added GitHub Actions CI workflow for deterministic checks.

### RALF Notes
- **Review**: existing repo focused mostly on RequestsLibrary and lacked first-class Selenium/Browser/Appium/Database patterns.
- **Analyze**: key gaps were inconsistent setup guidance, missing guardrails, and no per-library scenario validations.
- **Learn**: teams need concise golden patterns (setup, pitfalls, do/don't, examples) to avoid flaky or non-portable tests.
- **Fix**: refactored skill guidance, added reusable resource-based examples per library, and introduced quality checks + CI automation.

## 2026-02-16

### Added
- Added skill-process-compatible acceptance criteria path at `.github/skills/robot-framework-py/references/acceptance-criteria.md`.
- Expanded acceptance criteria with correct/incorrect import patterns, authentication patterns, and async variant guidance.
- Expanded scenarios to include basic usage, error handling, and advanced-feature coverage with mock responses.
- Added explicit PR test plan counts to README.

## 2026-02-17

### Added
- Added enforced PR checklist template at `.github/pull_request_template.md` to require acceptance-criteria, scenario, and harness evidence for every change.
- Updated acceptance criteria with explicit A/B/C/D high-stakes categories and required scenario-mix rules.
- Reworked scenarios to include the required enterprise mix (hello world, API auth GET/POST, resource refactor, Python keywords, OperatingSystem, and scale patterns).
- Extended quality tests to verify mandatory scenario names, acceptance-criteria categories, and process-enforcement artifacts.

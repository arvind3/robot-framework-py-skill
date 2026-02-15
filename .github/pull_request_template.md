## Summary
- Describe what changed and why.

## Quality Process Checklist (required for every change)
- [ ] Updated `.github/skills/robot-framework-py/references/acceptance-criteria.md` when behavior/rules changed.
- [ ] Kept `references/acceptance-criteria.md` synchronized with the skill-path acceptance criteria.
- [ ] Updated `tests/scenarios/robot-framework-py/scenarios.yaml` when guidance/patterns changed.
- [ ] Ensured scenarios include deterministic `expected_patterns`, `forbidden_patterns`, and `mock_response`.
- [ ] Confirmed scenario mix includes:
  - Hello world smoke
  - RequestsLibrary auth GET/POST
  - Resource refactor to `resources/common.resource`
  - Python keyword library (module + class style)
  - OperatingSystem usage
  - Scale patterns (tags/variables/suite setup/teardown)

## Validation run for this PR
- [ ] `python -m unittest tests.quality.test_skill_quality -v`
- [ ] `cd tests && pnpm harness robot-framework-py --mock --verbose`
- [ ] `cd tests && pnpm harness robot-framework-py --ralph --mock --max-iterations 5 --threshold 85`

> If harness commands cannot run in the environment, include exact failure output and remediation steps.

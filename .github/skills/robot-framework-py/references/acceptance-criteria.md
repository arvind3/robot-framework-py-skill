# Acceptance Criteria: robot-framework-py

## Process alignment

This repository keeps acceptance criteria in two locations for compatibility:
- Canonical repo reference: `references/acceptance-criteria.md`
- Skill-package reference path: `.github/skills/robot-framework-py/references/acceptance-criteria.md`

Both files must stay synchronized.

## 6) Acceptance criteria (high-stakes-safe)

### A) Correct Robot Framework syntax

**Required**
- Must output valid Robot sections when relevant:
  - `*** Settings ***`
  - `*** Variables ***`
  - `*** Test Cases ***`
  - `*** Keywords ***`
- Must use `.resource` format when resource output is requested.
- Must use BuiltIn assertion keywords (`Should Be Equal`, `Should Contain`, `Should Be True`, `Should Not Be Empty`).

**Forbidden**
- `*** Setting ***`
- `*** TestCase ***`
- Invented assertion styles or raw Python assertions in `.robot` output.

### B) Library correctness

**Required**
- If user asks for API testing, prefer RequestsLibrary patterns and mention install command:
  - `pip install robotframework-requests`
- If user asks for OS/file operations, prefer OperatingSystem keywords.
- Library imports must be explicit in `*** Settings ***`.

**Forbidden**
- `import requests` style Python imports inside Robot suites.
- Shell snippets as a substitute for OperatingSystem keywords in Robot suites.

### C) Scalability practices

**Required**
- Promote resource files for reusable keywords.
- Enforce consistent tagging strategy (`smoke`, `regression`, `api`, etc.).
- Avoid hard-coded secrets and use variables/environment patterns.
- Use suite setup/teardown for shared lifecycle steps.

**Forbidden**
- Repeating setup/auth boilerplate in every test case.
- Inline credentials (`password=`, `secret=`, fixed bearer tokens).

### D) Do-not-hallucinate constraints

**Required**
- If keyword/library is not in Standard Library or explicitly chosen, label it as optional external.
- Use known Robot Framework library keywords only.

**Forbidden**
- Presenting unknown or fabricated keywords as built-in.
- Claiming external library keywords are Standard Library keywords.

## Correct/incorrect import patterns

### Correct
- `Library    RequestsLibrary`
- `Library    SeleniumLibrary`
- `Library    Browser`
- `Library    AppiumLibrary`
- `Library    DatabaseLibrary`
- `Library    OperatingSystem`
- `Resource    ../resources/common.resource`

### Incorrect
- `import requests` in `.robot` files
- `Library    requests`
- Mixing Browser + Selenium imports in a single minimal smoke path

## Authentication patterns

### Required patterns
- Build auth headers/tokens in reusable resource keywords.
- Read secrets from variables/environment, not inline literals.
- Validate both positive and negative auth outcomes (e.g., 200 and 401/403).

### Forbidden patterns
- Inline static credentials in test body (`password=...`, `token=...`).
- Repeating authentication setup in every test case.

## Async variants

### Required patterns
- Use bounded waits/timeouts for async behavior.
- Browser async keywords (for example `Promise To`, `Wait For Response`) should be wrapped in reusable keywords in enterprise examples.
- Eventual consistency flows use finite retry/poll logic.

### Forbidden patterns
- Unbounded waits.
- Arbitrary static waits (`Sleep    10`+) for synchronization.

## Scenario quality requirements

### Required
- `tests/scenarios/robot-framework-py/scenarios.yaml` must include these scenario categories:
  1. Hello world suite (smoke)
  2. API test suite (RequestsLibrary): auth, GET/POST, status + JSON checks
  3. Resource refactor scenario to `resources/common.resource`
  4. Python keyword library generation (module + class styles)
  5. OperatingSystem usage (env var + file check)
  6. Scale patterns (tags, variables, suite setup/teardown)
- Every scenario must include:
  - `expected_patterns`
  - `forbidden_patterns`
  - `mock_response`

### Forbidden
- Scenarios without deterministic assertions.
- Scenarios depending on flaky live internet behavior by default.

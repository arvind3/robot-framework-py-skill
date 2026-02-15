import pathlib
import unittest

ROOT = pathlib.Path(__file__).resolve().parents[2]

REQUIRED_SCENARIOS = [
    "hello-world-smoke-suite",
    "api-test-suite-requestslibrary-auth-get-post",
    "resource-file-refactor-common-resource",
    "python-keyword-library-module-and-class-style",
    "standard-library-usage-operatingsystem",
    "scale-patterns-tags-variables-suite-setup",
]


class SkillQualityTests(unittest.TestCase):
    def test_skill_mentions_top5_libraries(self):
        content = (ROOT / "SKILL.md").read_text(encoding="utf-8")
        for marker in [
            "SeleniumLibrary",
            "RequestsLibrary",
            "Browser Library",
            "AppiumLibrary",
            "DatabaseLibrary",
            "Microsoft-style testing strategy",
            "RALF",
        ]:
            self.assertIn(marker, content)

    def test_scenarios_cover_required_enterprise_mix(self):
        content = (ROOT / "tests/scenarios/robot-framework-py/scenarios.yaml").read_text(encoding="utf-8")
        for scenario in REQUIRED_SCENARIOS:
            self.assertIn(scenario, content)
        for marker in ["basic-usage", "advanced-feature", "ralf", "mock_response:"]:
            self.assertIn(marker, content)
        self.assertGreaterEqual(content.count("expected_patterns:"), 7)
        self.assertGreaterEqual(content.count("forbidden_patterns:"), 7)

    def test_examples_include_smoke_enterprise_and_resources(self):
        libraries = ["selenium", "requests", "browser", "appium", "database"]
        for lib in libraries:
            base = ROOT / "examples" / lib
            self.assertTrue((base / "smoke.robot").exists(), f"missing {lib} smoke")
            self.assertTrue((base / "enterprise.robot").exists(), f"missing {lib} enterprise")
            self.assertTrue((base / "resources").exists(), f"missing {lib} resources dir")
            self.assertTrue((base / "variables" / "env.py").exists(), f"missing {lib} variables")

    def test_acceptance_criteria_exists_and_has_mandatory_sections(self):
        canonical = ROOT / "references" / "acceptance-criteria.md"
        skill_path = ROOT / ".github" / "skills" / "robot-framework-py" / "references" / "acceptance-criteria.md"
        self.assertTrue(canonical.exists())
        self.assertTrue(skill_path.exists())

        for file_path in [canonical, skill_path]:
            text = file_path.read_text(encoding="utf-8")
            for marker in [
                "A) Correct Robot Framework syntax",
                "B) Library correctness",
                "C) Scalability practices",
                "D) Do-not-hallucinate constraints",
                "Correct/incorrect import patterns",
                "Authentication patterns",
                "Async variants",
            ]:
                self.assertIn(marker, text)

    def test_process_enforcement_docs_exist(self):
        self.assertTrue((ROOT / ".github" / "pull_request_template.md").exists())


if __name__ == "__main__":
    unittest.main()

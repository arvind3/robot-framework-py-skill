*** Settings ***
Documentation    Enterprise UI check with reusable page actions and deterministic selectors.
Resource         resources/ui.resource
Variables        variables/env.py
Suite Setup      Open Smoke Page    ${SMOKE_PAGE_URL}
Suite Teardown   Close UI Session

*** Test Cases ***
Selenium Enterprise Navigation
    [Tags]    enterprise    ui    selenium
    Assert Smoke Header
    Wait Until Element Is Visible    id:continue    timeout=5s
    Click Element    id:continue

*** Settings ***
Resource      resources/ui.resource
Variables     variables/env.py
Test Teardown    Close UI Session

*** Test Cases ***
Selenium Local Smoke
    [Tags]    smoke    ui    selenium
    Open Smoke Page    ${SMOKE_PAGE_URL}
    Assert Smoke Header

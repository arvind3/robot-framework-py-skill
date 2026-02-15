*** Settings ***
Resource      resources/browser.resource
Suite Setup   Start Browser Session
Suite Teardown    Close Browser Session

*** Test Cases ***
Browser Library Smoke
    [Tags]    smoke    ui    browser
    Open Inline Test Page
    Assert Browser Header

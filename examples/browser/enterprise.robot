*** Settings ***
Documentation    Enterprise Browser library example with reusable startup and assertion keywords.
Resource         resources/browser.resource
Suite Setup      Start Browser Session
Suite Teardown   Close Browser Session

*** Test Cases ***
Browser Enterprise Flow
    [Tags]    enterprise    ui    browser
    Open Inline Test Page
    Click    text=Submit
    Assert Browser Header

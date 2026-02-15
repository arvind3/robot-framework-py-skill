*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome

*** Keywords ***
Open Smoke Page
    [Arguments]    ${page_url}
    Open Browser    ${page_url}    ${BROWSER}
    Maximize Browser Window

Assert Smoke Header
    Wait Until Page Contains Element    css:h1[data-testid="title"]    timeout=5s
    Element Text Should Be    css:h1[data-testid="title"]    Robot Smoke Portal

Close UI Session
    Close Browser

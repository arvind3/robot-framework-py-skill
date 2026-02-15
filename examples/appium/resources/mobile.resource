*** Settings ***
Library    AppiumLibrary

*** Keywords ***
Open Mobile Session
    [Arguments]    ${server_url}    &{caps}
    Open Application    ${server_url}    &{caps}

Assert Landing Screen
    [Arguments]    ${expected_text}
    Wait Until Page Contains    ${expected_text}    10s

Close Mobile Session
    Close Application

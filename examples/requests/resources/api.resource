*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${SESSION_ALIAS}    enterprise_api

*** Keywords ***
Open API Session
    [Arguments]    ${base_url}
    Create Session    ${SESSION_ALIAS}    ${base_url}

Build Default Headers
    ${headers}=    Create Dictionary    Content-Type=application/json    Accept=application/json
    RETURN    ${headers}

Get Health Payload
    ${response}=    GET On Session    ${SESSION_ALIAS}    /health
    Should Be Equal As Integers    ${response.status_code}    200
    RETURN    ${response.json()}

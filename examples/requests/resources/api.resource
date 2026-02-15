*** Settings ***
Library    Collections
Library    OperatingSystem
Library    RequestsLibrary

*** Variables ***
${SESSION_ALIAS}    enterprise_api

*** Keywords ***
Open API Session
    [Arguments]    ${base_url}
    Create Session    ${SESSION_ALIAS}    ${base_url}

Close API Session
    Delete All Sessions

Build Default Headers
    [Arguments]    ${api_token}=${EMPTY}
    ${headers}=    Create Dictionary    Content-Type=application/json    Accept=application/json
    IF    '${api_token}' != ''
        Set To Dictionary    ${headers}    Authorization=Bearer ${api_token}
    END
    RETURN    ${headers}

Get Required API Token
    [Arguments]    ${fallback_token}=${EMPTY}
    ${token}=    Set Variable    ${fallback_token}
    IF    '${token}' == ''
        ${token}=    Get Environment Variable    RF_API_TOKEN
    END
    Should Not Be Empty    ${token}    msg=Set RF_API_TOKEN in the environment or variables/env.py
    RETURN    ${token}

Get Health Payload
    ${response}=    GET On Session    ${SESSION_ALIAS}    /health
    Should Be Equal As Integers    ${response.status_code}    200
    ${payload}=    Set Variable    ${response.json()}
    Should Contain    ${payload}    status
    RETURN    ${payload}

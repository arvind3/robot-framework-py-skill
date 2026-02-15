*** Settings ***
Resource    resources/api.resource
Variables   variables/env.py

*** Test Cases ***
Requests Smoke Health
    [Tags]    smoke    api    requestslibrary
    Open API Session    ${BASE_URL}
    ${payload}=    Get Health Payload
    Should Be Equal    ${payload}[status]    UP

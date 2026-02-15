*** Settings ***
Resource    resources/api.resource
Variables   variables/env.py
Suite Setup    Open API Session    ${BASE_URL}
Suite Teardown    Close API Session

*** Test Cases ***
Requests Smoke Health
    [Tags]    smoke    api    requestslibrary
    ${payload}=    Get Health Payload
    Should Be Equal    ${payload}[status]    UP

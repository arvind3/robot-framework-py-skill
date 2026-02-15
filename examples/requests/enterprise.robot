*** Settings ***
Documentation    Enterprise-style API suite with shared setup, secure auth headers, and reusable request metadata.
Resource         resources/api.resource
Variables        variables/env.py
Suite Setup      Open API Session    ${BASE_URL}
Suite Teardown   Close API Session

*** Test Cases ***
Create Order Contract Check
    [Tags]    enterprise    api    requestslibrary    regression
    ${token}=    Get Required API Token    ${API_TOKEN}
    ${headers}=    Build Default Headers    ${token}
    ${body}=    Create Dictionary    sku=RF-101    quantity=3
    ${resp}=    POST On Session    ${SESSION_ALIAS}    /orders    json=${body}    headers=${headers}
    Should Be Equal As Integers    ${resp.status_code}    201
    ${json}=    Set Variable    ${resp.json()}
    Should Contain    ${json}    status
    Should Be Equal    ${json}[status]    CREATED

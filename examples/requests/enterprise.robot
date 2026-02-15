*** Settings ***
Documentation    Enterprise-style API suite with shared setup and reusable request metadata.
Resource         resources/api.resource
Variables        variables/env.py
Suite Setup      Open API Session    ${BASE_URL}

*** Test Cases ***
Create Order Contract Check
    [Tags]    enterprise    api    requestslibrary
    ${headers}=    Build Default Headers
    ${body}=    Create Dictionary    sku=RF-101    quantity=3
    ${resp}=    POST On Session    ${SESSION_ALIAS}    /orders    json=${body}    headers=${headers}
    Should Be Equal As Integers    ${resp.status_code}    201
    ${json}=    Set Variable    ${resp.json()}
    Should Be Equal    ${json}[status]    CREATED

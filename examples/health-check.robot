*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://api.example.com

*** Test Cases ***
Get Health Endpoint
    Create Session    api    ${BASE_URL}
    ${resp}=    GET On Session    api    /health
    Should Be Equal As Integers    ${resp.status_code}    200

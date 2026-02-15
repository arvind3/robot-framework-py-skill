*** Settings ***
Documentation    Enterprise data validation flow with reusable DatabaseLibrary keywords.
Resource         resources/db.resource
Variables        variables/env.py
Suite Setup      Connect To Local Database    ${DB_PATH}
Suite Teardown   Disconnect Local Database

*** Test Cases ***
Database Enterprise Order Snapshot
    [Tags]    enterprise    database
    ${rows}=    Query    SELECT COUNT(*) FROM orders WHERE status='CREATED'
    Should Be True    ${rows}[0][0] >= 1

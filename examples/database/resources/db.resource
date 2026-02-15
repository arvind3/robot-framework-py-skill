*** Settings ***
Library    DatabaseLibrary

*** Keywords ***
Connect To Local Database
    [Arguments]    ${db_path}
    Connect To Database    sqlite3    ${db_path}

Assert Service Health Is Up
    ${rows}=    Query    SELECT status FROM health_check LIMIT 1
    Should Be Equal    ${rows}[0][0]    UP

Disconnect Local Database
    Disconnect From Database

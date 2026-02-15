*** Settings ***
Resource      resources/db.resource
Variables     variables/env.py
Test Teardown    Disconnect Local Database

*** Test Cases ***
Database Smoke Query
    [Tags]    smoke    database
    Connect To Local Database    ${DB_PATH}
    Assert Service Health Is Up

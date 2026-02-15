*** Settings ***
Documentation    Enterprise mobile flow using reusable Appium session and screen assertions.
Resource         resources/mobile.resource
Variables        variables/env.py
Suite Setup      Open Mobile Session    ${SERVER_URL}    &{ANDROID_CAPS}
Suite Teardown   Close Mobile Session

*** Test Cases ***
Appium Enterprise Login View
    [Tags]    enterprise    mobile    appium    android
    Assert Landing Screen    Welcome
    Wait Until Page Contains Element    accessibility_id=login-button    15s

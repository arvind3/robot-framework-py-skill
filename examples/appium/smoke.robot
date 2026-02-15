*** Settings ***
Resource      resources/mobile.resource
Variables     variables/env.py
Test Teardown    Close Mobile Session

*** Test Cases ***
Appium Smoke Launch
    [Tags]    smoke    mobile    appium    android
    Open Mobile Session    ${SERVER_URL}    &{ANDROID_CAPS}
    Assert Landing Screen    Welcome

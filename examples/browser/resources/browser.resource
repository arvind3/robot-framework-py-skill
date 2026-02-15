*** Settings ***
Library    Browser

*** Keywords ***
Start Browser Session
    New Browser    chromium    headless=true
    New Context

Open Inline Test Page
    New Page    data:text/html,<html><body><h1 data-testid='title'>Browser Smoke</h1><button>Submit</button></body></html>

Assert Browser Header
    Get Text    css=[data-testid='title']    ==    Browser Smoke

Close Browser Session
    Close Browser

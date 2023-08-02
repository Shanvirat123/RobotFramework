*** Settings ***


Library    SeleniumLibrary


*** Keywords ***
Open Chrome in Incognito Mode and Login To Dispatcher
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --incognito
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    https://ultimateqa.com/dummy-automation-websites/
    Capture Page Screenshot    s1




Normal Brower
    Open Browser   https://www.google.com/     Chrome      options=add_argument("--ignore-certificate-errors")
    Maximize Browser Window
    Sleep    3s
    Click Element    (//*[text()='Gmail'])[1]
    Switch Browser    1



*** Test Cases ***
Login
  Normal Brower
  Open Chrome in Incognito Mode and Login To Dispatcher

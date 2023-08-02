*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library  ../../VaultConfig/VaultUtils.py
Variables           ../../Resources/WebElements.py
Variables        ../../Resources/Testdata.py
Resource    Keywords/CallTaker/CallTaker_Home_Page.robot

*** Variables ***
${browser}  chrome
${Timeout}       15s
${Calltaker_Screenshot_Path}   C://CADApplication_Robot/CADApplication/Screenshots

${currentDir}       Screenshots
${file_name}    Filename.csv


*** Keywords ***

User Navigate to Eventlog
    Wait Until Element Is Visible    ${CT_Eventlog}     ${Timeout}
    Mouse Over    ${CT_Eventlog}
    Click Element    ${CT_Eventlog}
    capture page screenshot     ${currentDir}/Eventlogpage.png
    Mouse Over    ${CT_Eventlog}
    Wait Until Element Is Visible  ${CT_verifyEventid}    ${Timeout}


Verify the Incident CFSID In Event details

    ${eventdetails}=    Set Variable    //*[text()='${cfs_id}']/..//t-button[@id='event-details']
    Wait Until Element Is Visible     ${eventdetails}         ${Timeout}
    Click Element   ${eventdetails}
    ${windows}=     Get Window Handles
    Log    ${windows}
    Switch Window       ${windows}[1]
    Log    ${windows}[1]
    Sleep    9s
    ${CT_EventLogEventidtext}=  Execute Javascript    ${CT_EventLogEventid}
    Wait Until Element Is Visible    ${CT_EventLogEventidtext}         ${Timeout}
    Should Contain Any    ${CT_EventLogEventidtext}   ${cfs_id}

Verify the Incident Attachment In Event details















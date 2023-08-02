*** Settings ***
Library    Excel_Sequential_Read.py
Library    SeleniumLibrary
Library  ../../VaultConfig/VaultUtils.py
Resource    ../../Keywords/CallTaker/CallTaker_Home_Page.robot

*** Test Cases ***
Login With Multiple Users
    ${file_path}=    Set Variable    C://Automation/NGCAD - Automation Plan.xlsx
    ${sheet_name}=    Set Variable    Credentials

    # Read data from the Excel file
    ${excel_data}=    Read Excel Data    ${file_path}    ${sheet_name}

    FOR    ${row_data}    IN    @{excel_data}
        ${username}=    Set Variable    ${row_data["Username"]}
        ${password}=    Set Variable    ${row_data["Password"]}

        Open Browser    ${ngcad_url}    chrome    options=add_argument("--ignore-certificate-errors")
        Maximize Browser Window
        Wait Until Page Contains Element    ${CAD_Dispatcher_Selection}    ${CAD_Dispatcher_Selection_Timeout}

        Select From List By Label    ${CAD_Dispatcher_Selection}    ${CallTakerRoletype}
        sleep    3
        Select From List By Value    ${CAD_Dispatcher_Workstation}    ${Cad_Workstation}
        Wait Until Page Contains Element    ${DisPUserNameField}    ${Timeout}
        Input Text    ${UserNameField}    ${username}
        Wait Until Page Contains Element    ${UserPasswordField}    ${Timeout}
        Input Text    ${UserPasswordField}    ${password}

        # Add other login steps here

        capture page screenshot    ${CURDIR}/Screenshots/CAD_${username}.png
        Wait Until Page Contains Element    ${CAD_Login}    ${Timeout}
        Click Button    ${CAD_Login}
        Wait Until Element Is Visible    ${CTCreateManualEvent}    ${Timeout}
        Title Should Be    ngcadapp

        # Add other steps after login if needed

        # Close the browser after each iteration
        Close Browser

    END







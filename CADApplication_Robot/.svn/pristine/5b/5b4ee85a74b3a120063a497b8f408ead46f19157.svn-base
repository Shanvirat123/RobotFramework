*** Settings ***
Library    ExcelLibrary.py

*** Test Cases ***
Fetch Data From Excel
    ${file_path}=    Set Variable    C://Automation/NGCAD - Automation Plan.xlsx
    ${sheet_name}=    Set Variable    Happy Flow
    ${row_number}=    Set Variable    2  # Change this value to the desired row number
    ${column_name}=    Set Variable    Scenario  # Change this value to the desired column name
    ${cell_data}=    Read Excel Data    ${file_path}    ${sheet_name}    ${row_number}    ${column_name}
    Log    Cell Data: ${cell_data}


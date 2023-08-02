*** Settings ***
Resource    ../../../Keywords/CallTaker/CallTaker_Home_Page.robot

Test Teardown    TearDown Lagout

*** Test Cases ***
Test Case 1 : Verify user is able to add Person Supplemental info
        [Tags]    AS-4213
        Given Login To Call taker Operartor
        When CT Verify CallTaker Home Page And Title
        Then CT Add Person Supplemental info

Test Case 2 : Verify user is able to add Vehicle Supplemental info
        [Tags]    AS-4217
        Given Login To Call taker Operartor
        When CT Verify CallTaker Home Page And Title
        Then CT Add Vehicle Supplemental info

Test Case 3 : Verify user is able to add Location Supplemental info
        [Tags]    AS-4223
        Given Login To Call taker Operartor
        When CT Verify CallTaker Home Page And Title
        Then CT Add Location Supplemental info

Test Case 4 : Verify user is able to add Other Supplemental info
        [Tags]    AS-4220
        Given Login To Call taker Operartor
        When CT Verify CallTaker Home Page And Title
        Then CT Add Other Supplemental info
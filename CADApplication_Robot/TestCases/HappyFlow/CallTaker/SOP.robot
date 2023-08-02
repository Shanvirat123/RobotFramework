*** Settings ***

Resource    ../../../Keywords/CallTaker/CallTaker_Home_Page.robot



*** Test Cases ***
Test Case 1:Verify user is able view SOP based on incident type
        [Tags]    HappyFLow
        Given Login To Call taker Operartor
        When CT Verify CallTaker Home Page And Title
        Then CT Create Manual Event With Number
        Then CT Fill Distress Form for Police agency
        And CT user verify SOP

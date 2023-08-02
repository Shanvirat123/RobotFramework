*** Settings ***

Resource    ../../../Keywords/CallTaker/CallTaker_Home_Page.robot



*** Test Cases ***
Test Case 1 : Verify user is able to view Related events
        [Tags]    HappyFLow
        Given Login To Call taker Operartor
        When CT Verify CallTaker Home Page And Title
        And CT Create Manual Event With Number
        Then CT user is able to view Related events



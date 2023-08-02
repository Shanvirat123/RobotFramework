*** Settings ***

Resource    ../../../Keywords/CallTaker/CallTaker_Home_Page.robot



*** Test Cases ***
Test Case 1 : Verify user is able to navigate Multiple Questionaries
        [Tags]    HappyFLow
        Given Login To Call taker Operartor
        When CT Verify CallTaker Home Page And Title
        Then CT Create Manual Event With Number
        Then CT Fill Distress Form for Police agency
        And CT DispatchEvent
        #And CT verify the Questionaries
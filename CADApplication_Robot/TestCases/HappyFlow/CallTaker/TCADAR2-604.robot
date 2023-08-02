*** Settings ***
Resource    ../../../Keywords/CallTaker/CallTaker_Home_Page.robot
Test Teardown    TearDown Lagout

*** Test Cases ***
Test Case 1 : Verify manual event creation with number
        [Tags]    AS-4182  smoke
        Given Login To Call taker Operartor
        When CT Verify CallTaker Home Page And Title
        Then CT Create Manual Event With Number

Test Case 2 : Verify manual event creation without number
        [Tags]    AS-4183  smoke
        Given Login To Call taker Operartor
        When CT Verify CallTaker Home Page And Title
        Then CT Create Manual Event Without Number

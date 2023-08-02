*** Settings ***

Resource    ../../../Keywords/CallTaker/CallTaker_Home_Page.robot

*** Test Cases ***
Testcase_One: Verify incident Dispatch to Dispatcher
            [Tags]    AS-4198
            Given Login To Call taker Operartor
            When CT Verify CallTaker Home Page And Title
            And CT Create Manual Event With Number
            When User Marks the Address from the Map
            Then address Should select Successfully

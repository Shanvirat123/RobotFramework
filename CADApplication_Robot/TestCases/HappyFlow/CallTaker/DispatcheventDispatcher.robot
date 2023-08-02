*** Settings ***

Resource    ../../../Keywords/CallTaker/CallTaker_Home_Page.robot

*** Test Cases ***
Testcase_One: Verify incident Dispatch to Dispatcher
            [Tags]    AS-4198
            Given Login To Call taker Operartor
            When CT Verify CallTaker Home Page And Title
            And CT Create Manual Event With Number
            Then CT Fill Distress Form for Police agency
            And Open Chrome in Incognito Mode and Login To Dispatcher
            And CT DispatchEvent with Alrady opened Dispatcher
            Then Verify the CFS Incident in Dispatcher
*** Settings ***

Resource    ../../../Keywords/CallTaker/CallTaker_Home_Page.robot
Resource    ../../../Keywords/CallTaker/EventLog_Page.robot

*** Test Cases ***
Testcase_One: Verify event details
            [Tags]    HappyFlow
            Given Login To Call taker Operartor
            When CT Verify CallTaker Home Page And Title
            And CT Create Manual Event With Number
            when CT Fill Distress Form for Police agency
            And CT Dispatch
            when user Navigate to Eventlog
            Then Verify the Incident CFSID In Event details


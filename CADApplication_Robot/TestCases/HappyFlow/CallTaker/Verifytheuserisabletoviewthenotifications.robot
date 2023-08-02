*** Settings ***

Resource    ../../../Keywords/CallTaker/CallTaker_Home_Page.robot

*** Test Cases ***
Testcase_One: Verify user is able to do Multiple dispatch
            [Tags]    AS-4198
            Given Login To Call taker Operartor
            When CT Verify CallTaker Home Page And Title
            And CT Create Manual Event With Number
            Then CT Fill Distress Form for Police agency
            And CT DispatchEvent
            Then CT SelectMultiple Dispatch

Testcase_two:Verify user is able to clear all the selected dispatcher
            Given Login To Call taker Operartor
            When CT Verify CallTaker Home Page And Title
            And CT Create Manual Event With Number
            Then CT Fill Distress Form for Police agency
            And CT DispatchEvent with Alrady opened Dispatcher
            Then CT all th selectedDispatcher Should clear






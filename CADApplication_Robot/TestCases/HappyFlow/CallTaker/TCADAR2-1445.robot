*** Settings ***

Resource    ../../../Keywords/CallTaker/CallTaker_Home_Page.robot

*** Test Cases ***
Testcase 1: Verify user is able to Edit ANI
            [Tags]    AS-4209
            Given Login To Call taker Operartor
            When CT Verify CallTaker Home Page And Title
            And CT Create Manual Event With Number
            And CT Update ANI info from the ANI/ALI section
            Then Verify the Toaster Ani Updated Successfully toaster
            And Verify Caller Number in Ani section

Testcase 2: Verify user is able Update ANI details to distress form
            [Tags]    AS-4211
            Given Login To Call taker Operartor
            When CT Verify CallTaker Home Page And Title
            And CT Create Manual Event With Number
            Then CT Update ANI info from the ANI/ALI section
            And Copy the ANI information to DistressInformation

Testcase 3: Verify user is able to Block contact
            [Tags]    AS-4224
            Given Login To Call taker Operartor
            When CT Verify CallTaker Home Page And Title
            And CT Create Manual Event With Number
            And CT Block ANI Number
            ### Toaster validation Missing in Application













*** Variables ***
@{LIST} =    foo    baz

*** Test Cases ***
Example
    ${index} =    Find Index    baz    @{LIST}
    Should Be Equal    ${index}    ${1}
    ${index} =    Find Index    non existing    @{LIST}
    Should Be Equal    ${index}    ${-1}

*** Keywords ***
Find Index
   [Arguments]    ${element}    @{items}
   ${index} =    Set Variable    ${0}
   FOR    ${item}    IN    @{items}
       Run Keyword If    '${item}' == '${element}'    Return From Keyword    ${index}
       ${index} =    Set Variable    ${index + 1}
   END
   Return From Keyword    ${-1}
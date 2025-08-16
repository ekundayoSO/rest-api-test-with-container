
*** Settings ***
Library           RequestsLibrary
Library           Collections

Suite Setup       Create Session    rest    http://rest-server-container:5000

*** Test Cases ***
Get Item By Name
    [Tags]    GET
    ${resp}=    Get On Session    rest    /items
    Should Be Equal As Integers    ${resp.status_code}    200

    ${items}=    Call Method    ${resp}    json
    ${first_item}=    Get From List    ${items}    0
    ${item_name}=    Get From Dictionary    ${first_item}    name
    Log To Console    First item extracted: ${item_name}

    ${resp_item}=    Get On Session    rest    /items/${item_name}
    Should Be Equal As Integers    ${resp_item.status_code}    200

    ${resp_item_json}=    Call Method    ${resp_item}    json
    ${resp_item_name}=    Get From Dictionary    ${resp_item_json}    name
    Log To Console    Item fetched from API: ${resp_item_name}

    Should Be Equal    ${resp_item_name}    ${item_name}

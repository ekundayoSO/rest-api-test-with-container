*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections

Suite Setup       Create Session    rest    http://rest-server-container:5000

*** Test Cases ***
Delete First Available Item
    [Tags]    DELETE
    ${resp}=    Get On Session    rest    /items
    Should Be Equal As Integers    ${resp.status_code}    200

    ${items}=    Call Method    ${resp}    json
    ${first_item}=    Get From List    ${items}    0
    ${item_name}=     Get From Dictionary    ${first_item}    name

    # Add this line to debug the value of ${item_name}
    Log To Console    The value of item_name is: ${item_name}

    ${del_resp}=    Delete On Session    rest    /items/${item_name}
    Should Be Equal As Integers    ${del_resp.status_code}    204
    Log To Console    Item deleted: ${item_name}

*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections
Library           DateTime

Suite Setup       Create Session    rest    http://rest-server-container:5000

*** Variables ***
# ${SERVER_URL}    http://rest-server-container:5000
${ITEM_NAME_BASE}     item
${ITEM_EMAIL}         test@ssh.com

*** Test Cases ***
Add New Item With Dynamic Name
    [Tags]    POST
    # Get the current timestamp and format it as a string
    ${timestamp}=    Get Current Date    result_format=%S
    # Combine the base name with the timestamp to make it unique
    ${dynamic_item_name}=    Catenate    SEPARATOR=_    ${ITEM_NAME_BASE}    ${timestamp}

    ${data}=    Create Dictionary    name=${dynamic_item_name}    email=${ITEM_EMAIL}
    ${resp}=    POST On Session    rest    /items/    json=${data}
    Should Be Equal As Integers    ${resp.status_code}    201
    Should Be Equal    ${resp.json()['name']}    ${dynamic_item_name}
    # Store the dynamic name for potential use in subsequent tests
    Set Suite Variable    ${ITEM_NAME}    ${dynamic_item_name}
    Log To Console    Item added: ${dynamic_item_name}

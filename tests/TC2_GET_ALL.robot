*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections

Suite Setup       Create Session    rest    http://rest-server-container:5000

*** Variables ***
# ${SERVER_URL}     ${SERVER_URL}
${ITEM_NAME}      item_0
${ITEM_EMAIL}     test@ssh.com

*** Test Cases ***
List All Items
    [Tags]    GET
    ${resp}=    Get on Session    rest    /items/
    Should Be Equal As Integers    ${resp.status_code}    200
    Should Not Be Empty    ${resp.json()[0]['name']}
    Log To Console    ${resp.json()}



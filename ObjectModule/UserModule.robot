*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Resource    ../Resources/Environment.resource


*** Keywords ***

Login by Normal user
    [Arguments]    ${Normal_Username}    ${Normal_Password}
## Get the access token
    Create Session  Normal_Login  ${Normal_host} 
    ${data}=    Evaluate    {'Username': (None, '${Normal_Username}'), 'Password': (None, '${Normal_Password}')}
    ${response}=   Post Request    Normal_Login  ${Normallogin_serviceName}    files=${data}   
    ##Log To Console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
 ## Set the access token as a session header to be set automatically with all the coming requests using the same alias (restfulBooker)
    ${token}=    Set Variable    ${response.json()}[data]
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${headers}=    Create dictionary    Content-Type=application/json    Authorization=Bearer ${token}   
    Create Session    Normal_User   ${Normal_host}    headers=${headers}
    ##Log To Console    ${token}
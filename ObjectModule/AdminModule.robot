*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Resource    ../Resources/Environment.resource


*** Keywords ***

Login by Admin user
    [Arguments]    ${Admin.Username}    ${Admin.Password}
## Get the access token
    Create Session  Admin_Login  ${host} 
    ${data}=    Evaluate    {'Username': (None, '${Admin.Username}'), 'Password': (None, '${Admin.Password}')}
    ${response}=   Post Request    Admin_Login  ${Adminlogin_serviceName}    files=${data}   
    ##Log To Console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
 ## Set the access token as a session header to be set automatically with all the coming requests using the same alias (restfulBooker)
    ${token}=    Set Variable    ${response.json()}[Token]
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${headers}=    Create dictionary    Content-Type=application/json    Authorization=Bearer ${token}   
    Create Session    Admin_User   ${host}    headers=${headers}
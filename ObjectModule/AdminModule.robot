*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Resource   ../Configuration/Resources/Environment.resource


*** Keywords ***


Login by Admin user
    [Arguments]    ${Admin_Username}      ${Admin_Password}
    Create Session  Admin_Login  ${Admin_host} 
    ${data}=    Evaluate    {'Username': (None, '${Admin_Username}'), 'Password': (None, '${Admin_Password}')}
    ${response}=   Post Request    Admin_Login  ${Adminlogin_serviceName}     files=${data}  
     ##Log To Console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
 ## Set the access token as a session header to be set automatically with all the coming requests using the same alias (restfulBooker)
    ${token}=    Set Variable    ${response.json()}[Token]
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${headers}=    Create dictionary    Content-Type=application/json    Authorization=Bearer ${token}   
    Create Session    Admin_User   ${Admin_host}    headers=${headers}
    ##Log To Console     The token value is : ${token}


Get list of users
    ${response}=    Post Request    Admin_User  ${get_Users}
     Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}



Get Inactive list of users
    ${response}=    Post Request    Admin_User  ${Inactive}
     Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}
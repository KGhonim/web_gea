*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Resource    ../Resources/Environment.resource


*** Keywords ***



User Login
    [Arguments]    ${Username}    ${Password}
## Get the access token
    Create Session  Login  ${host} 
    ${data}=    Evaluate    {'Username': (None, '${Username}'), 'Password': (None, '${Password}')}
    ${response}=   Post Request    Login  ${login_serviceName}    files=${data}   
    Log To Console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
 ## Set the access token as a session header to be set automatically with all the coming requests using the same alias (restfulBooker)
    ${token}=    Set Variable    ${response.json()}[Token]
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${headers}=    Create dictionary    Content-Type=application/json    Authorization=Bearer ${token}   
    Create Session    ConfigUser   ${host}    headers=${headers}
    Log To Console    ${token}

    
Active Directory Connect
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   ConfigUser   ${AD_serviceName}     json=${data}
   Log To Console  ${response.content}
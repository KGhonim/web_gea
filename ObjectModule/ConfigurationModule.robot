*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Resource    ../Resources/Environment.resource


*** Keywords ***

User Login
    [Arguments]    ${Username}    ${Password}
    ## Get the access token
    ${jsonBody}=    Create dictionary    username=${Username}    Password=${Password} 
    ${authHeaders}=    Create Dictionary    Content-Type=multipart/form-data
    ${response}=    POST    ${Config_BaseURL}${login_serviceName}    headers=${authHeaders}    json=${jsonBody}
    ${accessToken}=    Set Variable    ${response.json()}[token]

    ## Set the access token as a session header to be set automatically with all the coming requests using the same alias (Configtoken)
    ${headers}=    Create dictionary    Content-Type=multipart/form-data    Cookie=token=${accessToken}    #Authorization=Basic ${accessToken}
    Create Session    Configtoken   ${ConfigBaseURL}    headers=${headers}


Validate That Response Body Contains Value    
    [Arguments]    ${response}    ${expectedValue}
    Should Contain    ${response.text}    ${expectedValue}

Validate Response JSON Value
    [Arguments]    ${response}    ${jsonPath}    ${expectedValue}
    ${value}=    Get Value From Json    ${response.json()}    ${jsonPath}
    Should Be Equal As Strings    ${value}[0]    ${expectedValue}
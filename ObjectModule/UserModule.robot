*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Resource   ../Configuration/Resources/Environment.resource



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
    ${Usertoken}=    Set Variable       ${response.json() ['data']['Token']}
    ${headers}=    Create Dictionary    Authorization=Bearer ${Usertoken}
    ${headers}=    Create dictionary    Content-Type=application/json    Authorization=Bearer ${Usertoken}   
    Create Session    Normal_User       ${Normal_host}    headers=${headers}
    #Log To Console    ${Usertoken}



Save Quick Scan Attachment
    [Arguments]    ${filePath}
    ${jsonBody}=    Load Json From File    ${EXECDIR}${filePath}
    ${response}=    Post Request    Normal_User   ${Saveattachment}     json=${jsonBody}
    Should Be Equal As Strings    ${response.status_code}    200


Commit Quick Scan
    [Arguments]    ${filePath}
    ${jsonBody}=    Load Json From File    ${EXECDIR}${filePath}
    ${response}=    Post Request    Normal_User   ${CommitQuickScan}     json=${jsonBody}
    Should Be Equal As Strings    ${response.status_code}    200


Save Quick Upload Attachment
    [Arguments]    ${DocumentData}    ${File}
    ${data}=    Evaluate    {'DocumentData': (None, '${Normal_Username}'), 'File': (None, '${Normal_Password}')}
    ${response}=   Post Request    Normal_Login  ${UploadFastDocument}     files=${data}   
    ##Log To Console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200



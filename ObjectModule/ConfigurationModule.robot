*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Resource   ../Configuration/Resources/Environment.resource




*** Keywords ***

######     Get the access token     ######

Login by config user
    [Arguments]    ${Config_Username}    ${Config_Password}
    Create Session  Config_Login  ${Config_host} 
    ${data}=    Evaluate    {'Username': (None, '${Config_Username}'), 'Password': (None, '${Config_Password}')}
    ${response}=   Post Request    Config_Login  ${Configlogin_serviceName}    files=${data}   
    ##Log To Console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
 ## Set the access token as a session header to be set automatically with all the coming requests using the same alias (restfulBooker)
    ${token}=    Set Variable    ${response.json()}[Token]
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${headers}=    Create dictionary    Content-Type=application/json    Authorization=Bearer ${token}   
    Create Session    Config_User   ${Config_host}    headers=${headers}
    ##Log To Console     The token value is : ${token}


######     AD Connection      ######

Get list of Active Directory Connection
    ${response}=    Post Request    Config_User  ${AD_GetList}
     Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}

Check Active Directory Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    username=${LDAPUSer}    password=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_Connection}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}

Add Active Directory Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_AddConnection}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   #Log To Console  ${response.content}
   ## Set the created AD ID as avariable to be set automatically with all the coming requests using the same alias (restfulBooker)
   ${AD}    Set Variable    ${response.json()['data']}
   #Log To Console  The AD value is : ${AD}
   ${UpdateURL}    Set Variable    ${AD_Update}${AD}
   #Log To Console  The UpdateURL value is : ${UpdateURL}
   ${DeleteURL}    Set Variable    ${AD_Delete}${AD}
   #Log To Console  The DeleteURL value is : ${DeleteURL}

Update Active Directory Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request     Config_User   ${AD_Update}${AD}    json=${data}
   Should Be Equal As Strings       ${response.status_code}    200
   ##Log To Console  ${response.content}

Delete Active Directory Connection
   ${response}=    Post Request   Config_User   ${DeleteURL}   
   Should Be Equal As Strings    ${response.status_code}    200
   #Log To Console  ${response.content}

Add New Active Directory Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_AddConnection}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}
   ## Set the created AD ID as avariable to be set automatically with all the coming requests using the same alias (restfulBooker)
   ${AD}    Set Variable    ${response.json()}[data]
   #Log To Console  The AD value is : ${AD}
   

######     Repository      ######

Check FN Repository Connection
    [Arguments]    ${filePath}
    ${jsonBody}=    Load Json From File    ${EXECDIR}${filePath}
    ${response}=    Post Request    Config_User    ${Repo_Connection}    json=${jsonBody}
    Should Be Equal As Strings    ${response.status_code}    200
    ##Log To Console  ${response.content}

Add FN Repository Connection
    [Arguments]    ${filePath}
    ${jsonBody}=    Load Json From File    ${EXECDIR}${filePath}
    ${response}=    Post Request    Config_User    ${Repo_AddConnection}    json=${jsonBody}
    Should Be Equal As Strings    ${response.status_code}    200
    ##Log To Console  ${response.content}


Get list of Repository Connection
    ${response}=    Post Request    Config_User  ${Repo_GetList}
     Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}
   #${RepoID}    Set Variable    ${response.json()}[data.RepoID]
    ##Log To Console  The RepoID value is : ${RepoID}
   #${DeleterepoURL}    Set Variable    ${Repo_Delete}${RepoID}
   #Log To Console  The DeleteURL value is : ${DeleterepoURL}

Update FN Repository Connection
    [Arguments]    ${filePath}
    ${jsonBody}=    Load Json From File    ${EXECDIR}${filePath}
    ${response}=    Post Request    Config_User    ${Repo_Update}    json=${jsonBody}
    Should Be Equal As Strings    ${response.status_code}    200
    #Log To Console  ${response.content}


Delete FN Repository Connection
   ${response}=    Post Request   Config_User   ${DeleterepoURL}   
   Should Be Equal As Strings    ${response.status_code}    200
   #Log To Console  ${response.content}


Add new FN Repository Connection


Check SP Repository Connection


Add SP Repository Connection


Update SP Repository Connection


Delete SP Repository Connection


Add new SP Repository Connection


Check CMIS Repository Connection


Add CMIS Repository Connection


Update CMIS Repository Connection



Delete CMIS Repository Connection


Add new CMIS Repository Connection


######     Admininstrators       ######
Create Admin Account

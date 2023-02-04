*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Resource    ../Resources/Environment.resource


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
   Log To Console  ${response.content}
   ## Set the created AD ID as avariable to be set automatically with all the coming requests using the same alias (restfulBooker)
   ${AD}    Set Variable    ${response.json()['data']}
   Log To Console  The AD value is : ${AD}
   ${UpdateURL}    Set Variable    ${AD_Update}${AD}
   Log To Console  The UpdateURL value is : ${UpdateURL}
   ${DeleteURL}    Set Variable    ${AD_Delete}${AD}
   Log To Console  The DeleteURL value is : ${DeleteURL}

Update Active Directory Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request     Config_User   ${UpdateURL}    json=${data}
   Should Be Equal As Strings       ${response.status_code}    200
   ##Log To Console  ${response.content}

Delete Active Directory Connection
   ${response}=    Post Request   Config_User   ${DeleteURL}    
   Should Be Equal As Strings    ${response.status_code}    200
   Log To Console  ${response.content}

Add New Active Directory Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_AddConnection}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}
   ## Set the created AD ID as avariable to be set automatically with all the coming requests using the same alias (restfulBooker)
   ${AD}    Set Variable    ${response.json()}[data]
   #Log To Console  The AD value is : ${AD}
   

######     AD Connection      ######

Get list of Repository Connection
   [Arguments]    ${Library_Arabic_Name}    ${Library_English_Name}    ${ContentEngine} ${RepoisteryType} ${CE_URL} ${CE_UserName} ${CE_Password}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_GetList}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}

Check FN Repository Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_Connection}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}

Add FN Repository Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_AddConnection}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}


Update FN Repository Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_serviceName}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}

Delete FN Repository Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_serviceName}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}
Add new FN Repository Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_serviceName}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}

Check SP Repository Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_Connection}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}

Add SP Repository Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_AddConnection}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}

Update SP Repository Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_serviceName}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}

Delete SP Repository Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_serviceName}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}


Add new SP Repository Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_serviceName}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}

Check CMIS Repository Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_Connection}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}


Add CMIS Repository Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_AddConnection}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}


Update CMIS Repository Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_serviceName}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}


Delete CMIS Repository Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_serviceName}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}

Add new CMIS Repository Connection
   [Arguments]    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}
   ${data}=    Create Dictionary    LDAPPath=${LDAPPath}    LDAPUSer=${LDAPUSer}    LDAPPWD=${LDAPPWD} 
   ${response}=    Post Request   Config_User   ${AD_serviceName}     json=${data}
   Should Be Equal As Strings    ${response.status_code}    200
   ##Log To Console  ${response.content}


Create Admin Account
    [Arguments]    ${name}    ${email}    ${password}
    ${data}=    Create Dictionary    name=${name}    
                              ...    email=${email}
                              ...    password=${password}
                              ...    title=Mr
                              ...    birth_date=04
                              ...    birth_month=09
                              ...    birth_year=1994
                              ...    firstname=Mahmoud
                              ...    lastname=ElSharkawy
                              ...    company=VOIS
                              ...    address1=Cairo
                              ...    address2=Obour
                              ...    country=India
                              ...    zipcode=20100
                              ...    state=Cairo
                              ...    city=Obour
                              ...    mobile_number=01155150745
    ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded

    ${response}=    POST    ${automationExerciseBaseUrl}${createAccount_serviceName}    headers=${headers}    data=${data}
    [Return]    ${response}
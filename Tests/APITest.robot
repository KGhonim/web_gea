*** Settings ***
Resource    ../ObjectModule/ConfigurationModule.robot
Resource    ../ObjectModule/UserModule.robot
Resource    ../ObjectModule/AdminModule.robot
Resource    ../ObjectModule/Apis.robot

*** Test Cases ***

Verify Login by config user
    [Documentation]    Login with valid Config user credentials 
    [Tags]    TC01   Configuration Module  Smoke    Regression    Positive  
    Login by config user    ${Config_Username}    ${Config_Password}

Verify Get list of Active Directory Connection 
    [Documentation]    Get list of AD Connection  
    [Tags]    TC02   Configuration Module  ActiveDirectory     Smoke    Regression    Positive
    Get list of Active Directory Connection  

Verify Active Directory Connection 
    [Documentation]    check AD Connection   
    [Tags]    TC03   Configuration Module  ActiveDirectory     Smoke    Regression    Positive
    Check Active Directory Connection    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}

Verify ADD Active Directory Connection 
    [Documentation]    ADD AD Connection   
    [Tags]    TC04   Configuration Module     ActiveDirectory     Smoke    Regression    Positive
    Add Active Directory Connection    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}

Verify Update Active Directory Connection
    [Documentation]    Update AD Connection   
    [Tags]    TC05   Configuration Module     ActiveDirectory     Smoke    Regression    Positive
    Update Active Directory Connection    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}


Verify Delete Active Directory Connection
    [Documentation]    Delete AD Connection   
    [Tags]    TC06   Configuration Module  ActiveDirectory    Smoke    Regression    Positive
    Delete Active Directory Connection    

Verify ADD New Active Directory Connection 
    [Documentation]    ADD AD Connection   
    [Tags]    TC07   Configuration Module  ActiveDirectory    Smoke    Regression    Positive
    Add New Active Directory Connection   ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}


Verify Get list of Repository Connection 
    [Documentation]    Get list of AD Connection  
    [Tags]    TC08   Configuration Module  Repository     Smoke    Regression    Positive
    Get list of Repository Connection

    
Verify Login by Normal user
    [Documentation]    Login with valid Normal user credentials 
    [Tags]    TC09   User Module  Smoke    Regression    Positive  
    Login by Normal user    ${Normal_Username}    ${Normal_Password}
*** Settings ***

Resource    ../ObjectModule/ConfigurationModule.robot
Resource    ../ObjectModule/Apis.robot




*** Test Cases ***
Verify Login by user
    [Documentation]    Login with valid Config user credentials 
    [Tags]    TC01     Smoke    Regression    Positive
    User Login    ${Username}    ${Password}
    


Verify Active Directory Connection 
    [Documentation]    check AD Connection before ADD  
    [Tags]    TC02     Smoke    Regression    Positive
    Active Directory Connect    ${LDAPPath}    ${username}    ${password}
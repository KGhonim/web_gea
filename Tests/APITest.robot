*** Settings ***

Resource    ../ObjectModule/ConfigurationModule.robot
Resource    ../ObjectModule/Apis.robot




*** Test Cases ***
Verify Login by user
    User Login    ${Username}    ${Password}
    



Verify Active Directory Connection 
   Active Directory Connect    ${LDAPPath}    ${username}    ${password}
*** Settings ***

Resource    ../APIS/ApisConfigurationModule.robot



*** Test Cases ***
Test Manager Login
    User Login    ${Username}    ${Password}
 

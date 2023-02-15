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

#Verify Update Active Directory Connection
    #[Documentation]    Update AD Connection   
    #[Tags]    TC05   Configuration Module     ActiveDirectory     Smoke    Regression    Positive
   # Update Active Directory Connection    ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}


#Verify Delete Active Directory Connection
   # [Documentation]    Delete AD Connection   
    #[Tags]    TC06   Configuration Module  ActiveDirectory    Smoke    Regression    Positive
   # Delete Active Directory Connection    

Verify ADD New Active Directory Connection 
    [Documentation]    ADD AD Connection   
    [Tags]    TC07   Configuration Module  ActiveDirectory    Smoke    Regression    Positive
    Add New Active Directory Connection   ${LDAPPath}    ${LDAPUSer}    ${LDAPPWD}


Verify Get list of Repository Connection 
   [Documentation]    Get list of Repository Connection  
    [Tags]    TC08   Configuration Module      Repository     Smoke    Regression    Positive
   Get list of Repository Connection

Verify FN Repository Connection
    [Documentation]    Check FN Repository Connection  
    [Tags]    TC09   Configuration Module      Repository     Smoke    Regression    Positive
    Check FN Repository Connection    /Configuration/TestDataFiles/Json/FNConnection.json
    
Verify ADD Repository Connection
    [Documentation]    Add FN Repository Connection 
    [Tags]    TC10   Configuration Module      Repository     Smoke    Regression    Positive
    Add FN Repository Connection    /Configuration/TestDataFiles/Json/ADDFNConnection.json

#Verify Update Repository Connection
   # [Documentation]    Update FN Repository Connection  
   # [Tags]    TC11   Configuration Module      Repository     Smoke    Regression    Positive
  #  Update FN Repository Connection    /Configuration/TestDataFiles/Json/UpdateFNConnection.json

#Verify Delete Repository Connection
   # [Documentation]    Delete FN Repository Connection   
   # [Tags]    TC12   Configuration Module  Repository    Smoke    Regression    Positive
   # Delete FN Repository Connection    

Verify Login by admin user
    [Documentation]    Login with valid Admin user credentials 
    [Tags]    TC14   Admin Module  Smoke    Regression    Positive  
    Login by Admin user    ${Admin_Username}    ${Admin_Password} 


Verify Get list of users 
    [Documentation]    Get list of users   
    [Tags]    TC15   Admin Module  Users     Smoke    Regression    Positive
    Get list of users 

Verify Get Inactive list of users 
    [Documentation]    Get list of users   
    [Tags]    TC16   Admin Module  Users     Smoke    Regression    Positive
    Get Inactive list of users 

########################## User Test Cases  ############################3
#Verify Login by Normal user
  #  [Documentation]    Login with valid Normal user credentials 
   # [Tags]    TC20   User Module  Smoke    Regression    Positive  
  #  Login by Normal user    ${Normal_Username}    ${Normal_Password}


#Verify Save QuickScan Attachment
 #   [Documentation]    Save Quick Scan Attachment 
  #  [Tags]    TC10   User Module        Smoke    Regression    Positive
#    Save Quick Scan Attachment    /Configuration/TestDataFiles/Json/SaveQuickScanAttachment.json



# #Verify Comit QuickScan Documents
#     [Documentation]    Commit Quick Scan 
#     [Tags]    TC10   User Module         Smoke    Regression    Positive
#     Commit Quick Scan    /Configuration/TestDataFiles/Json/CommitQuickScan.json


# Verify Save Quick Uplaod Attachment
#     [Documentation]    Save Quick Uplaod Attachment 
#     [Tags]    TC10   User Module        Smoke    Regression    Positive
#     Save Quick Uplaod Attachment    /Configuration/TestDataFiles/Json/SaveQuickScanAttachment.json
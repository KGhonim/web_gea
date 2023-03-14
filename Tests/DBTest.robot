
*** Settings ***
Documentation    Database Testing For GEA WEB in Robot Framework
Library          DatabaseLibrary
Resource         ../Configuration/Resources/DB.resource


Suit setup     Connect DB     pymysql      ${DBName}   ${DBUser}  ${DBPassword}   ${DBHost}   ${DBPort}     
Suit Teardown  Disconnect DB 

*** Keywords ***
Connect DB
    Connect To Database  pymysql  ${DBName}  ${DBUser}  ${DBPassword}  ${DBHost}  ${DBPort}

Disconnect DB
    Disconnect From Database


*** Test Cases ***
Prepare Data base for testing  
   
    ${output}=  Execute SQL String  delete from DOCUMENTS
    ${output}=  Execute SQL String  delete from BATCH_GROUP
    ${output}=  Execute SQL String  delete from BATCHES
    ${output}=  Execute SQL String  delete from USER_PERMISSION
    ${output}=  Execute SQL String  delete from CLASS_GROUP_PERMISSION
    ${output}=  Execute SQL String  delete from Classes
    ${output}=  Execute SQL String  delete from ObjectStores
    ${output}=  Execute SQL String  delete from REPOSITORIES
    ${output}=  Execute SQL String  delete from ActiveDirectory
    ${output}=  Execute SQL String  delete from UserApplicationPermission
    ${output}=  Execute SQL String  delete from USER_GROUP
    ${output}=  Execute SQL String  delete from GROUPS
    ${output}=  Execute SQL String  delete from delete from users  where LoginName <> 'GEAweb_Manager'
    ${output}=  Execute SQL String  delete from FOLDER  where English_Name <> 'Root'

    Should Be Equal As Strings  ${output}  None

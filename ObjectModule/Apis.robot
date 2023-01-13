*** Comments ***
This class have all the common keywords that will be used in Tests and/or Object Models files

*** Settings ***
Library    JSONLibrary

*** Keywords ***

############# Validations ############
Validate That Response Body Contains Value    
    [Arguments]    ${response}    ${expectedValue}
    Should Contain    ${response.text}    ${expectedValue}


Validate Response JSON Value
    [Arguments]    ${response}    ${jsonPath}    ${expectedValue}
    ${value}=    Get Value From Json    ${response.json()}    ${jsonPath}
    Should Be Equal As Strings    ${value}[0]    ${expectedValue}


Validate That The Booking is Created
    [Arguments]    ${expectedFirstName}    ${expectedLastName}
    ${response}=    Get Booking    ${expectedFirstName}    ${expectedLastName}
    ${fn}=    Get Value From Json    ${response.json()}    $.firstname
    ${ln}=    Get Value From Json    ${response.json()}    $.lastname
    Run Keyword And Continue On Failure    Should Be Equal    ${fn}[0]    ${expectedFirstName}
    Run Keyword And Continue On Failure    Should Be Equal    ${ln}[0]    ${expectedLastName}


Validate That Booking Does not Exist
    [Arguments]    ${firstName}    ${lastName}
    ${response}=    Get Booking Ids    ${firstName}    ${lastName}
    Validate That Response Body Contains Value    ${response}    []
*** Settings ***
Library            SeleniumLibrary
Library            String 
Library            DateTime    
Resource           ../Robot/Resoruces/Locatores.robot    
#Resource           ../Robot/Resoruces/CommonResource.robot

*** Variables ***
${URL}     http://ae1c-ecomdev-mlb01:30013/EN/en/configurators/tube?product=easyoligo   
${BROWSER}    chrome
   
# ${USERNAME}    
# ${PASSWORD}

*** Test Cases ***
Sample Test Case
    LaunchURL
    EnterySequence    locator    value    
  
    
*** Keywords ***
LaunchURL
    Open Browser    ${URL}    ${BROWSER}

EnterySequence
    [Documentation]    This test case Verifes the login To Stratos Application Page functionality
    [Tags]    TransactionApplication
    [Arguments]                               ${locator}            ${value} 
    Wait Until Element Is Visible             ${oligo_name}   
    SeleniumLibrary.Click Element             ${oligo_name}
    Input Text                                ${oligo_name}         ${oligo_value}
    SeleniumLibrary.Click Element             ${sequence_field}     
    Input Text                                ${sequence_field}         ${sequence_value}



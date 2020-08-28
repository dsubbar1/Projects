*** Settings ***
Library    SeleniumLibrary    
Library    ExcelLibrary
Library    String        


Resource    Locatores.robot
Resource    ../TestData/ConfigTestData.robot
Resource    CommonResources.robot
Resource    ConfiguratorCommonFunctions.robot

#Resource    ../TestData/XlSheetDataRead.xlsx

*** Keywords ***
############################################Multiple product Entry############################################     
Verify Specification section for Easy Oligos
    [Documentation]    This keywor is for verify for specification
    Wait for Object
    Scroll Element Into View                ${SpcAmount}    
    Element Text Should Be                  ${SpcFormat}             ${SpcFormatValue}
    Element Text Should Be                  ${SpcPurification}       ${SpcPurificationValue}    
   #Element Text Should Be                  ${SpcConcentration}      ${SpcConcentrationValue} 
    Element Text Should Be                  ${SpcAmount}             ${SpcAmountValue}
    Wait for Object
    [Return]    ${SpcFormat}    ${SpcPurification}    ${SpcAmount}    
    Log To Console   Pass - Successfully Verified of Specification section
    
Verify Specification section for Pure simple
    [Documentation]    This keywor is for verify for specification
    Wait for Object
    Scroll Element Into View                ${SpcFormatPur}
    Element Text Should Be                  ${SpcAmountPur}          ${SpcAmountValue}   
    Element Text Should Be                  ${SpcPurification}       ${SpcPurificationValuePure}
    Element Text Should Be                  ${SpcFormatPur}           ${SpcFormatValuePure}    
    WaitForNextstepToProceed  
    Wait for Object
    [Return]    ${SpcFormat}    ${SpcPurification}    ${SpcAmount}    
    Log To Console   Pass - Successfully Verified of Specification section
    
Verify Shipping Options Easy Oligos Pure simple 
    [Documentation]                          To scroll down vertical bar till bottom of the page
    Execute JavaScript                       window.scrollTo(0, document.body.scrollHeight)   
    Log To Console   Strated verification of Specification sectionShipping Options 
    Wait for Object   
    Scroll Element Into View                ${ShippingOptionsData}
    Wait Until Element Is Visible           ${ShippingOptionsData}
    SleepTimeForNextStep                    ${ShippingOptionsData}
    Element Should Be Visible               ${ShippingOptionsData}    
    SleepTimeForNextStep                    ${ShippingOptionsData}      
    Element Text Should Be                  ${ShippingOptionsData}    ${ShopingAmdata}
     WaitForNextstepToProceed 
    [Return]    ${ShippingOptionsData}    
    Log To Console   Pass - Successfully Shipping Options section 

ScrollDownToAddOligoBtn
    
    [Documentation]                      To scroll down vertical bar till bottom of the page 
    #[Arguments]                                  ${value}
    Scroll Element Into View              ${BtnAddOligoConfirmPage}  
    Wait Until Element Is Visible         ${BtnAddOligoConfirmPage}
    

   
    
VerificationOfAcknowladegTextArea
    [Documentation]    This keyword si for verify the Acknowladge text area
    Wait for Object
    Scroll Element Into View             ${confirmAcknowladgeCheckbox}
    WaitForNextstepToProceed
    Select Checkbox                      ${confirmAcknowladgeCheckbox}  
    WaitForNextstepToProceed                
    Input Text                           ${confirmAcknowladgeTextArea}     ${confirmAcknowladgeInvalidTextValue}  
    Scroll Element Into View             ${ExpectedErrorXpathFortextArea}
    Element Text Should Be               ${ExpectedErrorXpathFortextArea}  ${ActulErrorForAcknowladgeArea}          
    Scroll Element Into View             ${ErroBarOnTopOfThePage}
    WaitForNextstepToProceed
    ${Error_top_page}=    Get Text    ${ErroBarOnTopOfThePage}
    Element Text Should Be               ${ErroBarOnTopOfThePage}         ${ActulErrorValueForRedBarMessage}
    WaitForNextstepToProceed 
    Scroll Element Into View             ${confirmAcknowladgeTextArea} 
    ClearTextBox                         ${confirmAcknowladgeTextArea}
    WaitForNextstepToProceed 
    Input Text                           ${confirmAcknowladgeTextArea}    ${confirmAcknowTextAreaValue}
    WaitForNextstepToProceed 
    Log To Console   susccessfully Text area section is verified  

*** Keywords ***
Selection of 5 Modification
    [Documentation]       This Keyword is for select Modification. 
    [Arguments]         ${5Modification}  #${Mods}  
    Execute JavaScript                            window.scrollTo(0, document.body.scrollHeight)  
    Scroll Element Into View    ${WellREDD4PA} 
    Wait for Object
    Run Keyword If  '${5Modification}' == 'D2=PA'  SEL1    #${Mods}
    ...    ELSE IF  '${5Modification}' == 'D3=PA'  SEL2
    ...    ELSE IF  '${5Modification}' == 'D4=PA'  SEL3
    ...    ELSE   SEL4
   
SEL1
    #[Arguments]    ${Mods}
    Click Element    ${WellREDD2PA}
    Wait for Object
    Log    Sucessfully seleced D2 radio buton    
    
SEL2
     Click Element    ${WellREDD3PA}
    Wait for Object 
    Log    Sucessfully seleced D3 radio buton
SEL3
     Click Element    ${WellREDD4PA}
    Wait for Object
    Log    Sucessfully seleced D4 radio buton 
    
SEL4  
    Log    If not selected any mods fr wellRed - fail   

*** Keywords ***

Selection of 5 Modification1
    [Documentation]    This keyword is for Modification selection
    Wait for Element
    Scroll Element Into View    ${WellREDD4PA}
    Click Element    ${WellREDD2PA}
    ${D2}=    Get Text    ${WellREDD2PA}
    ${D3}=    Get Text    ${WellREDD3PA}
    ${D4}=    Get Text    ${WellREDD4PA}
   Wait for Element
    [Return]    ${D2}    ${D3}    ${D4}    

Get Values from Sequence page and product summary section - WellRed 
    [Documentation]                   This Keword if for geting value from Product summary get value
    [Arguments]    ${Sequence}
    Wait for Element
    Scroll Element Into View    ${BtnAddOligoSideNavigation} 
    Wait Until Element Is Visible    ${BtnAddOligoSideNavigation}     
    ${OligoProduct1SummarySection}=     Get Text         ${ProductSummaryOligoName1}
    ${GetBaseCountSequecepage}=    Get Text    ${BaseCountForWellInSequenc}
    ${Base_Count}=    Split String    ${GetBaseCountSequecepage}    :   
    ${Actul_BaseCount}=    Set Variable    ${Base_Count}[1]
    ${Sequence_proparty}=    Get Text    ${PriviewSequence}
    [Return]    ${OligoProduct1SummarySection}    ${Actul_BaseCount}    ${Sequence_proparty}  
    
    #===========================================================================================
    Log To Console    Pass - Successfully Values get from product summary section    
    #===========================================================================================
    
Specification selecation
    [Documentation]    This keyword for selection of specification.
    Wait for Element
    Scroll Element Into View    ${BtnAddOligo}
    Wait for Element
    Select Radio Button    amount    2 OD
    Select Radio Button    purification    RP1
    ${FormatData}=    Get Text    ${FormatDryDataForWellRed}
    #Element Should Be Disabled    //span[@class='MuiTypography-root MuiFormControlLabel-label Mui-disabled MuiTypography-body1']
    [Return]   ${FormatData} 
    Wait for Element
       
Get value for WellRED spcification
    [Documentation]    GEt value for rules validation
    Wait for Element
    Scroll Element Into View    ${BtnContinue}
    Wait for Element
    Wait for Object
    ${2_OD}=    Get Text    ${2OD}
    ${Select_RP1}=    Get Text    ${RP1}
    ${4_OD}=    Get Text    ${4OD}
    ${Select_HPLC}=    Get Text    ${HPLC}
    ${5_OD}=    Get Text    ${5OD}
    ${10_OD}=    Get Text    ${10OD}
    ${50_OD}=    Get Text    ${50OD}
    ${100_OD}=    Get Text    ${100OD}
    Wait for Element
    [Return]  ${2_OD}   ${Select_RP1}  ${4_OD}  ${Select_HPLC}  ${5_OD} ${10_OD}  ${50_OD}  ${100_OD} 
Specification selecation based on the Rules
    [Documentation]    This keyword for selection of specification.
    [Arguments]    ${amount}    #${Rules_Values}    #${2_OD}  ${4_OD}  ${5_OD}  ${10_OD}   ${50_OD}   ${100_OD}
    Wait for Element
    Scroll Element Into View    ${BtnAddOligo}
    Wait for Element
    Run keyword if   '${amount}' == '2 OD'  SELECT2OD
    ...   ELSE IF    '${amount}' == '4 OD'  SELECT4OD
        ...   ELSE IF    '${amount}' == '5 OD'  SELECT5OD
            ...   ELSE IF    '${amount}' == '10 OD'  SELECT10OD 
                ...   ELSE IF    '${amount}' == '50 OD'  SELECT50OD 
                   ...   ELSE IF    '${amount}' == '100 OD'  SELECT100OD 
                      ...  ELSE  NOTSELECTED
    
SELECT2OD
    Wait for Element
    Select Radio Button    amount    2 OD
    Select Radio Button    purification    RP1
    ${FormatData}=    Get Text    ${FormatDryDataForWellRed}
    #Element Should Be Disabled    //span[@class='MuiTypography-root MuiFormControlLabel-label Mui-disabled MuiTypography-body1']
    Wait for Element

SELECT4OD
    Wait for Element
    Select Radio Button    amount    4 OD
    Select Radio Button    purification    RP1
    ${FormatData}=    Get Text    ${FormatDryDataForWellRed}
    #Element Should Be Disabled    //span[@class='MuiTypography-root MuiFormControlLabel-label Mui-disabled MuiTypography-body1']
    Wait for Element
    
SELECT5OD
    Wait for Element
    Select Radio Button    amount    50 OD
    Select Radio Button    purification    HPLC
    ${FormatData}=    Get Text    ${FormatDryDataForWellRed}
    #Element Should Be Disabled    //span[@class='MuiTypography-root MuiFormControlLabel-label Mui-disabled MuiTypography-body1']
    Wait for Element

SELECT10OD
    Wait for Element
    Select Radio Button    amount    10 OD
    Select Radio Button    purification    HPLC
    ${FormatData}=    Get Text    ${FormatDryDataForWellRed}
    #Element Should Be Disabled    //span[@class='MuiTypography-root MuiFormControlLabel-label Mui-disabled MuiTypography-body1']
    Wait for Element
    
SELECT50OD
    Wait for Element
    Select Radio Button    amount    50 OD
    Select Radio Button    purification    HPLC
    ${FormatData}=    Get Text    ${FormatDryDataForWellRed}
    #Element Should Be Disabled    //span[@class='MuiTypography-root MuiFormControlLabel-label Mui-disabled MuiTypography-body1']
    Wait for Element

SELECT100OD
    Wait for Element
    Select Radio Button    amount    100 OD
    Select Radio Button    purification    HPLC
    ${FormatData}=    Get Text    ${FormatDryDataForWellRed}
    #Element Should Be Disabled    //span[@class='MuiTypography-root MuiFormControlLabel-label Mui-disabled MuiTypography-body1']
    Wait for Element
    
NOTSELECTED
    
    log  Rules was not selected

Rules validation for WellRed
    [Documentation]    This keyword is for rules valtation 
    Set Selenium Implicit Wait    10s
    Select Radio Button    amount    2 OD
    Select Radio Button    purification    RP1
    ${Format2OD}=    Get Text    ${FormatDryDataForWellRed}
    Element Should Be Disabled    xpath=(//span[@class='MuiTypography-root MuiFormControlLabel-label Mui-disabled MuiTypography-body1'])[1]    #//span[@class='MuiTypography-root MuiFormControlLabel-label Mui-disabled MuiTypography-body1']
    #[Return]   ${Format2OD} 
    Wait for Element
    #*****************************************************************
    Log   For selection of 2 OD rules is pass    
    #*****************************************************************
    Wait for Element
    Select Radio Button    amount    4 OD
    Select Radio Button    purification    RP1
    #Element Should Be Disabled    purification    HPLC    #HPLC    Select Radio Button    purification    HPLC    
    ${Format4OD}=    Get Text    ${FormatDryDataForWellRed}
    Set Selenium Implicit Wait    10s
    #*****************************************************************
    Log   For selection of 4 OD rules is pass    
    #*****************************************************************
    Set Selenium Implicit Wait    10s
    Select Radio Button    amount    5 OD
    Select Radio Button    purification    HPLC
    ${Format5OD}=    Get Text    ${FormatDryDataForWellRed}
    Set Selenium Implicit Wait    10s
    #*****************************************************************
    Log   For selection of 5 OD rules is pass    
    #*****************************************************************
    #Element Should Be Disabled    //span[@class='MuiTypography-root MuiFormControlLabel-label Mui-disabled MuiTypography-body1']
    [Return]    ${Format2OD}   ${Format4OD}    ${Format5OD} 



   



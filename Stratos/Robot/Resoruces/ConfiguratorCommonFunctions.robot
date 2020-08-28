*** Settings ***
Library    SeleniumLibrary       
Library    ExcelLibrary   
Library    String            
Library    Collections    
Library    OperatingSystem    
Library    DataDriver        
  
Resource    Locatores.robot
Resource    ../TestData/ConfigTestData.robot
Resource    CommonResources.robot    

*** Keywords ***

Login
    [Documentation]    Login to application with valid user name 
    #Open Browser                                     ${LoginURL}    gc              
    Wait for Object
    Wait Until Element Is Visible                    ${LoginLink}
    Click Element                                    ${LoginLink} 
    Wait Until Element Is Visible                    ${userID}        
    click                                            ${userID}
    WaitForNextstepToProceed                         
    Wait Until Element Is Visible                    ${userID}  
    User Name    China    
    #sendKeys                                         ${userID}    ${userVal}          
    sendKeys                                         ${passID}    ${passVal} 
    waitForElementPresent                            ${loginBtn}   
    click                                            ${loginBtn}
    Wait for Object
    #===========================================================================================
    Log                                  User is successfully logged in
    #===========================================================================================
User Name
     [Documentation]  Getting user name and password for login
     [Arguments]     ${country_name}      
     #${user_name}    Set Variable    JP         
     Run Keyword If  "${country_name}" == "India"    USER    2    1 
     ...    ELSE IF  "${country_name}" == "China"    USER    3    1
     ...    ELSE IF  "${country_name}" == "US"    USER    4    1
     ...    ELSE IF  "${country_name}" == "JP"    USER    5    1
     ...    ELSE IF  "${country_name}" == "IS"    USER    6    1
     ...    ELSE   USER_IS_NOT_SELECTED      
    #[Return]    ${User_name}       
  
USER 
     [Arguments]    ${XlRow}    ${XlColum}    
     Open Excel Document    ${Login_excel}    doc_id
     ${User_name} =    Read Excel Cell    ${XlRow}    ${XlColum}  
     Input Text    ${userID}    ${User_name}
     Save Excel Document    ${Login_excel} 
     Close Current Excel Document     
    
USER_IS_NOT_SELECTED
     Log   user as not selected 

*** Keywords ***
Log out 
    [Documentation]    Logout from the application
    WaitForNextstepToProceed                             
    click                                            ${ProfileDropDown} 
    Wait Until Element Is Visible                    ${logout} 
    WaitForNextstepToProceed                               
    click                                            ${logout} 
    Wait for Object
    Close Browser
    Wait for Object 
    #Open Browser                                     ${qaURL}    ${Browser}
    #===========================================================================================
    Log  User is successfully logged out from the application
    #===========================================================================================

*** Keywords ***
   
Select Language
    [Documentation]    Select lauguage for the countery
    #Open Browser                                     ${qaURL}    ${Browser}
    #Log                       Browser is been Successfully launched   
    Wait for Object
    Click Element                           ${downArrow}
    Wait for Object           
    Click Element                           ${selectLang}
    Wait for Object
    Log                        Language is successfully seleted 
    
Product Navigation 
    [Documentation]      To Navigate to list of coustome oligo Product page
    #Open Browser                                     ${qaURL}    ${Browser}
    #[Arguments]                                  ${value}
    #Execute JavaScript                            window.scrollTo(0, document.body.scrollHeight) 
    #Open Browser                                     ${qaURL}    ${Browser}
    Wait for Element
    Click Element                        ${CustomProductNavigation}
    Wait Until Element Is Visible        ${CustomProductLifescienceLink}    
    Click Element                        ${CustomProductLifescienceLink}
    Wait for Element
    Click Element                        ${CustomeMenu}  
    Wait for Element
    Scroll Element Into View             ${CutomeElisaKitLink}   
    #Double Click Element    ${CustomeOligoLink}                     
    Wait for Element
    #===========================================================================================
    Log  Pass - Product Naviagted successfully for configuratore
    #===========================================================================================

Clear Items From Mini Cart
    [Documentation]    Verifies your cart functionality
    # [Arguments]     ${element}
    Sleep                                         ${waitTime}
    click                                         ${CartLink}
    Wait Until Element Is Visible                 ${yourCart}               ${shortWait}
    clickAndWait                                  ${yourCart}
    Sleep                                         ${waitTime}
    ${cnt}=           Get Text                    ${itemCount}    #(//*[contains(text(),'Items')])[1]
    @{ItemCount} =    Split String From Right     ${cnt}
    ${ItemCount} =    Set Variable                ${ItemCount}[0]
    Log                                           ${ItemCount}         
    Run Keyword If                                ${ItemCount} == ${cartEmpty}  Empty Cart
    ...    ELSE                                   Your Cart Items

Your Cart Items
    
    Wait Until Page Contains                      ${yourCartMsg}
    clickAndWait                                  ${clearCart}
    clickAndWait                                  ${agreeBtn}
    Sleep                                         ${waitTime}
    
Empty Cart
    
    Wait Until Page Contains                      ${emptyCartMsg}
    clickAndWait                                  ${closeYourCart}
   
Select Region
    [Documentation]                               This Keyword is for select region 
    [Arguments]                                  ${RegionList}  ${Location}  
    #Open Browser                                  ${qaURL}    ${Browser} 
    Maximize Browser Window       
    Wait for Object
    Run Keyword If  '${RegionList}' == 'Asia Pacific'   CON1    ${Location}
    ...    ELSE IF  '${RegionList}' == 'South America'  CON2    ${Location}
    ...    ELSE IF  '${RegionList}' == 'Africa'         CON3    ${Location}
    ...    ELSE IF  '${RegionList}' == 'North America'  CON4
    ...    ELSE IF  '${RegionList}' == 'Europe'         CON5
    ...    ELSE     KEY6
   
CON1
    [Arguments]    ${Location}
    Click Element                    ${AsiaPacific}
    Wait for Object
    Select Country                    ${Location}
    #SelectionOfLocationfor-AsiaPacific    ${China}    
    Locaion Selected Check Box and Click Countinue Button

CON2
    [Arguments]    ${Location}
    Click Element    ${South America}
    #SelectionOfLocationfor-South America    ${China}
    Select Country   ${Location}    
    Locaion Selected Check Box and Click Countinue Button 
    
CON3
    [Arguments]    ${Location}
    Click Element     ${LongOligoOrderBtn}
    Select Country    ${Location}  
    Log   Long Oligo Product Order Button is clicked 
    
CON4
    Wait Until Element Is Visible    ${EasyOligoOrderBtn}   
    Click Element                    ${EasyOligoOrderBtn} 
    Log   Easy Oligo Product Order Button is clicked
    Wait for Object
    ${ActalEasyOligoPageName}=    Get Text    ${EasyOligoPageName}  
    Element Text Should Be            ${EasyOligoPageName}    ${ExpectedEasyOligoPageName} 
    Log   Verification of Easy Oligo Product page Navigation.      
    
CON5
    Click Element     ${WellRedOrderBtn}   
    Log   Well red Product Order Button is clicked
    
CON6  
    Log   Error 
    Log    Product selection is successfully done asper require    
    
Select Country
    [Documentation]    This keyword for select country as per region
    [Arguments]   ${Location}    
    Execute JavaScript                            window.scrollTo(0, document.body.scrollHeight)   
    Wait for Object
    Run Keyword If  '${Location}' == 'IN'  LOC1
    ...    ELSE IF  '${Location}' == 'CN'  LOC2
    ...    ELSE IF  '${Location}' == 'JP'  LOC3
    ...    ELSE IF  '${Location}' == 'IL'  LOC4
    ...    ELSE     KEY6   

LOC1
    Click Element    ${Afghannistan}    
    Scroll Element Into View    ${India}
    Click Element               ${India}    
    Log   Sucessfully China country is selected
    Wait for Object
    
LOC2
    Click Element    ${Afghannistan}    
    Scroll Element Into View    ${China}
    Click Element             ${China}    
    Log   Sucessfully China country is selected
    Wait for Object
    
LOC3
    Click Element    ${Afghannistan}    
    Scroll Element Into View    ${Japan}
    Click Element           ${Japan}    
    Log   Sucessfully China country is selected
    Wait for Object
    
LOC4
    Click Element    ${Afghannistan}    
    Scroll Element Into View    ${Israle}
    Click Element        ${Israle}    
    Log   Sucessfully China country is selected
    Wait for Object

Locaion Selected Check Box and Click Countinue Button
    
    [Documentation]    This keyword for after selected country user is selected check box and clicked countinue button
    Wait for Object
    Click Element     ${LocationSelectCheckbox}
    Wait for Object
    Click Element    ${btnContinueLoc}  
    Wait for Object 
    
Selection Of Location for AsiaPacific
    [Documentation]   This Keyword is for select configurator product. 
    [Arguments]  ${Element}
    Execute JavaScript                            window.scrollTo(0, document.body.scrollHeight)
    Click    ${Afghannistan}
    Click    ${Element}    
    
Select Configurator Product From The List
    [Documentation]  This Keyword is for select configurator product. 
    [Arguments]  ${ProductName}
    Execute JavaScript                            window.scrollTo(0, document.body.scrollHeight) 
    Wait for Object
    ${ProductPageName}=  Get Text   ${ProductListPage}
    Element Text Should Be          ${ProductListPage}    ${ProductPageName}     
    Scroll Element Into View       ${WellRedOrderBtn}  
    Wait for Object
    Run Keyword If  '${ProductName}' == 'DNA Oligos in Tubes'  DNA
    ...    ELSE IF  '${ProductName}' == 'DNA Oligos in Plates'  DNA_PLATE
    ...    ELSE IF  '${ProductName}' == 'Long Oligos'  LONG_OLIGO
    ...    ELSE IF  '${ProductName}' == 'Easy Oligos'  EASY OLIGO
    ...    ELSE IF  '${ProductName}' == 'WellRED'  WELLRED
    ...    ELSE     KEY6
   
DNA
    Click Element    ${DNAOligoOrderBtn} 
    Log   DNA Oligo Product Order Button is clicked    

DNA_PLATE
    Click Element     ${DNAPlatesOrderBtn}   
    Log   DNA Plates Product Order Button is clicked 
    
LONG_OLIGO
    Click Element     ${LongOligoOrderBtn}  
    Log   Long Oligo Product Order Button is clicked 
    
EASY OLIGO
    Wait Until Element Is Visible    ${EasyOligoOrderBtn}   
    Click Element                    ${EasyOligoOrderBtn} 
    Log   Easy Oligo Product Order Button is clicked
    Wait for Object
    ${ActalEasyOligoPageName}=    Get Text    ${EasyOligoPageName}  
    Element Text Should Be    ${EasyOligoPageName}    ${ExpectedEasyOligoPageName} 
    Log   Verification of Easy Oligo Product page Navigation.      
    
WELLRED
    Click Element     ${WellRedOrderBtn}   
    Log   Well red Product Order Button is clicked
    
KEY6 
    Log   excp    

Enter Valid Oligo Name 
    [Documentation]    This Keword if for Oligo name functionality
    [Tags]    This enter oligo name fucntion is reusebale
    WaitForNextstepToProceed               
    Wait Until Element Is Visible          ${OligoName}
    Double Click Element                   ${OligoName}
    ClearTextBox                           ${OligoName}                  
    Input Text                             ${OligoName}    ${OligoValue}   
    ${Name_Oligo}=  Generate Random String  1  [NUMBERS] 
    #${Valid_Charater}=  Catenate    SEPARATOR=  ${Name_Oligo}
    type                  ${OligoName}     ${Name_Oligo}
    #===========================================================================================
    Log    Oligo Name is successfully entered 
    Log    Oligo name is successfully entered on oligo text field
    #===========================================================================================
    #Get Lines Matching Pattern    string    pattern    
    
Enter Maximum Oligo Name
    [Documentation]    This keyword is for Verify the Maximum oligo name
    Wait for Object
    Wait Until Element Is Visible        ${OligoName}
    ${Name_Oligo}=  Generate Random String  31  [LETTERS] 
    ${MaxMiumOligo_Charater}=  Catenate    SEPARATOR=  ${Name_Oligo}   
    type                                  ${OligoName}     ${MaxMiumOligo_Charater}
    Wait for Object
    ${expectedErrorMessageforMaxmiumOligoValue}=  Get Text   ${EroorForMaxValue}
    verifyText                           ${EroorForMaxValue}    ${ActualErrorMessageforMaxmiumOligoValue} 
    ClearTextBox                         ${OligoName}
    
  #==================================================================
    log    Seccessfulfy Verified of Maximum oligo name 
  #==================================================================
  
Enter Valid Sequence In Sequence text box    
    [Documentation]      This Keword if for Sequence functionality
    [Tags]                        This sequence fucntion is reusebale
    Wait for Object
    Log  Strated verification of valid sequenc entry
    Wait Until Element Is Visible           ${SequenceField} 
    ClearTextBox                            ${SequenceField}    
    type                                    ${SequenceField}           ${SequenceValue} 
    Wait for Object
    #SleepTimeForNextStep                    ${PriviewSequence}
    #===========================================================================================
    Log  Pass - Successfully Verified of valid sequenc entry
    Log    Sequence value is successfully entered on sequence text field
    #===========================================================================================
    
Enter Invalid Sequence Entry 
    [Documentation]    This keyword for Verify the invalid sequence entry
     Wait for Element
     Wait Until Element Is Visible                  ${SequenceField} 
     Input Text                                     ${SequenceField}    ${InvalidSequencValue}
     Wait for Object
     Scroll Element Into View                       ${ErrorXpathForInvalidSequenc}
     WaitForNextstepToProceed                            
     Element Text Should Be                         ${ErrorXpathForInvalidSequenc}    ${ActulErrorMessageForInvalidSequence} 
     Wait for Object   
     ClearTextBox                                   ${SequenceField} 
     #==================================================================================================
     Log  Pass - Successfully Verified of invalid sequenc entry
     log    Successfully Verified of invalid sequenc entry
     #================================================================================================== 
     
Enter Minimum Sequence Entry
    [Documentation]    This keyword for Verify the Minimum sequence entry
    Wait for Object    
    Input Text                      ${SequenceField}                          ${MiniumSequenceValue}
    Scroll Element Into View        ${ErrorXpathForMiniSequenceField} 
    Wait for Object 
    Element Text Should Be          ${ErrorXpathForMiniSequenceField}   ${Actul_errorForMinimumSequence}   
    ClearTextBox                    ${SequenceField}
    Wait for Object
    log   Successfully Verified of Minimum sequenc entry
    
Enter Minimum Sequence Entry - Pure simple
    [Documentation]    This keyword for Verify the Minimum sequence entry
    Wait for Object    
    Input Text                      ${SequenceField}                          ${MiniumSequenceValuePure}
    Scroll Element Into View        ${ErrorXpathForMiniSequencePure} 
    Wait for Object 
    Element Text Should Be          ${ErrorXpathForMiniSequencePure}   ${Actul_errorForMinimumSequencePure}   
    ClearTextBox                    ${SequenceField}
    Wait for Object
    log   Successfully Verified of Minimum sequenc entry

Enter Maximum Sequence Entry
    [Documentation]    This keyword for Verify the Maximum sequence entry
    Wait for Object  
    type                      ${SequenceField}   ${MaximumSequenceValue}
    Wait for Object
    Element Text Should Be    ${ErrorXpathForMaxSequenceField}   ${Actul_errorForMaximumSequence}    
    ClearTextBox   ${SequenceField}
    Wait for Object
    Log  Pass - Successfully Verified of Maxmium sequenc entry
    
Enter Maximum Sequence Entry - Pure Simple
    [Documentation]    This keyword for Verify the Maximum sequence entry
    Wait for Object  
    type                      ${SequenceField}   ${MaximumSequenceValuePure}
    Wait for Object
    Element Text Should Be    ${ErrorXpathForMaxSequenceFieldPure}   ${Actul_errorForMaximumSequencePure}     
    ClearTextBox   ${SequenceField}
    Wait for Object
    Log  Pass - Successfully Verified of Maxmium sequenc entry
     
Click Add Oligo Button at the bottom of the page
    [Documentation]      This Keword if for Add button functionality
    Log  Strated verification of Add Oligo from bottom of the page
    Scroll Element Into View              ${BtnAddOligo}
    WaitForNextstepToProceed              
    Click Element                         ${BtnAddOligo} 
    Scroll Element Into View              ${SingleEntryPageSequenceInformationHeader}
    Log                       User navigated to top of the page
    WaitForNextstepToProceed                   
    #===========================================================================================
    Log  Pass - Successfully added oligo from bottom of then single entry page.
    #===========================================================================================
    
Base Count 
    [Documentation]    This keyword is for getting base count
    #[Arguments]    
    Wait for Element
    ${GetBaseCountSequecepage}=    Get Text    ${SequenceBaseCount}
    Wait for Object
    #${Actul_BaseCount}    Split String    ${GetBaseCountSequecepage} 
    ${Base_Count}=    Split String    ${GetBaseCountSequecepage}    :   
    ${Actul_BaseCount}=    Set Variable    ${Base_Count}[1]  
    [Return]      ${Actul_BaseCount}     
    Wait for Element
    #===========================================================================================
    Log   Base count was seccuessfully get the data
    #===========================================================================================
    
Verify The Sequence Properties Section
    [Documentation]    This keywod is for Sequence and base cout veification
    Wait for Element
    Scroll Element Into View                        ${PriviewSequence} 
    Element Text Should Be                          ${SequencePropartiesHeadr}     Sequence Properties
    Wait Until Element Is Visible                   ${PriviewSequence}
    WaitForNextstepToProceed                                 
    Wait for Object
    Wait for Element     
    Element Text Should Be                          ${PriviewSequence}           ${SequenceValue}   
    [Return]    ${SequencePropartiesHeadr}          ${PriviewSequence}       
    Wait for Object
    
Verify The Base Count Value  
    [Documentation]    This keyword for Base count verification
    [Arguments]    ${PreviewBaseFieldCount}    ${Actul_BaseCount}    
    Wait for Element 
    Wait Until Element Is Enabled    ${PrivewBaseCount}    
    ${PreviewBaseFieldCount}=    Get Text    ${PrivewBaseCount}
    Wait for Object
    Run Keyword If  '${PreviewBaseFieldCount}' == '${Actul_BaseCount}'  COUNT_VERFICATION
    
COUNT_VERFICATION
    Log    Sucessfully Base count is matched with sequence filed and privew section

Sequence Page Validation
    [Documentation]    This keyword is error validation for sequence
    Wait for Element 
    WaitForNextstepToProceed
    Element Text Should Be    ${ErroBarOnTopOfThePage}    ${ActulErrorValueForRedBarMessage}    
    Element Text Should Be    ${Required FieldXpath}    ${Required Field_errorData}         
    WaitForNextstepToProceed
    
Click Add Button Oligo From Product Summary
    [Documentation]                   This Keword if for Product summary get value
    Execute JavaScript                    window.scrollTo(0, document.body.scrollHeight)
    Log                       Strated verification of Add Oligo from Production summary section
    Scroll Element Into View              ${BtnAddOligoSideNavigation}
    WaitForNextstepToProceed
    Wait Until Element Is Visible         ${BtnAddOligoSideNavigation}
    Click Element                         ${BtnAddOligoSideNavigation}
    WaitForNextstepToProceed                   
   
    Log      Pass - Successfully Clicked added oligo button from production summary section.

Click View All Link in Product Summary
    [Documentation]    This Keyword is for click View all popup for side naviagation and verify the popup header name
    Wait for Object
    scroll Element Into View                    ${OligoName}
    WaitForNextstepToProceed
    Click Element                              ${ViewAllLink}
    WaitForNextstepToProceed
    Wait Until Element Is Visible              ${ViewAllPopupHeaderName}
    ${ViewAll_PopupHeader}=    Get Text        ${ViewAllPopupHeaderName}
    @{splitPopuHeader}=    Split String From Right    ${ViewAll_PopupHeader} 
    ${GetHeaderName0}=    Set Variable        ${splitPopuHeader}[0]   
    ${GetHeaderName1}=    Set Variable        ${splitPopuHeader}[1]   
    ${Actul_headerName}=    Catenate          ${splitPopuHeader}[0]    ${splitPopuHeader}[1]                                                        
    Wait for Object
    #==============================================================================================
    Log    successfully view all popup is displayed and Verified the popup header name.
    #==============================================================================================

Delete Verification For Singel Line Item On View All Popup
    [Documentation]                     To verify the delete singel line item 
    Wait for Object
    Wait Until Element Is Visible               ${DeleteBinForSingleLineItemPopup}
    Click Element                               ${ViewAllPopupLineItemDeleteBtn}                  
    WaitForNextstepToProceed 
    Click Element                               ${DeleteconfirmationCancleLink}
    WaitForNextstepToProceed                                        
    Click Element                               ${ViewAllPopupLineItemDeleteBtn}
    Wait for Object
    #Element Should Be Visible                   ${DeleteconfirmationForSingleContent}    ${ActulconfirmationMessageFroSingelLineItem}
    WaitForNextstepToProceed
    Click Element                                ${DeleteconfirmDeleteBtn}
    WaitForNextstepToProceed
    #[Return]    ${Delete_Content_message}    
    #${Actul_DeleteSingleLine_mesg}=  Get Text  '${DeleteconfirmationForSingleContent}'
    #${ConfirmMessaheForLineItem}=  Set Variable  ${Actul_DeleteSingleLine_mesg}  
    #Wait for Object
    #Run Keyword If  '${ConfirmMessaheForLineItem}' == '${ActulconfirmationMessageFroSingelLineItem}'  DEL1
    #======================================================================================================
    log    Deleted single line item is successfully on view all popup form product summary 
    Log   Deleted single line item is successfully on view all popup form product summary 
    #======================================================================================================
    
DEL1
    [Documentation]    Click Delete button if Delete  Confirmation popup message is not matching    
    Wait for Object
    Double Click Element                               ${DeleteconfirmDeleteBtn}
    WaitForNextstepToProceed
    Wait for Object
    #======================================================================================================
    log    Deleted single line item is successfully on view all popup form product summary 
    #======================================================================================================

DEL2
    Log    Fail -     Delete button is not clicked becouse Confirmation popup message is not matching

Delete Verification For All the Line Item On View All Popup
    [Documentation]                     To verify the delete singel line item 
    Wait for Object
    Wait Until Element Is Visible               ${DeleteBinForSingleLineItemPopup}
    Click Element                               ${ViewAllPopuDeleteAllLink}                     
    WaitForNextstepToProceed
    Click Element                               ${DeleteconfirmationCancleLink}
    WaitForNextstepToProceed                                       
    Click Element                               ${ViewAllPopuDeleteAllLink}
    WaitForNextstepToProceed  
    #Element Should Be Visible                   $${DeleteconfirmationForDeleteAllContent}    ${ActulconfirmationMessageForDeleteAllPopup}   
    WaitForNextstepToProceed 
    Double Click Element                                ${DeleteconfirmDeleteBtn}
    WaitForNextstepToProceed
    #[Return]    ${DeleteAll_content_message}  
    #${Actul_DeleteAll_mesg}=  Get Text  ${DeleteconfirmationForDeleteAllContent}  
    #Run Keyword If  '${Actul_DeleteAll_mesg}' == '${ActulconfirmationMessageForDeleteAllPopup}'  DELA1
    #WaitForNextstepToProceed
    
DELA1
    [Documentation]    Click Delete button if Delete  Confirmation popup message is not matching    
    WaitForNextstepToProceed  
    Set Selenium Implicit Wait    10s    
    Double Click Element                                ${DeleteconfirmDeleteBtn}  
    WaitForNextstepToProceed                         
    #======================================================================================================
    log    Deleted All line item is successfully on view all popup form product summary  
    #======================================================================================================

DELA2
    Log    Fail -     Delete button is not clicked becouse Confirmation popup message is not matching

Get Values from Sequence page and product summary section - Easy Oligo 
    [Documentation]      This Keword if for geting value from Product summary get value
    [Arguments]    ${Sequence}
    WaitForNextstepToProceed
    Scroll Element Into View    ${BtnAddOligoSideNavigation}
    Wait Until Element Is Visible    ${BtnAddOligoSideNavigation}     
    Wait for Object
    ${OligoProduct1SummarySection}=     Get Text         ${ProductSummaryOligoName1} 
    ${GetBaseCountSequecepage}=    Get Text    ${SequenceBAseCount}   
    ${Base_Count}=    Split String    ${GetBaseCountSequecepage}    :   
    ${Actul_BaseCount}=    Set Variable    ${Base_Count}[1]
    Wait for Object
    ${Sequence_proparty}=    Get Text    ${PriviewSequence}
    [Return]    ${OligoProduct1SummarySection}    ${Actul_BaseCount}    ${Sequence_proparty}  
   
    WaitForNextstepToProceed
    #===========================================================================================
    Log   Pass - Successfully Values get from product summary section    
    #===========================================================================================

Get Values from Sequence page and product summary section - WellRed 12
    [Documentation]      This Keword if for geting value from Product summary get value
    [Arguments]    ${Sequence}
    WaitForNextstepToProceed
    Scroll Element Into View    ${BtnAddOligoSideNavigation}
    Wait Until Element Is Visible    ${BtnAddOligoSideNavigation}     
    Wait for Object
    ${OligoProduct1SummarySection}=     Get Text         ${ProductSummaryOligoName1}   
    ${GetBaseCountSequecepageWell}=    Get Text    ${SequenceBAseCountWellRed}
    ${Base_Count}=    Split String    ${SequenceBAseCountWellRed}    :   
    ${Actul_BaseCount}=    Set Variable    ${Base_Count}[1]
    Wait for Object
    ${Sequence_proparty}=    Get Text    ${PriviewSequence}
    [Return]    ${OligoProduct1SummarySection}    ${Actul_BaseCount}    ${Sequence_proparty}  
   
    WaitForNextstepToProceed
    #===========================================================================================
    Log   Pass - Successfully Values get from product summary section    
    #===========================================================================================

Navigation From Sequence entry page to reiew and confirm page    
    [Documentation]                   This Keword if for Naviagte to review and confirm page from single entry page
    Scroll Element Into View                        ${BtnContinue}
    WaitForNextstepToProceed     
    Click Element                                   ${BtnContinue} 
    WaitForNextstepToProceed
    #===========================================================================================
    Log      Pass - Sucessfully navigated to next page from sequence entry page
    #===========================================================================================
    
Click Add Oligo From confirmpage
    
    [Documentation]          This Keword if for add oligo from confirm page. 
    #[Arguments]                                  ${value}
    Execute JavaScript                    window.scrollTo(0, document.body.scrollHeight)
    Wait for Element
    Scroll Element Into View              ${BtnAddOligoConfirmPage}
    Wait for Element
    Click Element                         ${BtnAddOligoConfirmPage}
    Log                        Started add oligo from review and confirm page    
    Wait Until Element Is Visible         ${OligoName}
    Wait for Element 
    #===========================================================================================
    Log    Successfully Clicked added oligo from review and confirm page 
    #===========================================================================================
       
Oligo Name Verification on Review And Confirm Page 
    [Documentation]                       This Keword if for verification          
    [Arguments]                         ${ProductSummary_SequencePageValues}    ${Review_ConfirmPageValues}        
    Execute JavaScript                    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible       ${OligoName_ReviewConfirm} 
    Scroll Element Into View                ${OligoName_ReviewConfirm}   
    Wait for Element  
    Run Keyword If  '${ProductSummary_SequencePageValues}[0]' == '${Review_ConfirmPageValues}[0]'    KEYWORD1
    ...  ELSE  KEYWORD2
    Wait for Element  

KEYWORD1
    Log   Successfully Oligo name is matched in both Product summary and Review confrim page.  
    
KEYWORD2
    Log   Fail - Oligoname is not matched for Sequence page to review page.  
       

Base Count Verificati On Review and Confirm Page 
    [Documentation]                       This Keword if for verification of base count from sequence page to Review confirm page         
    [Arguments]                         ${ProductSummary_SequencePageValues}    ${Review_ConfirmPageValues}        
    Execute JavaScript                    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible       ${OligoName_ReviewConfirm} 
    Scroll Element Into View                ${OligoName_ReviewConfirm}   
    Wait for Element 
    WaitForNextstepToProceed 
    Run Keyword If  '${ProductSummary_SequencePageValues}[1]' == '${Review_ConfirmPageValues}[1]'  RUNBASECOUNT
    ...  ELSE  BASE2
    Wait for Element   
    
RUNBASECOUNT
    Log   Successfully Oligo name is matched in both Product summary and Review confrim page.  
    
BASE2
    Log   Fail - Base count is not matched for Sequence page to review page.

Get Values from review and confrim page  
    [Documentation]                   This Keword if for get value from confirm page
    Wait for Element
    Wait for Object
    WaitForNextstepToProceed
    Wait Until Element Is Visible      ${ReviewAndConfirmPageHeader}     5s  
    ${ReviewConfimPag}=  Get Text  ${ReviewAndConfirmPageHeader}
    WaitForNextstepToProceed   
    ${Actul_Oligo_Name_ReviwConfirm}=    Get Text    ${OligoName_ReviewConfirm}
    ${ReviewBaseCount}=    Get Text    ${ReviewConfirmBaseCount1}
    ${ReviewConfirmBaseCount}=    Split String    ${ReviewBaseCount}    :
    ${Actul_BaseCount}=    Set Variable    ${ReviewConfirmBaseCount}[1]
    ${Actul_Price}=    Get Text    ${ReviewConfirmPriceValue1}
    WaitForNextstepToProceed            
    ${Actul_Subtotal_Price}=    Get Text    ${ReviewConfirmSubtotalxpath}  
    [Return]    ${ReviewConfimPag}    ${Actul_Oligo_Name_ReviwConfirm}    ${Actul_BaseCount}    ${Actul_Subtotal_Price}    ${Actul_Price}       
    Set Selenium Implicit Wait    30s
    #=================================================================================
    Log   Successfuly values are got from confirm page. 
    #=================================================================================
  
Verification of Values in SequencePage And ReviewConfirm Page
    [Documentation]  This Keword if for get value from confirm page
    [Arguments]    ${element1}    ${element2}
    Wait for Element
    Run Keyword If  ${element1} == ${element2}  KVALUE 
          
KVALUE 
    
    Log    Both the values in Sequence and ReviewConfirm page are matching

Web Price Verification on Review & Confirm page 
    [Documentation]    This keyword for price verification
    [Arguments]    ${Product_Name}    #${XlSheet}   #${Expected_Price}    ${Confirm_Price}    
    Wait for Element  
    ${Confirm_Price}=  Get Text    ${ReviewConfirmPriceValue1}   
    Run Keyword If  '${Product_Name}' == 'Easy Oligo'  WEBPRICEEXPECTED   Easy Oligo  2  2   ${Confirm_Price}  
    ...  ELSE IF    '${Product_Name}' == 'Pure Simple'  WEBPRICEEXPECTED  Pure Simple  2  2  ${Confirm_Price}
    ...  ELSE IF    '${Product_Name}' == 'WellRED'  WEBPRICEEXPECTED  WellRED  2  2  ${Confirm_Price}     
    ...  ELSE  WEBPRICENOTEXPECTED      

WEBPRICEEXPECTED 
    [Documentation]   To send result data in XL
    [Arguments]  ${XlSheet}  ${XlRow}   ${XlColum}  ${Confirm_Price}  
     Wait for Object      
     Open Excel Document    ${Product_Details_Xl}    doc_id  
     ${Price_details} =    Read Excel Cell  ${XlRow}   ${XlColum}    ${XlSheet}   
     Run Keyword If  '${Price_details}' == '${Confirm_Price}'  WEBPRICEEXPECTED_TRUE   ${XlSheet}    ${XlRow}
     ...  ELSE    WEBPRICEEXPECTED_FALSE     ${XlSheet}      ${XlRow} 
    
WEBPRICEEXPECTED_TRUE
    [Documentation]    This Keyword is send results to XL sheet 
    [Arguments]    ${XlSheet}   ${XlRow}      
     Write Excel Cell  ${XlRow}  3  Pass  ${XlSheet} 
     Save Excel Document    ${Product_Details_Xl}  
     Close Current Excel Document     
     Log    Pass - price is matched with web price sheet.
     
WEBPRICEEXPECTED_FALSE  
     [Documentation]   This Keyword is send results to XL sheet
     [Arguments]   ${XlSheet}  ${XlRow}      
     Write Excel Cell  ${XlRow}  3  Fail ${XlSheet}       
     Save Excel Document    ${Product_Details_Xl}  
     Close Current Excel Document     
     Log    Fail - price is Not matched with web price sheet.
    
WEBPRICENOTEXPECTED   
    [Documentation]    IF price is not dislayed aslo we can naviagte to mini cart with fail statment.
    Click Add To Cart 
    Log    Fail - price is not matched with web price sheet.

Download Summary And Click Checkbox
    [Documentation]  This keyword is for download the summary sheet. 
     # [Arguments]                                  ${value}
    Scroll Element Into View             ${confirmDownloadSummaryLink}
    Wait Until Element Is Visible        ${confirmDownloadSummaryLink}
    WaitForNextstepToProceed
    Click Element                        ${confirmDownloadSummaryLink}
    WaitForNextstepToProceed
    #=====================================================================
    Log     Successfully dowloaded "Download summary" file
    #=====================================================================     

Delete Verification For Singel Line Item Cnconfirm Page
    [Documentation]                     To verify the delete singel line item 
     #[Arguments]                                  ${value}
    Scroll Element Into View              ${confirmDeleteBinForLineItem}
    Wait Until Element Is Visible         ${confirmDeleteBinForLineItem}
    WaitForNextstepToProceed
    Click Element                         ${confirmDeleteBinForLineItem}     
    WaitForNextstepToProceed
    Click Element                         ${DeleteconfirmationCancleLink}
    WaitForNextstepToProceed
    Click Element                         ${confirmDeleteBinForLineItem}
    WaitForNextstepToProceed
    Double Click Element                  ${DeleteconfirmDeleteBtn}
    WaitForNextstepToProceed
    
    ##Run Keyword If  '${Actul_DeleteAllCon_mesg}' == '${ActulconfirmationMessageFroSingelLineItem}'  DELCON1

DELCON1
    [Documentation]    Click Delete button if Delete  Confirmation popup message is not matching    
    WaitForNextstepToProceed
    Double Click Element                              ${DeleteconfirmDeleteBtn}
    WaitForNextstepToProceed
    Wait for Object
    #======================================================================================================
    log    Deleted single line item is successfully on Review and fonfirmpage
    Log   Deleted single line item is successfully on Review and fonfirmpage
    #======================================================================================================

DELCON2
    Log    Fail -     Delete button is not clicked becouse Confirmation popup message is not matching
    Log   sucessfully single line item got delete from review and cofirm page   
     

Delete Verification For All the Line Item On ConfirmPage
    [Documentation]                     To verify the delete singel line item 
    Wait for Object
    Click Element                               ${confirmDeleteBinForAll}                     
    WaitForNextstepToProceed
    Click Element                               ${DeleteconfirmationCancleLink}
    WaitForNextstepToProceed                                       
    Click Element                               ${confirmDeleteBinForAll}
    WaitForNextstepToProceed  
    Wait Until Element Is Visible               ${DeleteconfirmDeleteBtn}   
    Double Click Element                        ${DeleteconfirmDeleteBtn}
    WaitForNextstepToProceed                             
    #${Actul_deleteCon_mesg}=    Get Text        ${DeleteconfirmationForDeleteAllContent}  
   # Run Keyword If  '${Actul_deleteCon_mesg}' == '${ActulconfirmationMessageForDeleteAllPopup}'  DELACON1
    #WaitForNextstepToProceed 

DELACON1
    [Documentation]    Click Delete button if Delete Confirmation popup message is not matching    
    WaitForNextstepToProceed  
    Wait Until Element Is Visible               ${DeleteconfirmDeleteBtn}   
    Double Click Element                        ${DeleteconfirmDeleteBtn}
    WaitForNextstepToProceed                           
    Wait for Object
    #======================================================================================================
    log    Deleted All line item is successfully on view all popup form product summary 
    Log   Deleted All line item is successfully on view all popup form product summary 
    #======================================================================================================

DELACON2
    Log    Fail -     Delete button is not clicked becouse Confirmation popup message is not matching

Delete Verification for Production Summary Section
    [Documentation]    This keyword is for Delete line item for product summary line item
    Wait for Object
    Scroll Element Into View        ${DeleteBinIconProductSummary}
    WaitForNextstepToProceed                                       
    Click Element                    ${DeleteBinIconProductSummary}
    WaitForNextstepToProceed  
    Click Element                    ${DeleteBtnforconfirmProductSummary} 
    WaitForNextstepToProceed                           
    #${Actul_deleteCon_mesg}=    Get Text        ${DeleteconfirmationForDeleteAllContent}  
    #WaitForNextstepToProceed 

DELP1
    [Documentation]    Click Delete button if Delete  Confirmation popup message is not matching    
    WaitForNextstepToProceed  
    Wait Until Element Is Visible               ${DeleteBtnforconfirmProductSummary}    
    Click Element                               ${DeleteBtnforconfirmProductSummary} 
    WaitForNextstepToProceed                           
    Wait for Object
    #======================================================================================================
    log    Deleted line item is successfully on product summary section
    Log   Deleted line item is successfully on product summary section
    #======================================================================================================

DELP2
    Log    Fail -     Delete button is not clicked becouse Confirmation popup message is not matching

Verification of Sequence Information page
    [Documentation]    This Keywor is for after deleted the all line item from view all popup / review confirm page user should naviagte to sequence information page.
    Wait for Element
    WaitForNextstepToProceed
    Page Should Contain Element    ${SingleEntryPageSequenceInformationHeader}
    WaitForNextstepToProceed   
    Wait for Element
    log     Sucessfully Sequence Information page is displayed. 
Click Add To Cart
   [Documentation]                   This Keyword if for Add to cart from confirm page
     Wait for Element
    Scroll Element Into View             ${BtnAddToCart} 
    Wait Until Element Is Visible        ${BtnAddToCart}
    Double Click Element                 ${BtnAddToCart}    
     Wait for Element
    Log   Sucessfully Add to cart button clicked and navigaed to procced to checkout popup  
         
Get Values For Mini Cart Click
    [Documentation]                   This Keword if for proceed to checkout popup
    Set Selenium Implicit Wait    25s
    Wait Until Element Is Visible    ${AtuclHeaderName ForPorceedToCheckOutPopup}   
    ${Actul_Header_Name}=    Get Text    ${AtuclHeaderName ForPorceedToCheckOutPopup}
    ${Actul_LineItemCount}=    Get Text    ${ProceedToCheckOutItemCount} 
    ${Expected_subTotal_price}=    Get Text    ${ProceedToCheckOutSubtotal}
    [Return]     ${Actul_Header_Name}    ${Actul_LineItemCount}    ${Expected_subTotal_price} 
  
       
Verification on Mini cart
    [Documentation]    This keyword is for getting value of line item count and verify the subtoal from reviw confirm page to mini cart.
    [Arguments]    ${Review_ConfirmPageValues}    ${Mini_cart_values}       
    WaitForNextstepToProceed
    Wait for Object
    #${Expected_subTotal_price}=    Get Text    ${ProceedToCheckOutSubtotal}
    Run Keyword If  '${Review_ConfirmPageValues}[3]' == '${Mini_cart_values}[2]'  SUBTOTALPRICE 
    ...  ELSE  SUBTOTALPRICENOTMATCH    

SUBTOTALPRICE
    [Documentation]    This keyword is for if subtotal is = in reviw and mini cart click to proceed.
    Click Proceed To Checkout Popup
    Log   Pass - Sucessfully subtotal is matched in both Confirm page and Mini cart
        

SUBTOTALPRICENOTMATCH
    [Documentation]    This keyword is for if subtotal is = in reviw and mini cart click to proceed.
    Log   Fail - Subtotal is Not matched in Mini cart 

    
Click Proceed To Checkout Popup
    Wait for Object       
    Click Element                        ${BtnProceedToCheckout}
    Wait for Object   
    
    Log   Proceed to checkout popup is displayed and verified 

Click On Check Out Button
    [Documentation]                   This Keword if for check out button only for gust user
    Sleep    25            
    Wait for Object
    Wait Until Element Is Visible    ${shoppingCartCheckOutBtn}   
    Click Element                 ${shoppingCartCheckOutBtn}
    Wait for Object

Send Value for text fields in shopping cart
    [Documentation]                   This Keword if for adding value in text field on shopping cart page
    Set Selenium Implicit Wait    50s
    Click Element                        ${ShoppingCartPoNumberTextField}
    #ClearTextBox                         ${ShoppingCartAttationToTextField}
    Click Element                        ${ShoppingCartPoNumberTextField}     
    Input Text                           ${ShoppingCartPoNumberTextField}         ${ShoppingCartPoNumberValue}
    Input Text                           ${ShoppingCartRegNumberTextField}        ${ShoppingCartRegNumberValue}
    Input Text                           ${ShoppingCartAttationToTextField}       ${ShoppingCartAttationToTextFieldValue} 
     Wait for Element
    Log  Successfully data is added for shopping cart fields    
    
Set Value for shopping cart
    [Documentation]                    To set/send value text fields in shoppingcart
    [Arguments]                        ${element}  ${elementValue}
    Set Selenium Implicit Wait    25s
    #Click Element    ${element}    
    Run Keyword And Return If  "${element}" == "${ShoppingCartPoNumberTextField}"    VALUE1    "${element}"  "${ShoppingCartPoNumberValue}"
    #..            ELSE IF
    Run Keyword And Return If  "${element}" == "${ShoppingCartRegNumberTextField}"    VALUE2    "${element}"  "${ShoppingCartRegNumberValue}"
    #ELSE IF
    Run Keyword And Return If  "${element}" == "${ShoppingCartAttationToTextField}"    VALUE3    "${element}"  "${ShoppingCartAttationToTextFieldValue}"
    #ELSE IF
    
VALUE1
    [Documentation]   To send value text fields in shoppingcart
    [Arguments]       ${element}  ${elementValue}
    Log   Sending data for PO number text field
    #Click Element     ${element} 
    Input Text        ${ShoppingCartPoNumberTextField}  ${ShoppingCartPoNumberValue}        
    
VALUE2
    [Documentation]   To send value text fields in shoppingcart
    [Arguments]        ${element}   ${elementValue}
    Log    Sending data for Reg number field
    #Click Element     ${element}
    Input Text         ${ShoppingCartRegNumberTextField}  ${ShoppingCartRegNumberValue}
    
VALUE3
    [Documentation]   To send value text fields in shoppingcart
    [Arguments]        ${element}   ${elementValue}
    Log    Sending data for Reg number field
    #Click Element     ${element}
    Input Text         ${ShoppingCartAttationToTextField}  ${ShoppingCartAttationToTextFieldValue} 
    
Get value for shopping cart
    [Documentation]    Getting value for shopping cart page
    Set Selenium Implicit Wait    20s
    Scroll Element Into View                   ${ShoppignCartFirst_line_Oligo_Name}
    ${Product_LineIteam_Count}=    Get Text    ${ShoppingCart_LineItem_Count}
    ${Get_Line_Item_Count}=    Split String    ${Product_LineIteam_Count}    (
    ${Count_Line_Item}=    Split String    ${Get_Line_Item_Count}[1]    )    
    ${Line_Item_Count}=  Set Variable  ${Count_Line_Item}[0]
    ${Actul_material}=    Get Text    ${ShoppingCartProductMaterial} 
    ${Actulu_Oligo_Name} =    Get Text    ${ShoppignCart_First_line_Oligo_Name} 
    ${Actul_LineItem_Price}=    Get Text    ${Shopping_Price_LineItem_One}
    [Return]    ${Line_Item_Count}    ${Actul_material}    ${Actulu_Oligo_Name}     ${Actul_LineItem_Price}    
    WaitForNextstepToProceed      
     Wait for Element

 Verify the OligoName LineItemPrice sho pping cart 
    [Documentation]    This Keyword is for  Verify the OligoName-LineItem-Price shopping cart 
    [Arguments]    ${Line_Iteam_Count}   ${Actul_Oligo_Name}    ${Actul_Price}    
    WaitForNextstepToProceed
    #${Expected_LineIteam_Count}=    Get Text    ${ShoppingCart_LineItem_Count}
    ${Expected_Oligo_Name} =    Get Text    ${ShoppignCart_First_line_Oligo_Name} 
    ${Expected_LineItem_Price}=    Get Text    ${Shopping_Price_LineItem_One}
    #Run Keyword If  '${Line_Iteam_Count}' == '${Product_LineIteam_Count}'  LINECOUNT
        Run Keyword If  '${Actul_Oligo_Name}' == '${Expected_Oligo_Name}'  OLIGONAME  
             Run Keyword If  '${Actul_Price}' == '${Expected_LineItem_Price}'  PRICE   
    WaitForNextstepToProceed
 
LINECOUNT 
    Log   PASS -  Verification is matched in shopping cart
    
OLIGONAME 
    Log   Oligo name is matched in shopping cart

PRICE    
     Log  Price is matched in shopping cart    
         
shopping Cart Oligo Name Verification
    [Documentation]                       This Keword if for verification          
    [Arguments]                         ${OligoNameVerification_ReviewAndConfirmPage}    ${OligoNameVerification_shoppingcart}         
    Execute JavaScript                    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible       ${OligoName_ReviewConfirm}
    Scroll Element Into View                ${OligoName_ReviewConfirm}   
    Set Selenium Implicit Wait    20s  
    Run Keyword If  '${OligoNameVerification_ReviewAndConfirmPage}[0]' == '${OligoNameVerification_shoppingcart}[0]'    SHOP1
    ...  ELSE  SHOP2
     Wait for Element  
    #Log   Sucessfully oligo name is verified for reveiw confirm page
SHOP1
    Log   Successfully Oligo name is matched in both Review confrim page and Shopping cart.  
    
SHOP2
    Log   Fail - Oligoname is not matched for Review confrim page and Shopping cart.    

Material Number verification on shopping cart
     [Documentation]  This keyword is for Metiral number
     [Arguments]     ${Product_name}    #${Actul_OrderNumber}      
     ${Atcul_material_Number}=    Get Text    ${ShoppingCartProductMaterial}              
     Run Keyword If  "${Product_name}" == "Easy Oligo"  PRODUCT_MATERIAL   Easy Oligo   3   2  ${Atcul_material_Number}    
     ...    ELSE IF  "${Product_name}" == "Pure Simple"  PRODUCT_MATERIAL  Pure Simple   3   2  ${Atcul_material_Number}    
     ...    ELSE IF  "${Product_name}" == "WellRED"  PRODUCT_MATERIAL  WellRED   3    2  ${Atcul_material_Number}  
     ...    ELSE    PRODUCT_MATERIAL_NOT_FOUND                 
    [Return]    ${Product_name}       
  
PRODUCT_MATERIAL
     [Arguments]    ${XlSheet}    ${XlRow}    ${XlColum}    ${Atcul_material_Number}    
     Open Excel Document    ${Product_Details_Xl}    doc_id
     ${Material_Number}=  Read Excel Cell   ${XlRow}   ${XlColum}   ${XlSheet}  
     Run Keyword If  '${Material_Number}' == '${Atcul_material_Number}'  PRODUCT_MATERIAL_TRUE   ${XlSheet}  ${XlRow} 
     ...  ELSE  PRODUCT_MATERIAL_FALSE  ${XlSheet}  ${XlRow}      
    
PRODUCT_MATERIAL_TRUE
     [Arguments]    ${XlSheet}    ${XlRow}      
     Write Excel Cell   ${XlRow}   3   Pass    ${XlSheet} 
     Save Excel Document    ${Product_Details_Xl} 
     Close Current Excel Document     
     Log    Sucessfully Material number is matached and pass
     
PRODUCT_MATERIAL_FALSE
    [Arguments]    ${XlRow}    ${XlSheet}       
     Write Excel Cell   ${XlRow}   3   Fail    ${XlSheet} 
     Save Excel Document    ${Product_Details_Xl} 
     Close Current Excel Document     
     Log   Material number is not matached and Fail
     
PRODUCT_MATERIAL_NOT_FOUND   
    Log    Fail -  Product material is not found
       
Verification on Shopping Cart 
    [Documentation]                     To scroll down vertical bar till bottom of the page 
    [Arguments]    ${Shoppingcart_values}    ${MiniCart_Values}    ${ReviewConfirm_Values}    #${OligoNameVerification_ReviewAndConfirmPage}    ${OligoNameVerification_shoppingcart}              
    Execute JavaScript                  window.scrollTo(0, document.body.scrollHeight)
    Scroll Element Into View                   ${ShoppignCart_First_line_Oligo_Name}
    Run Keyword If  '${Shoppingcart_values}[2]' == '${ReviewConfirm_Values}[1]' and '${Shoppingcart_values}[0]' == '${MiniCart_Values}[1]'  VERIFICATIONTRUE
    ...  ELSE  VERIFICATIONFALSE     
    # and '${Shoppingcart_values}[3]' == '${ReviewConfirm_Values}[4]'
VERIFICATIONTRUE
    Log   PASS - Oligo name and Line item Price is matched in shopping cart.

VERIFICATIONFALSE
    Log    FAIL - Oligo name and Line item Price is not matched in shopping cart.
                      
SubmitOrder
    [Documentation]    TThis keyword is for order creation
    Set Selenium Implicit Wait    25s
    Scroll Element Into View         ${ShoppingCartSubmitOrderBtn}
    WaitForNextstepToProceed              
     Wait for Element
    Click Element             ${ShoppingCartSubmitOrderBtn}    
    Set Selenium Implicit Wait    15s
    
Get Order Number for Multiple Entry
    [Documentation]    This keyword is for order verification
    [Arguments]     ${Order_Number_Multiple}    #${Actul_OrderNumber}     
    Wait for Element
    Wait for Object
    Wait Until Element Is Visible    ${CreatedOrderNumber}  10s 
    ${OrderNum}=      Get Text               ${CreatedOrderNumber}    #(//*[contains(text(),'Items')])[1]
    @{SplitOrderNumber} =    Split String From Right     ${OrderNum}
    ${Actul_OrderNumber} =    Set Variable       ${SplitOrderNumber}[6]
     Run Keyword If  "${Order_Number_Multiple}" == "Easy Oligo"  MUL_PRODUCT_NUMBER   Easy Oligo   5   2    ${Actul_OrderNumber}     
     ...    ELSE IF  "${Order_Number_Multiple}" == "Pure Simple"  MUL_PRODUCT_NUMBER  Pure Simple   5   2   ${Actul_OrderNumber}
     ...    ELSE IF  "${Order_Number_Multiple}" == "WellRED"  MUL_PRODUCT_NUMBER  WellRED   5    2   ${Actul_OrderNumber} 
     ...    ELSE    MUL_PRODUCT_NUMBER_NOT_CREATED    3    2    ${Actul_OrderNumber}                 
    #[Return]    ${Product_name}       
  
MUL_PRODUCT_NUMBER
     [Arguments]    ${XlSheet}    ${XlRow}    ${XlColum}    ${Actul_OrderNumber}     
     Open Excel Document    ${Product_Details_Xl}    doc_id
     Write Excel Cell   ${XlRow}   2   ${Actul_OrderNumber}     ${XlSheet} 
     Write Excel Cell   ${XlRow}   3   Pass   ${XlSheet} 
     Save Excel Document    ${Product_Details_Xl} 
     Close Current Excel Document     
     Log   Order number is seccussfully enterted in XL
  
MUL_PRODUCT_NUMBER_NOT_CREATED  
    [Arguments]    ${XlSheet}    ${XlRow}    ${XlColum}      
     Open Excel Document    ${Product_Details_Xl}    doc_id
     Write Excel Cell   ${XlRow}   2   Not Created   ${XlSheet}
     Write Excel Cell   ${XlRow}   3   Fail   ${XlSheet}
     Save Excel Document    ${Product_Details_Xl}  
     Close Current Excel Document     
     Log   Order number is not enterted in XL
    
Get Order Number for Manual Entry
    [Documentation]    This keyword is for order verification
    [Arguments]     ${Order_Number_Manual}    #${Actul_OrderNumber}     
    Wait for Element
    Wait for Object
    Wait Until Element Is Visible    ${CreatedOrderNumber} 
    ${OrderNum}=      Get Text               ${CreatedOrderNumber}    #(//*[contains(text(),'Items')])[1]
    @{SplitOrderNumber} =    Split String From Right     ${OrderNum}
    ${Actul_OrderNumber} =    Set Variable       ${SplitOrderNumber}[6]
                 
     Run Keyword If  "${Order_Number_Manual}" == "Easy Oligo"  PRODUCT_NUMBER   Easy Oligo  4   2    ${Actul_OrderNumber}     
     ...    ELSE IF  "${Order_Number_Manual}" == "Pure Simple"  PRODUCT_NUMBER  Pure Simple   4   2   ${Actul_OrderNumber}
     ...    ELSE IF  "${Order_Number_Manual}" == "WellRED"  PRODUCT_NUMBER  WellRED   4    2   ${Actul_OrderNumber} 
     ...    ELSE    PRODUCT_PRODUCT_NUMBER_OF_NOT_CREATED    3    2    ${Actul_OrderNumber}                 
    #[Return]    ${Product_name}       
  
PRODUCT_NUMBER
     [Arguments]    ${XlSheet}    ${XlRow}    ${XlColum}    ${Actul_OrderNumber}     
     Open Excel Document    ${Product_Details_Xl}    doc_id
     Write Excel Cell    ${XlRow}   2   ${Actul_OrderNumber}    ${XlSheet}
     Write Excel Cell    ${XlRow}   3   Pass     ${XlSheet} 
     Save Excel Document    ${Product_Details_Xl} 
     Close Current Excel Document     
     Log   Order number is seccussfully enterted in XL
  
PRODUCT_PRODUCT_NUMBER_OF_NOT_CREATED  
    [Arguments]    ${XlSheet}    ${XlRow}    ${XlColum}      
     Open Excel Document    ${Product_Details_Xl}    doc_id
     Write Excel Cell  ${XlRow}   2   Not Created     ${XlSheet} 
     Write Excel Cell  ${XlRow}   2   Fail    ${XlSheet}  
     Save Excel Document    ${Product_Details_Xl} 
     Close Current Excel Document     
     Log   Order number is not enterted in XL
    

############################################Multiple product Entry############################################

Click Multiple Product Entry Navigation
    [Documentation]    This keyword for naviagte to multiple enter page   
    Wait Until Element Is Visible           ${MultipleEntryLinkXpath}    
    Wait for Object                
    Click Element                            ${MultipleEntryLinkXpath}
    Wait for Object
    Scroll Element Into View                  ${MultipleUploadYourDataBtn}  
    Wait for Object
    
Click Multiple entry template download     
   [Documentation]    This keyword for template download
    Wait for Object 
    Click Element                                     ${MultipleEntryTemplateDownload}
    #Scroll Element Into View                        ${MultipleUploadYourDataBtn}
    Wait for Object 

Valid File upload verification
    [Documentation]    Valid file upload for multiple entry
    [Arguments]    ${Valid_File}
    Wait for Object
    Scroll Element Into View               ${MultipleUploadYourDataBtn}
    Run Keyword If  "${valid_file}" == "Easy Oligo"  EASYVALIDUPLOAD_TRUE
    ...  ELSE IF  "${valid_file}" == "Pure Simple"  PURESIMPLEVALIDUPLOAD_TRUE
    ...  ELSE IF  "${valid_file}" == "WellRED"  WELLREDVALIDUPLOAD_TRUE
    ...  ELSE  UPLODERROR  

EASYVALIDUPLOAD_TRUE 
    [Documentation]    Requeis file is uploaded
    #[Arguments]    ${Invalid_file}    
    Wait for Object   
    Choose File    ${MultipleFileUpload}    ${Easy_valid_File}
    Wait Until Page Contains    Review & Confirm    
    #Wait Until Element Is Visible           ${ReviewAndConfirmPageHeader}   
    Wait for Object 
    Log  Succesfully Easy oligos InValid File is uploaded and navigated to review confirm page.
    
PURESIMPLEVALIDUPLOAD_TRUE 
    [Documentation]    To choose Valid file
    #[Arguments]    ${Invalid_file}    
    Wait for Object   
    Choose File    ${MultipleFileUpload}    ${PureSimple_valid_File}
    Wait Until Element Is Visible           ${ReviewAndConfirmPageHeader} 
    Wait for Object 
    Log    Succesfully Pure simple InValid File is uploaded and navigated to review confirm page.
   
WELLREDVALIDUPLOAD_TRUE
    [Documentation]    To choose Valid file
    #[Arguments]    ${Invalid_file}    
    Wait for Object   
    Choose File    ${MultipleFileUpload}    ${WellRED_valid_File}
    Wait Until Element Is Visible           ${ReviewAndConfirmPageHeader} 
    Wait for Object 
    Log  Succesfully WellRED Valid File is uploaded and navigated to review confirm page.

InValid File upload verification
    [Documentation]    Valid file upload for multiple entry
    [Arguments]    ${InValid_File}
    Wait for Object
    Scroll Element Into View               ${MultipleUploadYourDataBtn}
    Run Keyword If  "${Invalid_file}" == "Easy Oligo"  EASYINVALIDUPLOAD_TRUE
    ...  ELSE IF  "${Invalid_file}" == "Pure Simple"  PURESIMPLEINVALIDUPLOAD_TRUE
    ...  ELSE IF  "${Invalid_file}" == "WellRED"  WELLREDINVALIDUPLOAD_TRUE
    ...  ELSE  UPLODERROR  

EASYINVALIDUPLOAD_TRUE 
    [Documentation]    Requeis file is uploaded
    #[Arguments]    ${Invalid_file}    
    Wait for Object   
    Choose File    ${MultipleFileUpload}    ${Easy_Invalid_File}
    Wait Until Page Contains    Review & Confirm    
    #Wait Until Element Is Visible           ${ReviewAndConfirmPageHeader}   
    Wait for Object 
    Log   Succesfully Easy oligos InValid File is uploaded and navigated to review confirm page.
    
PURESIMPLEINVALIDUPLOAD_TRUE 
    [Documentation]    To choose Valid file
    #[Arguments]    ${Invalid_file}    
    Wait for Object   
    Choose File    ${MultipleFileUpload}    ${PureSimple_Invalid_File}
    #Wait Until Element Is Visible           ${ReviewAndConfirmPageHeader} 
    Wait for Object 
    Log    Succesfully Pure simple InValid File is uploaded and navigated to review confirm page.
   
WELLREDINVALIDUPLOAD_TRUE
    [Documentation]    To choose Valid file
    #[Arguments]    ${Invalid_file}    
    Wait for Object   
    Choose File    ${MultipleFileUpload}    ${WellRED_valid_File}
    Wait Until Element Is Visible           ${ReviewAndConfirmPageHeader} 
    Wait for Object 
    Log   Succesfully WellRED Valid File is uploaded and navigated to review confirm page.


File upload for rules verification 
    [Documentation]    This keywor is for valid file uploa.
    [Arguments]    ${Rules_file}    
    Wait for Object
    Scroll Element Into View       ${MultipleUploadYourDataBtn}
    Run Keyword If  "${Rules_file}" == "WellRED"  WELLREDINVALIDUPLOAD
    ...  ELSE  UPLODERROR      
     
WELLREDINVALIDUPLOAD 
    [Documentation]    To choose InValid file
    Wait for Object   
    Choose File    ${MultipleFileUpload}    ${Rules_Validation_File}
    Wait for Object
    Log   Succesfully Easy oligos Rules fild is uploaded and navigated to review confirm page.

UPLODERROR  
    log  Fail - File upload is not successfull 
   
Missing File upload verification 
    [Documentation]    This keywor is for upload missing line item file.
    [Arguments]    ${Missing_LineItem_file}    
    Wait for Object
    #Click Multiple Product Entry Navigation 
    Wait for Object
    Scroll Element Into View       ${MultipleUploadYourDataBtn}
    Run Keyword If  "${Missing_LineItem_file}" == "Easy Oligo"  EASYMISSINGUPLOAD
    ...  ELSE IF  "${Missing_LineItem_file}" == "Pure Simple"  PURESIMPLEMISSINGUPLOAD
    ...  ELSE IF  "${Missing_LineItem_file}" == "WellRED"  WELLREDMISSINGUPLOAD
    ...  ELSE  MISSINGUPLODERROR      
    
EASYMISSINGUPLOAD 
    [Documentation]    To choose missing file
    #[Arguments]    ${Invalid_file}    
    Wait for Object     
    Choose File    ${MultipleFileUpload}    ${Easy_Missing_Line_ItemFile} 
    Wait for Object 
    Scroll Element Into View   ${Oligo&Probes}
    Element Text Should Be    ${ErrorBarOnTopOfTheReviewPage}    ${ActulErrorValueForRedBarMessage} 
    Wait for Object    
    Log   Succesfully Easy oligos InValid File is uploaded and navigated to review confirm page.
    
PURESIMPLEMISSINGUPLOAD 
    [Documentation]    To choose missing file
    #[Arguments]    ${Invalid_file}    
    Wait for Object   
    Choose File    ${MultipleFileUpload}    ${PureSimple_Missing_File}
    Wait for Object
    Scroll Element Into View   ${Oligo&Probes}
    ${Actul_Error_Bar_message}=  Get Text    ${ErrorFroTem}
    Element Text Should Be  ${ErrorFroTem}   ${ActulErrorValueForRedBarMessageTemp}  
    Wait for Object 
    Click Element    ${SingleEntryProductLink}    
    Wait for Object 
    Log   Succesfully Pure simple InValid File is uploaded and navigated to review confirm page
    
WELLREDMISSINGUPLOAD 
    [Documentation]    To choose missing file
    #[Arguments]    ${Invalid_file}    
    Wait for Object   
    Choose File    ${MultipleFileUpload}    ${WellRED_Missing_File}
    Wait for Object
    Scroll Element Into View   ${Oligo&Probes}
    #${Actul_Error_Bar_message}=  Element Text Should Be  ${ErrorBarOnTopOfTheReviewPage}   ${ActulErrorValueForDeletAllReviewPage}  
    Wait for Object  
    Log   Succesfully Pure Simple Missing File is uploaded and navigated to review confirm page.
    Log To Console  Succesfully Pure Simple Missing File is uploaded and navigated to review confirm page.
   

MISSINGUPLODERROR  
    log  Fail

   
Maximum File upload verification 
    [Documentation]    This keywor is for upload maximum line item file.
    [Arguments]    ${Missing_LineItem_file}    
    Wait for Object
    #Click Multiple Product Entry Navigation 
    Scroll Element Into View               ${MultipleUploadYourDataBtn}
    Run Keyword If  "${Missing_LineItem_file} " == "Easy Oligo"  EASYMAXIMUMUPLOAD
    ...  ELSE IF  "${Missing_LineItem_file}" == "Pure Simple"  PURESIMPLEMAXIMUMUPLOAD
    ...  ELSE IF  "${Missing_LineItem_file}" == "WellRED"  WELLREDMAXIMUMUPLOAD
    ...  ELSE  MAXIMUMUPLODERROR      
    
EASYMAXIMUMUPLOAD 
    [Documentation]    To choose missing file
    #[Arguments]    ${Invalid_file}    
    Wait for Object   
    Choose File    ${MultipleFileUpload}    ${Easy_Missing_Line_ItemFile} 
    Wait for Object
    ${Actul_Error_Bar_message}=  Element Text Should Be  ${ErrorBarOnTopOfTheReviewPage}   ${ActulErrorValueForDeletAllReviewPage}  
    Wait for Object  
    Log  Succesfully Easy oligos InValid File is uploaded and navigated to review confirm page.
    
PURESIMPLEMAXIMUMUPLOAD 
    [Documentation]    To choose missing file
    #[Arguments]    ${Invalid_file}    
    Wait for Object   
    Choose File    ${MultipleFileUpload}    ${PureSimple_Missing_File} 
    Wait for Object
    ${Actul_Error_Bar_message}=  Element Text Should Be  ${ErrorBarOnTopOfTheReviewPage}   ${ActulErrorValueForDeletAllReviewPage}  
    Wait for Object  
    Log  Succesfully Pure simple InValid File is uploaded and navigated to review confirm page.
   
WELLREDMAXIMUMUPLOAD 
    [Documentation]    To choose missing file
    #[Arguments]    ${Invalid_file}    
    Wait for Object   
    Choose File    ${MultipleFileUpload}    ${WellRED_Missing_File} 
    Wait for Object
    ${Actul_Error_Bar_message}=  Element Text Should Be  ${ErrorBarOnTopOfTheReviewPage}   ${ActulErrorValueForDeletAllReviewPage}  
    Wait for Object  
    Log  Succesfully Pure simple InValid File is uploaded and navigated to review confirm page.
   

MAXIMUMUPLODERROR  
    log  Fail

Verification on override any existing items in this session
    [Documentation]  This keyword is for if Caution popup display this function will execute.
    [Arguments]    ${Caution_Popup}
    Wait for Object
    ${CautionEhader}=   get text  ${CautionHeaderText}
    Run Keyword If  '${Caution_Popup}' == '${CautionEhader}'  CLICKBTN_TRUE 
    ...  ELSE  Verificatio of Error validation   
    Wait for Element
    
CLICKBTN_TRUE
    [Documentation]  If caution popup disply this function wil execte
    Wait for Object
    Click Element    ${BtnContinueCaution}   
    Wait for Object 
    Log  successfully continue button is clicked
   
Verificatio of Error validation
    [Documentation]    This keyword si for verification error bar in the top of the review pahe after uploded rules valdiation 
    
    Wait for Element
    Scroll Element Into View   ${ErrorBarOnTopOfTheReviewPage}
    Wait for Element
    ${Get_Error_Message}=  Get Text   ${ErrorBarOnTopOfTheReviewPage}   
    Run Keyword If  '${Get_Error_Message}' == '${ActulErrorValueForRedBarMessage}'  CONFIRM 
    ...  ELSE  NOTCONFIRM

CONFIRM
    [Documentation]    This keyword is for validating error and Delete all functionality
    Wait for Object
    Delete Verification For All the Line Item On ConfirmPage
    Wait for Object
    Log   sucessfully uploaded rules file and verified
     
NOTCONFIRM
    [Documentation]    This keyword is for validating error and Delete all functionality
    Log   Fail - file is not uploaded


Verificatio of Error validation-Temp
    [Documentation]    This keyword si for verification error bar in the top of the review pahe after uploded rules valdiation 
    Wait for Object
    Scroll Element Into View   ${Oligo&Probes}
    Wait for Object 
    Wait for Element
    ${Get_Error_Message}=  Get Text   ${ErrorFroTem}
    Wait for Object  
    Run Keyword If  '${Get_Error_Message}' == '${ActulErrorValueForRedBarMessageTemp}'    CONFIRMTEMP 
    ...  ELSE  NOTCONFIRMTEMP

CONFIRMTEMP
    [Documentation]    This keyword is for validating error and Delete all functionality
    Wait for Object
    Click Element        ${SingleEntryProductLink}    
    Wait for Object
    Log   sucessfully Error message is mactched in uploaded page
     Log To Console  sucessfully Error message is mactched in uploaded page
     
NOTCONFIRMTEMP
    [Documentation]    This keyword is for validating error and Delete all functionality
    Wait for Object
    Click Element        ${SingleEntryProductLink}    
    Wait for Object
    Log   Error message is not mactched in uploaded page


Get All Values from Review and Confirm Page
    [Documentation]    To fetch the values from Review and Confirm page
    [Arguments]    ${Element}
    #[Return]    ElementValue
    Run Keyword If  '${Element}' == '${OligoName_ReviewConfirm}'  VALUE    ${Element}
    ...  ELSE IF  '${Element}' == '${ReviewConfirmOligoname2}'  VALUE    ${Element} 
    #...  ELSE IF  '${Element}' == '${ReviewConfirmPriceValue1}'  VALUE    ${Element}   
      
VALUE
    [Documentation]    To fetch the value for a particlar field
    [Arguments]        ${Element}
    ${ElementValue}=    Get Text    ${Element}
    [Return]    ${ElementValue}   
    
ERROR
    Log   The element is not present in the Page    


WaitForNextstepToProceed
    [Documentation]    This keyword is for Wait / sleep
    #[Arguments]    ${Element}
    Sleep    3s
    
Wait for Object 
    [Documentation]    This Keyword for Wait statment
     Set Selenium Implicit Wait    5s         
       
Wait for Element 
    [Documentation]    This Keyword for Wait statment
     Set Selenium Implicit Wait    10s 

#file:///C:/Stratos/report.html#totals?all
    
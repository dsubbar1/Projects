*** Settings ***
Library    SeleniumLibrary    
Library    ExcelLibrary
Library    String
    

#Library    DataDriver    C:\\Stratos\\Robot\\TestData\\LoginDetails.xlsx     

Resource    ../../../Resoruces/Locatores.robot   
Resource    ../../../Resoruces/CommonResources.robot
Resource    ../../../Resoruces/ConfiguratorApplicationSpeficKeyword.robot
Resource    ../../../Resoruces/ConfiguratorCommonFunctions.robot
                 
*** Test Cases *** 
Order Creation for WellRed product using Manual entry option. 
    [Documentation]   Thi keyword is for Wellred script execution
    Open Browser    http://ae1c-ecomdev-mlb01:30013/IN/en/configurators/tube?product=wellred     gc
    Select Region    Asia Pacific    IN
    Login              
    #Select Language    
    clear Items From Mini Cart
    #Product Navigation
    #Select Configurator Product From List    Easy Oligos
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Verify the Sequence Properties section
    Verify The Base Count Value    PreviewBaseFieldCount    Actul_BaseCount
    ${ProductSummary_SequencePageValues}=   Get Values from Sequence page and product summary section - WellRed    Sequence
    Selection of 5 Modification    D4=PA     
    Specification selecation
    Navigation From Sequence entry page to reiew and confirm page
    ${Review_ConfirmPageValues}=     Get Values from review and confrim page
    Verification of Values in SequencePage And ReviewConfirm Page    ${ProductSummary_SequencePageValues}    ${Review_ConfirmPageValues}       
    Click Add Oligo From confirmpage
    #Navigation From Sequence entry page to reiew and confirm page
    #SequenceFieldValidation
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Selection of 5 Modification    D3=PA
    Specification selecation
    Click Add Oligo Button at the bottom of the page
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Selection of 5 Modification    D2=PA
    Specification selecation
    Click Add Button Oligo From Product Summary
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Selection of 5 Modification    D4=PA
    Specification selecation
    Navigation From Sequence entry page to reiew and confirm page   
    ${Review_ConfirmPageValues}=     Get Values from review and confrim page
    Web Price Verification on Review & Confirm page    WellRED     
    Click Add To Cart
    ${MiniCart_Values}=    Get Values For Mini Cart Click    
    Verification on Mini cart    ${Review_ConfirmPageValues}    ${MiniCart_Values}
    Click On Check Out Button
    Send Value for text fields in shopping cart
    ${Shoppingcart_values}=    Get value for shopping cart
    Verification on Shopping Cart    ${Shoppingcart_values}    ${MiniCart_Values}    ${Review_ConfirmPageValues}     
    Material Number verification on shopping cart    WellRED
    SubmitOrder
    Get Order Number for Manual Entry    WellRED 
    Close Browser

Order Creation for WellRED product using Multiple entry option
    [Documentation]    This Suite test for valid file upload for easyo oligo product
    Open Browser    http://ae1c-ecomdev-mlb01:30013/IN/en/configurators/tube?product=wellred     gc
    Select Region    Asia Pacific    IN
    Login
    #ProductNavigation
    #Clear Items From Mini Cart 
    #SelectLanguage
    Click Multiple Product Entry Navigation
    #Click Multiple entry template download
    Valid File upload verification    WellRED     
    ${OligoNameVerification_ReviewAndConfirmPage}=     Get Values from review and confrim page
    Web Price Verification on Review & Confirm page    WellRED     
    Click Add To Cart
    Click Proceed To Checkout Popup
    Click On Check Out Button
    Send Value for text fields in shopping cart
    ${OligoNameVerification_shoppingcart}=    Get value for shopping cart
    Material Number verification on shopping cart    WellRED  
    SubmitOrder
    Get Order Number for Multiple Entry    WellRED
    Close Browser

Verify the functionality in Sequence Entry Page
    [Documentation]    This Keyword is for Verify the functionality in Sequence Entry Page and delete functinality for single  & al line item
    Open Browser    http://ae1c-ecomdev-mlb01:30013/CN/en/configurators/tube?product=wellred    gc
    Select Region    Asia Pacific    IN
    Login
    #Clear Items From Mini Cart  
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box 
    Verify the Sequence Properties section
    Verify The Base Count Value    PreviewBaseFieldCount    Actul_BaseCount
    #${ProductSummary_SequencePageValues}=   Get Values from Sequence page and product summary section - WellRed    Sequence
    Selection of 5 Modification    D4=PA     
    #Specification selecation
    ${Rules_Values}=    Get value for WellRED spcification
    Specification selecation based on the Rules  2 OD   
    Navigation From Sequence entry page to reiew and confirm page
    #${Review_ConfirmPageValues}=     Get Values from review and confrim page
    #Verification of Values in SequencePage And ReviewConfirm Page    ${ProductSummary_SequencePageValues}    ${Review_ConfirmPageValues}       
    Click Add Oligo From confirmpage
    #Navigation From Sequence entry page to reiew and confirm page
    #SequenceFieldValidation
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Selection of 5 Modification    D3=PA
    #Specification selecation
    Specification selecation based on the Rules  4 OD 
    Click Add Oligo Button at the bottom of the page
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Selection of 5 Modification    D2=PA
    #Specification selecation
    Specification selecation based on the Rules   5 OD 
    Click Add Button Oligo From Product Summary
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Selection of 5 Modification    D4=PA
    #Specification selecation
    Specification selecation based on the Rules    10 OD 
    Click View All Link in Product Summary   
    Delete Verification For Singel Line Item On View All Popup
    Delete Verification For All the Line Item On View All Popup
    Verification of Sequence Information page
    Close Browser

Verify the functionality in Review & Confirm Page
    [Documentation]    This test case for verifythe review and cofirm page
    Open Browser    http://ae1c-ecomdev-mlb01:30013/CN/en/configurators/tube?product=easyoligo    gc
    Select Region    Asia Pacific    IN
    Login
    Clear Items From Mini Cart  
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Click Add Oligo Button at the bottom of the page
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    #${ProductSummary_SequencePageValues}=  Get Values from Sequence page and product summary section - Easy Oligo    Sequence    
    Navigation From Sequence entry page to reiew and confirm page
    Click Add Oligo From confirmpage
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Navigation From Sequence entry page to reiew and confirm page    
    ${Review_ConfirmPageValues}=     Get Values from review and confrim page
    #Oligo Name Verification on Review And Confirm Page    ${ProductSummary_SequencePageValues}    ${Review_ConfirmPageValues}
    #Web Price Verification on Review & Confirm page    Easy Oligos       
    #VerificationOfAcknowladegTextArea
    Delete Verification For Singel Line Item Cnconfirm Page
    Delete Verification For All the Line Item On ConfirmPage
    Verification of Sequence Information page
    Close Browser

Rules Verification in Multiple entry - WellRED
    [Documentation]    This Suite test for valid file upload for easyo oligo product
    Open Browser    http://ae1c-ecomdev-mlb01:30013/CN/en/configurators/tube?product=wellred     gc
    Select Region    Asia Pacific    IN
    Login
    #ProductNavigation    
    #Clear Items From Mini Cart 
    #SelectLanguage
    Click Multiple Product Entry Navigation
    #Click Multiple entry template download
    File upload for rules verification    WellRED 
    #Verification on override any existing items in this session    Caution_Popup
    Delete Verification For All the Line Item On ConfirmPage
    #Verificatio of Error validation
    Missing File upload verification   WellRED
    Verificatio of Error validation-Temp 
    Maximum File upload verification    WellRED
    Verificatio of Error validation-Temp 
    Verification of Sequence Information page
    Close Browser
    
    





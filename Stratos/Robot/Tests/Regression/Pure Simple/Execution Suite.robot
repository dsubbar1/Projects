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
Order Creation for Pure Simple product using Manual entry option.
    [Documentation]  This test case is for creating order with Oligo name and price verification for confirm page to shopping cart page.
    Open Browser    http://ae1c-ecomdev-mlb01:30013/CN/en/configurators/tube?product=puresimple    gc
    Select Region    Asia Pacific    IN
    Login              
    #Select Language    
    clear Items From Mini Cart
    #Product Navigation
    #Select Configurator Product From List    Easy Oligos
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Verify the Sequence Properties section
    Verify the Base Count value   PreviewBaseFieldCount    Actul_BaseCount
    ${ProductSummary_SequencePageValues}=  Get Values from Sequence page and product summary section - Easy Oligo    Sequence 
    Verify Specification section for Pure simple
    Verify Shipping Options Easy Oligos Pure simple 
    Click Add Oligo Button at the bottom of the page
    Navigation From Sequence entry page to reiew and confirm page
    Sequence Page Validation
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Navigation From Sequence entry page to reiew and confirm page
    ${ReviewConfirm_Values}=     Get Values from review and confrim page 
    Verification of Values in SequencePage And ReviewConfirm Page    ${ProductSummary_SequencePageValues}    ${ReviewConfirm_Values}   
    Web Price Verification on Review & Confirm page   Pure Simple     
    Click Add To Cart
    ${MiniCart_Values}=    Get Values For Mini Cart Click    
    Verification On Mini cart    ${ReviewConfirm_Values}    ${MiniCart_Values}
    Click On Check Out Button
    Send Value for text fields in shopping cart
    ${Shoppingcart_values}=    Get value for shopping cart
    Verification on Shopping Cart    ${Shoppingcart_values}    ${MiniCart_Values}    ${ReviewConfirm_Values}    
    Material Number verification on shopping cart    Pure Simple
    SubmitOrder
    Get Order Number for Manual Entry   Pure Simple 
    Close Browser     
    
Order Creation for Pure Simple product using Multiple entry option.
    [Documentation]  This test case is for creating order with Oligo name and price verification for confirm page to shopping cart page.
    Open Browser    http://ae1c-ecomdev-mlb01:30013/CN/en/configurators/tube?product=puresimple    gc
    Select Region    Asia Pacific    IN
    Login
    #Sleep    15s               
    #SelectLanguage    
    Clear Items From Mini Cart
    #ProductNavigation
    #SelectConfiguratorProductFromList    Easy Oligos
    Click Multiple Product Entry Navigation
    Click Multiple entry template download 
    Valid File upload verification    Pure Simple
    ${OligoNameVerification_ReviewAndConfirmPage}=     Get Values from review and confrim page 
    Web Price Verification on Review & Confirm page    Pure Simple    
    Click Add To Cart
    Click Proceed To Checkout Popup
    Click On Check Out Button
    Send Value for text fields in shopping cart
    ${OligoNameVerification_shoppingcart}=    Get value for shopping cart
    Material Number verification on shopping cart    Pure Simple
    SubmitOrder
    Get Order Number for Multiple Entry    Pure Simple     
    Close Browser   
    
Verify the functionality in Sequence Entry Page
    [Documentation]    This Keyword is for Verify the functionality in Sequence Entry Page and delete functinality for single  & al line item
    Open Browser    http://ae1c-ecomdev-mlb01:30013/CN/en/configurators/tube?product=puresimple    gc
    Select Region    Asia Pacific    IN
    Login
    Clear Items From Mini Cart  
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box 
    Click Add Oligo Button at the bottom of the page
    Enter Maximum Oligo Name
    Enter Valid Oligo Name
    Enter Minimum Sequence Entry - Pure simple
    Enter Maximum Sequence Entry - Pure simple
    Enter Invalid Sequence Entry
    Enter valid Sequence in Sequence text box
    Verify Specification section for Pure simple
    Verify Shipping Options Easy Oligos Pure simple
    Click Add Button Oligo From Product Summary
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Click View All Link in Product Summary   
    Delete Verification For Singel Line Item On View All Popup
    Delete Verification For All the Line Item On View All Popup
    Verification of Sequence Information page
    Close Browser
    
Verify the functionality in Review & Confirm Page - Pure Simple
    [Documentation]    This test case for verifythe review and cofirm page
    Open Browser    http://ae1c-ecomdev-mlb01:30013/CN/en/configurators/tube?product=puresimple    gc
    Select Region    Asia Pacific    IN
    Login
    Clear Items From Mini Cart  
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Click Add Oligo Button at the bottom of the page
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    ${ProductSummary_SequencePageValues}=  Get Values from Sequence page and product summary section - Easy Oligo    Sequence
    Navigation From Sequence entry page to reiew and confirm page
    Click Add Oligo From confirmpage
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Navigation From Sequence entry page to reiew and confirm page    
    ${Review_ConfirmPageValues}=     Get Values from review and confrim page
    Oligo Name Verification on Review And Confirm Page    ${ProductSummary_SequencePageValues}    ${Review_ConfirmPageValues}
    Web Price Verification on Review & Confirm page    Pure Simple 
    #VerificationOfAcknowladegTextArea
    Delete Verification For Singel Line Item Cnconfirm Page
    Delete Verification For All the Line Item On ConfirmPage
    Verification of Sequence Information page
    Close Browser
    
Verify the Business Rules for Pure Simple
    [Documentation]    This keyword is for Rules validation for Easy oligo
    Open Browser    http://ae1c-ecomdev-mlb01:30013/CN/en/configurators/tube?product=puresimple    gc
    Select Region    Asia Pacific    IN
    Login              
    #clear Items From Mini Cart
    #ProductNavigation
    #SelectConfiguratorProductFromList    Easy Oligos
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Verify the Sequence Properties section    
    Verify the Base Count value   PreviewBaseFieldCount    Actul_BaseCount
    Verify Specification section for Pure simple
    Verify Shipping Options Easy Oligos Pure simple
    Delete Verification for Production Summary Section
    Verification of Sequence Information page
    Close Browser
    
Rules verification of Multiple Entry - Pure Simple
    [Documentation]    This keyword is for error validation of file upload snarios
     Open Browser    http://ae1c-ecomdev-mlb01:30013/CN/en/configurators/tube?product=puresimple    gc
    Select Region    Asia Pacific    IN
    Login               
    #Clear Items From Mini Cart
    Click Multiple Product Entry Navigation
    #Click Multiple entry template download
    Invalid File upload verification    Pure Simple 
    Delete Verification For All the Line Item On ConfirmPage
    Verification of Sequence Information page
    Click Multiple Product Entry Navigation
    Missing File upload verification    Pure Simple
    Verificatio of Error validation-Temp
    Click Multiple Product Entry Navigation
    Maximum File upload verification    Pure Simple
    Verificatio of Error validation-Temp
    Verification of Sequence Information page
    Log out
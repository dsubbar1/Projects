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
Order Creation for Easy Oligos product using Manual entry option
    [Documentation]  This is for creating order with using manual entry with verification of oligo name,sequence,base count,price,webprice,subtotal and line count
    Open Browser    http://ae1c-ecomdev-mlb01:30013/CN/en/configurators/tube?product=easyoligo    gc
    Select Region    Asia Pacific    IN
    Login
    #Sleep    10s               
    #Select Language    
    clear Items From Mini Cart
    #Product Navigation
    #Select Configurator Product From List    Easy Oligos
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Verify the Sequence Properties section
    Verify the Base Count value   PreviewBaseFieldCount    Actul_BaseCount
    ${ProductSummary_SequencePageValues}=  Get Values from Sequence page and product summary section - Easy Oligo    Sequence  
    Verify Specification section for Easy Oligos
    Verify Shipping Options Easy Oligos Pure simple 
    Click Add Oligo Button at the bottom of the page
    Navigation From Sequence entry page to reiew and confirm page
    Sequence Page Validation
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Navigation From Sequence entry page to reiew and confirm page
    ${ReviewConfirm_Values}=     Get Values from review and confrim page 
    Verification of Values in SequencePage And ReviewConfirm Page    ${ProductSummary_SequencePageValues}    ${ReviewConfirm_Values}   
    Web Price Verification on Review & Confirm page    Easy Oligo     
    Click Add To Cart
    ${MiniCart_Values}=    Get Values For Mini Cart Click    
    Verification On Mini cart    ${ReviewConfirm_Values}    ${MiniCart_Values}
    Click On Check Out Button
    Send Value for text fields in shopping cart
    ${Shoppingcart_values}=    Get value for shopping cart
    Verification on Shopping Cart    ${Shoppingcart_values}    ${MiniCart_Values}    ${ReviewConfirm_Values}    
    Material Number verification on shopping cart    Easy Oligo
    SubmitOrder
    Get Order Number for Manual Entry    Easy Oligo
    Close Browser    
    
Order Creation for Easy Oligos product using Multiple entry option
    [Documentation]    This Suite test for valid file upload for easyo oligo product
    Open Browser    http://ae1c-ecomdev-mlb01:30013/CN/en/configurators/tube?product=easyoligo    gc
    Select Region    Asia Pacific    IN
    Login
    #ProductNavigation
    Clear Items From Mini Cart 
    #SelectLanguage
    Click Multiple Product Entry Navigation
    Click Multiple entry template download
    Valid File upload verification    Easy Oligo     
    ${ReviewConfirm_Values}=     Get Values from review and confrim page        
    Web Price Verification on Review & Confirm page    Easy Oligo     
    Click Add To Cart
    ${MiniCart_Values}=    Get Values For Mini Cart Click    
    Verification On Mini cart    ${ReviewConfirm_Values}    ${MiniCart_Values}
    Click On Check Out Button
    Send Value for text fields in shopping cart
    ${Shoppingcart_values}=    Get value for shopping cart
    Verification on Shopping Cart    ${Shoppingcart_values}    ${MiniCart_Values}    ${ReviewConfirm_Values}    
    Material Number verification on shopping cart    Easy Oligo
    SubmitOrder
    Get Order Number for Multiple Entry    Easy Oligo 
    Close Browser 

Verify the functionality in Sequence Entry Page
    [Documentation]    This Keyword is for Verify the functionality in Sequence Entry Page and delete functinality for single  & al line item
    Open Browser    http://ae1c-ecomdev-mlb01:30013/CN/en/configurators/tube?product=easyoligo    gc
    Select Region    Asia Pacific    IN
    Login
    #Clear Items From Mini Cart  
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box 
    Click Add Oligo Button at the bottom of the page
    Enter Maximum Oligo Name
    Enter Valid Oligo Name
    Enter Minimum Sequence Entry
    Enter Maximum Sequence Entry
    Enter Invalid Sequence Entry
    Enter valid Sequence in Sequence text box
    Click Add Button Oligo From Product Summary
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
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

Verify the Business Rules for easy Oligos
    [Documentation]    This keyword is for Rules validation for Easy oligo
    Open Browser    http://ae1c-ecomdev-mlb01:30013/CN/en/configurators/tube?product=easyoligo    gc
    Select Region    Asia Pacific    IN
    Login               
    #clear Items From Mini Cart
    #ProductNavigation
    #SelectConfiguratorProductFromList    Easy Oligos
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Verify the Sequence Properties section
    Verify the Base Count value   PreviewBaseFieldCount    Actul_BaseCount
    Verify Specification section for Easy Oligos
    Delete Verification for Production Summary Section
    Verification of Sequence Information page
    Close Browser
    
Rules verification of Multiple Entry
    [Documentation]    This keyword is for error validation of file upload snarios
    Open Browser    http://ae1c-ecomdev-mlb01:30013/CN/en/configurators/tube?product=easyoligo    gc
    Select Region    Asia Pacific    IN
    Login               
    #Clear Items From Mini Cart
    Click Multiple Product Entry Navigation
    #Click Multiple entry template download
    InValid File upload verification    Easy Oligo      
    Delete Verification For All the Line Item On ConfirmPage
    Verification of Sequence Information page
    Click Multiple Product Entry Navigation
    Missing File upload verification    Easy Oligo   
    Verificatio of Error validation-Temp
    Click Multiple Product Entry Navigation
    Maximum File upload verification    Easy Oligo
    Verificatio of Error validation-Temp 
    Verification of Sequence Information page
    Close Browser
 
        
   

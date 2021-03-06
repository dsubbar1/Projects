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
   
Order Creation for Easy Oligos product using Manual entry option.
    [Documentation]  This test case is for creating order with Oligo name and price verification for confirm page to shopping cart page.
    Select Region    Asia Pacific    IN
    Login
    Sleep    10s               
    #Select Language    
    clear Items From Mini Cart
    #Product Navigation
    #Select Configurator Product From List    Easy Oligos
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Verify the Sequence Properties section
    Verify the Base Count value   PreviewBaseFieldCount    Actul_BaseCount
    ${ProductSummary_SequencePageValues}=  Get Values from Sequence page and product summary section
    Verify Specification section for Easy Oligos
    Verify Shipping Options Easy Oligos Pure simple 
    #ReviewAndConfirmPageBaseCountVerification    ${ProductSummary_SequencePageValues}    ${Review_ConfirmPageValues}
    Click Add Oligo Button at the bottom of the page
    Navigation From Sequence entry page to reiew and confirm page 
    Sequence Page Validation
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Navigation From Sequence entry page to reiew and confirm page    
    ${Review_ConfirmPageValues}=     Get Values from review and confrim page
    Oligo Name Verification on Review And Confirm Page     ${ProductSummary_SequencePageValues}    ${Review_ConfirmPageValues}           
    Web Price Verification on Review & Confirm page    Easy Oligos       #SubtotalPrice_ReviewConfirm
    DownloadSummaryAndCheckboxFunctionality
    Click Add To Cart
    Click Proceed To Checkout Popup    
    Click On Check Out Button
    Send Value for text fields in shopping cart
    ${OligoNameVerification_shoppingcart}=    Get value for shopping cart  
    Metireal Number verification on shopping cart    Easy Oligos    
    SubmitOrder
    Get Order Number    #Order_number   
    Close Browser
    #Logout    

Order Creation for Easy Oligos product using Multiple entry option
    [Documentation]    This Suite test for valid file upload for easyo oligo product
    Select Region    Asia Pacific    IN
    Login
    Sleep    10s
    #ProductNavigation
    Clear Items From Mini Cart 
    #SelectLanguage
    Click Multiple Product Entry Navigation
    Click Multiple entry template download 
    File upload
    ${OligoNameVerification_ReviewAndConfirmPage}=     Get Values from review and confrim page     
    Click Add To Cart
    Click Proceed To Checkout Popup
    Click On Check Out Button
    Send Value for text fields in shopping cart
    ${OligoNameVerification_shoppingcart}=    Get value for shopping cart
    Metireal Number verification on shopping cart    Easy Oligos  
    SubmitOrder
    Get Order Number    #Order_number 
    Close Browser

Verify the functionality in Sequence Entry Page
    [Documentation]    This Keyword is for Verify the functionality in Sequence Entry Page and delete functinality for single  & al line item
    Select Region    Asia Pacific    IN
    Login
    Sleep    10s
    Clear Items From Mini Cart  
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box 
    Click Add Oligo Button at the bottom of the page
    Enter Maximum Oligo Name
    InvalidOligoName
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
    Select Region    Asia Pacific    IN
    Login
    Sleep    10s
    Clear Items From Mini Cart  
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Click Add Oligo Button at the bottom of the page
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    ${ProductSummary_SequencePageValues}=  Get Values from Sequence page and product summary section
    Navigation From Sequence entry page to reiew and confirm page
    Click Add Oligo From confirmpage
    Enter Valid Oligo Name
    Enter valid Sequence in Sequence text box
    Navigation From Sequence entry page to reiew and confirm page    
    ${Review_ConfirmPageValues}=     Get Values from review and confrim page
    Oligo Name Verification on Review And Confirm Page    ${ProductSummary_SequencePageValues}    ${Review_ConfirmPageValues}
    Web Price Verification on Review & Confirm page    Easy Oligos 
    #VerificationOfAcknowladegTextArea
    Delete Verification For Singel Line Item Cnconfirm Page
    Delete Verification For All the Line Item On ConfirmPage
    Verification of Sequence Information page
    Close Browser

Verify the Business Rules for easy Oligos
    [Documentation]    This keyword is for Rules validation for Easy oligo
    Select Region    Asia Pacific    IN
    Login
    Sleep    15s                
    clear Items From Mini Cart
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
    
    
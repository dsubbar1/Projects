*** Settings ***
Library    SeleniumLibrary 
Library    ExcelLibrary      
     

Resource   ../Resoruces/Locatores.robot


*** Variables ***
${Login_excel}   C:\\Stratos\\Robot\\TestData\\LoginDetails.xlsx 
${Order_Number_excel}   C:\\Stratos\\Robot\\TestData\\OrderDetails.xlsx 
${Product_Material_excel}    C:\\Stratos\\Robot\\TestData\\MaterialNumbers_Products.xlsx 
${WebPrice_excel}    C:\\Stratos\\Robot\\TestData\\WebPriceData.xlsx     

${Product_Details_Xl}    C:\\Stratos\\Robot\\TestData\\Product_Details.xlsx
#*********************************Contery selection*************************************************************************

${CounteryChina}                        (//div/a)[1]     #CH

#*******************************************************************************************************************************8

${India}                    xpath=(//li[@data-value='IN'])[1]
${Afghannistan}             xpath=(//li[@data-value='AF'])[2]
${Japan}                    xpath=(//li[@data-value='JP'])[1]
${Israle}                   xpath=(//li[@data-value='IL'])[1]
${China}                    xpath=(//li[@data-value='CN'])[1]

#********************************Test Data for Login functionality***********************************************************

${qaURL1}                                   http://ae1c-ecomdev-mlb01:30013/IN/en
${qaURL2}                                   configurators/tube?product=easyoligo    #http://ae1c-ecomdev-mlb01:30013/location-select   
${qaURL}                                    http://ae1c-ecomdev-mlb01:30013/CN/en/configurators/tube?product=easyoligo
${LoginURL}                                 http://ae1c-ecomdev-mlb01:30013/CN/en/login
#${qaURL}                                   http://ae1c-ecomdev-mlb01:30013/EN/en/configurators/customOligo        
${Browser}                                  gc
${userVal}                                  pratima_config2  #Deepu.config@sial.com  #pratima_config1  #Vignesh_china@sial.com    #Vignesh_china@sial.com    #
${passVal}                                  sigma123         #merck1     #pratima_config2 / sigma123               #sigma123                  
${signInPageMsg}                            Sign in to your Profile 
${welcomeMsg}                               Welcome 
#***********************************Product Page Name Verification data***************************************************
               
${ExpectedEasyOligoPageName}                Easy Oligos
${shortWait}                                30
${yourCartMsg}                              Your Cart
${waitTime}                                 15
${cartEmpty}                                0 
${emptyCartMsg}                             Your Shopping Cart is Empty

#*********************************Naviagte to single entry page****************************************************************************

${ProductListPageValue}  `                       Custom Oligos and qPCR Probes
#${Easyoligo_product}                            xpath=//*[@id="__next"]/div/div[2]/div/div[3]/div[2]/div/div/div[3]/div/table/tbody/tr[5]/td[3]/div/button/span    
#${Product_url}                                  http://ae1c-ecomdev-mlb01:30013/EN/en/configurators/tube?product=easyoligo
${ExpectedClearCartText}                         Clear Cart
#invalid sequence value
${InvalidOligoValue}                             Easy     
${SpecialCharacters}                             !@$^"?><}{\|';
#${InvalidOligoValuewErrorMessage}       Name contains invalid character(s)
${actual_errorMessage}                           Name contains invalid character(s):!, ", $, ', ;, <, >, ?, @, ^, {, |, }
${MaxmiumOligoValue}                             Easy Easy Easy Easy Easy Easy Easy 
${ActualErrorMessageforMaxmiumOligoValue}        Maximum oligo name length is 30
${Actule_errorForInvalidSequence}                Sequence contains invalid character(s):
${Actul_errorForMinimumSequence}                 Minimum sequence length: 15
${Actul_errorForMinimumSequencePure}             Minimum sequence length: 12
${Actul_errorForMaximumSequence}                 Maximum sequence length: 30
${Actul_errorForMaximumSequencePure}             Maximum sequence length: 35
${ActulErrorValueForRedBarMessage}               ! Please correct the error(s) before proceeding to the next step.
${ActulErrorValueForRedBarMessageTemp}           ! Please correct the error(s) before proceeding to next step.
${ActulErrorValueForDeletAllReviewPage}          ! Please correct the error(s) before proceeding to the next step.
${ActulErrorForAcknowladgeArea}                  Comment contains invalid character(s): @, !, $, ^, }, {, ", ?, >, <
${Required Field_errorData}                      Required Field
#${OligoProduct1}                                 

   
#**********************************Valid,Invalid oligo and Sequence entry data*******************************************************  
             
${OligoValue}                                               Oligo_Name- 
${MaxmiumLengthOligoValue}                                  30
${MiniumSequenceValue}                                      ACACACACACACAC
${MiniumSequenceValuePure}                                  CACACACAC
${MaximumSequenceValue}                                     ACACACACACACACACACACACACACACACACAC
${MaximumSequenceValuePure}                                 ACACACACACACACACACACACACACACACACACACA
${SequenceValue}                                            ACGTACGTACGTACGTAGT
${InvalidSequencValue}                                      ABCDEFGHIJKLMNOPQRSTXYZ
${ActulErrorMessageForInvalidSequence}                      Sequence contains invalid character(s): B, D, E, F, H, I, J, K, L, M, N, O, P, Q, R, S, X, Y, Z
${PopupHeader}                                              My Oligos 

#*********************************Delete confirmation popup content**************************************************************************

${ActulconfirmationMessageFroSingelLineItem}                Are you sure you want to remove the selected item from your order?
${ActulconfirmationMessageForDeleteAllPopup}                Are you sure you want to remove ALL items from your order?

#*********************************Acknowladge text area*******************************************************************************************

${confirmAcknowladgeInvalidTextValue}                       Invalid character@!#$%^&*()_+}{][":?.,><,.:":[]
${confirmAcknowTextAreaValue}                               Valid text successfully enter


##*********************************Specification value*******************************************************************************************

${SpcFormatValue}                                          In Solution (Water)   
${SpcFormatValuePure}                                      Dry                         
${SpcPurificationValue}                                    Desalt  
${SpcPurificationValuePure}                                Cartridge        
${SpcConcentrationValue}                                   100        
${SpcAmountValue}                                          3 OD
${ShopingAmdata}                                           Ambient (Room Temperature)

#*********************************ProceedToCheckoutPopup and Shoppingc cart******************************************************************************

${AtuclHeaderValueForPorceedToCheckOutPopup}               Your Shopping cart has been updated 
${ShoppingCartPoNumberValue}                               123456  
${ShoppingCartRegNumberValue}                              112233
${ShoppingCartAttationToTextFieldValue}                    Automation test
${ShoppingCartDepartmentTextValue}                         Testing Team
${ShoppingcartEmailTextValue}                              Test.Testing@sial.com
${ShoppingCartMobileNumberValue}                           9900990099
${ShoppingCartPackingSlipNoteTextValue}                    Block Order - Testing
${ShoppingcartCCEmailTextValue}                            CCTest.CCTesting@sial.com
${ContactInfoPhNumber}                                     123456789

#**********************************# created order page************************************************************************************

${CreatedOrderValue}                                     Done! We are working on Order 3001138854 

#******************* Template data uplod Easy*********************************************************************************************

${ActulMaximumFileUploadErrorValuForEasyOligo}                  Maximum number of oligos per session is 48.
${ActulMissingFileUploadErrorValuForEasyOligo}                  Required data 'Sequence' missing in row(s):4; 'Name' missing in row(s):1


#***#*****************************Easy Template files ****************************************************
${EasyMaximumFileUploadPath}                C:\\Stratos\\Robot\\TestData\\EasyMaximumlineitem.xlsx  
${Easy_Missing_Line_ItemFile}               C:\\Stratos\\Robot\\TestData\\EasyMissingErrorFile.xlsx
${Easy_Invalid_File}                        C:\\Stratos\\Robot\\TestData\\EasyErrorTest.xlsx
${Easy_Valid_File}                          C:\\Stratos\\Robot\\TestData\\EasyValidFile.xlsx

#***#*****************************Pure Siple Template files ****************************************************

${PureSimple_valid_File}        C:\\Stratos\\Robot\\TestData\\PureSimpleValid.xlsx
${PureSimple_Invalid_File}      C:\\Stratos\\Robot\\TestData\\PureSimpleInValid.xlsx
${PureSimple_Maximum_File}      C:\\Stratos\\Robot\\TestData\\PureSimpleMaximum.xlsx
${PureSimple_Missing_File}      C:\\Stratos\\Robot\\TestData\\PureSimpleMissing.xlsx

#***#*****************************WellRED Template files ****************************************************

${WellRED_valid_File}                      C:\\Stratos\\Robot\\TestData\\WellREDValid.xlsx
${Rules_Validation_File}                   C:\\Stratos\\Robot\\TestData\\WellREDRulesValidation.xlsx
${WellRED_Invalid_File}                    C:\\Stratos\\Robot\\TestData\\WellREDInValid.xlsx
${WellRED_Maximum_File}                    C:\\Stratos\\Robot\\TestData\\WellREDMaximum.xlsx
${WellRED_Missing_File}                    C:\\Stratos\\Robot\\TestData\\WellREDMissing.xlsx
                


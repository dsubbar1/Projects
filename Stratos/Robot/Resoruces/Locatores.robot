*** Settings ***
Library             SeleniumLibrary 
Library             ExcelLibrary           
Resource            CommonResources.robot
Resource            ConfiguratorApplicationSpeficKeyword.robot

*** Variables ***
#***********************************Xpath for Web Elements To Login**********************************************************

${LoginLink}                            xpath=(//span/a[contains(text(),'Login')])[1]   #(//div/a[contains(text(),'Login')])[1]
${userID}                               xpath=//*[@id="userName"]
${passID}                               xpath=//*[@id="password"]
${login}                                xpath=//a[@href="/login"]
${loginBtn}                             xpath=//*[@type="submit"]    #//*[@id="Login"]
${ProfileDropDown}                      xpath=//*[@id="__next"]/div/div[2]/div[2]/div/div[1]/a #(//div[@class='MuiBox-root jss55 jss8'])[1]  
${downArrow}                            xpath=//*[@id="__next"]/div/div[1]/div[4]/div    #(//*[contains(text(),'EN')])[1]     #(//*[contains(text(),'EN')])[1]      #(//*[@d="M7.41 8.59L12 13.17l4.59-4.58L18 10l-6 6-6-6 1.41-1.41z"])[1]    #//*[@class="MuiSvgIcon-root"]    #//*[contains(text(),'arrow_drop_down')]    #//span[@class="material-icons MuiIcon-root344"]
${selectLang}                           xpath=(//*[contains(text(),'United States English')])[1]
${logout}                               xpath=(//*[contains(text(),'Logout')]) [2]   #//a[contains(text(), 'Logout')]    
##${submit}                 xpath=//span[@class="MuiBtn-label"] 
#${welcomeDrp}               xpath=//*[@id="__next"]/div/div[1]/div[2]/div[1]/div[1]/a
#${loginerrMessage}          xpath=//*[@id="__next"]/div/div/div/div/div/div[2]/div/form/div[2]

#**********************************Xpath for country*************************************************************************
${RegionList}                     xpath=//*[@id="__next"]/div/div/div/div[2]/div/div[1]/ul  #(//ul[@Class='MuiList-root jss66 jss67 MuiList-padding'])[1]
${Eruope}                         xpath=(//*[contains(text(),'Europe')])[1]
${North America}                    xpath=(//*[contains(text(),'North America')])[1]
${Africa}                         xpath=(//*[contains(text(),'Africa')])[1]
${South America}                   xpath=(//*[contains(text(),'South America')])[1]
${AsiaPacific}                    xpath=(//*[contains(text(),'Asia Pacific')])[1]

#***********************************xpath for product naviagtion*******************************************************

${CustomProductNavigation}             xpath=(//button[@type='button'])[3]
${CustomProductLifescienceLink}        xpath=(//button[@type='button'])[8]
${CustomeOligoLink}                    xpath=//*[@id="__next"]/div/div[2]/div[1]/div/div[2]/div/div[3]/a[10]    #(//a[@role='button'])[13]
${CutomeElisaKitLink}                  xpath=(//a[@role='button'])[16]
${CustomeMenu}                         xpath=//*[@id="__next"]/div/div[2]/div[1]/div/div[2]/div/div[3]

#**********************************xpath for location*******************************************************************
${CountryLocationList}            xpath=(//ul[@class='MuiList-root jss17 MuiList-padding'])[1]

#*****************************
${LocationSelectCheckbox}        xpath=(//span[@class='MuiIconButton-label'])[1]
${btnContinueLoc}                   xpath=(//button[@type='button'])[1]
#***********************************Xpath for Clear Cart *****************************************************************

${CartLink}                        xpath=(//button[contains(text(),'Cart')])[1] 
${yourCart}                        xpath=(//*[contains(text(),'Your Cart')])[2]
${itemCount}                       xpath=/html/body/div[6]/div[3]/div/div[1]/div[2]/div[2]  #/html/body/div[4]/div[3]/div/div[1]/div[2]/div[2]  #/html/body/div[4]/div[3]/div/div[1]/div[2]   #//*[@id="__next"]/div/header[1]/div/div[2]/button/span
${shortWait}                       30
${clearCart}                       xpath=(//*[contains(text(),'Clear Cart')])[2]
#${CartClearLink}                   xpath=(//*[contains(text(),'Clear Cart')])[2]
#${CartClearAgreeBtn}               xpath=(//*[contains(text(),'Ag')])[2]  
${agreeBtn}                        xpath=(//*[contains(text(),'Agree')])[2]

#Xpath for web Elements Order navigation*

${ProductListPage}                 xpath=//*[@id="__next"]/div/div[3]/div/h1    
${DNAOligoOrderBtn}                xpath=(//span[@Class='MuiButton-label'])[1]     #//*[@id="__next"]/div//table/tbody/tr[4]/td[3]/div/button/span
${DNAPlatesOrderBtn}               xpath=(//span[@Class='MuiButton-label'])[2]
${LongOligoOrderBtn}               xpath=(//span[@Class='MuiButton-label'])[3]
${EasyOligoOrderBtn}               xpath=(//span[@Class='MuiButton-label'])[4]
${WellRedOrderBtn}                 xpath=(//span[@Class='MuiButton-label'])[5]
#${EasyOligoProduct}        xpath=/html/body/div[1]/div/div[2]/div/div[3]/div[2]/div/div/div[3]/div/table/tbody/tr[4]/td[3]/div/button/span   
#${BtnOrder}                xpath=//*[@id="__next"]/div/div[2]/div/div[3]/div[2]/div/div/div[3]/div/table/tbody/tr[4]/td[3]/div/button/span
${EasyOligoPageName}            xpath=(//h1[contains(text(),'Easy Oligos')])[1]

${closeYourCart}                   xpath=(//button[@class='MuiButtonBase-root'])[1]


#****************************************Xpath for Error bar ********************************

${ErroBarOnTopOfThePage}                 xpath=//*[@id="__next"]/div/div[3]/div/div[2]/div[2]/div[1]  #(//div[@class='MuiCollapse-wrapperInner'])[1]
${ErrorBarOnTopOfTheReviewPage}          xpath=(//*[contains(text(),'Please correct the error(s) before proceeding to the next step.')])[1]
${ErrorFroTem}                           xpath=(//div[@class='MuiCollapse-wrapperInner'])[1]    #(//*[contains(text(),'Please correct the error(s) before proceeding to next step.')])[1]
${CautionHeaderText}                     xpath=(//*[contains(text(),'Adding a new set of items will override any existing items in this session.')])[1]
#*****************************************Xpath for Manual single entry page**********************
 
#Sequence Information
#${singel_entry_page_tab}    /html/body/div[1]/div/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/div/div/button[1]/span
${SingleEntryProductLink}                        xpath=(//span[@class='MuiTab-wrapper'])[1]                                                        xpath=(//div[@class='MuiTabs-flexContainer']//span)[1]
${SingleEntryPageSequenceInformationHeader}      xpath=(//*[contains(text(),'Sequence Information')])[1]
${OligoName}                                     xpath=//*[@id="name"]
${ErrorOligoField}                               xpath=//div[@class='jss189'][1]
${EroorForMaxValue}                              xpath=//*[@id="__next"]/div/div[3]/div/div[2]/div[2]/div/div[2]/div[2]/div/div[1]/div/div[3]/div/div
${SequenceField}                                 xpath=//*[@id="sequence"]
#${InvalidXpathForSequenceField}
${Required FieldXpath}                           xpath=(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-xs-7']//div)[5]
${ErrorXpathForMiniSequenceField}                xpath=(//*[contains(text(),'Minimum sequence length: 15')])[1]
${ErrorXpathForMiniSequencePure}                 xpath=(//*[contains(text(),'Minimum sequence length: 12')])[1]
${ErrorXpathForMaxSequenceField}                 xpath=(//*[contains(text(),'Maximum sequence length: 30')])[1]
${ErrorXpathForMaxSequenceFieldPure}             xpath=(//*[contains(text(),'Maximum sequence length: 35')])[1]
${ErrorXpathForInvalidSequenc}                   xpath=//*[@id="__next"]/div/div[3]/div/div[2]/div[2]/div/div[2]/div[2]/div/div[3]/div/div[3]/div/div
${SequenceBaseCount}                             xpath=//*[@id="__next"]/div/div[3]/div/div[2]/div[2]/div/div[2]/div[2]/div/div[2]/div[2]/div   #(//div[@class='MuiGrid-root jss205 MuiGrid-item MuiGrid-grid-xs-6'])[1]  
${SequenceBAseCountWellRed}                      xpath=//*[@id="__next"]/div/div[3]/div/div[2]/div[2]/div/div[2]/div[2]/div[1]/div/div[2]/div[2]/div
${PrivewBaseCount}                               xpath=(//table/tbody/tr/td)[1]    #(//table[@class='MuiTable-root jss238']/tbody/tr/td)[1]       
${PriviewSequence}                               xpath=(//div[@class='MuiGrid-root MuiGrid-container'])[3]  #//*[@id="__next"]/div//div[3]/div[2]/div
${SequencePropartiesHeadr}                       xpath=(//div/h4)[3]
#***********************************Xpath for Buttons**********************
                      
#Xpath for Btns 
${BtnAddOligo}                         xpath=(//*[contains(text(),'Add Oligo')])[1]  #//*[@id="__next"]/div//div[1]/button[1]/span
${BtnViewAll}                          xpath=(//*[contains(text(),'View All')])[2]
${BtnContinue}                         xpath=(//*[contains(text(),'Continue')])[1]     # //*[@id="__next"]/div//div[2]/button[3]/span                                           
${BtnContinueCaution}                  xpath=(//*[contains(text(),'Continue')])[2]
${BtnAddOligoSideNavigation}           xpath=(//span[@class='MuiButton-label'])[2]
${BtnAddToCart}                        xpath=(//*[contains(text(),'Add To Cart')])[1]    #(//span[@class='MuiButton-label'])[2]
${BtnAddOligoConfirmPage}              xpath=(//*[contains(text(),'Add Oligo')])[1]    

#************************************Xpath for side naviagtion *******************************
   
${DeleteBinIconProductSummary}        xpath=(//span[@class='MuiIconButton-label'])[1]   #//*[@id="__next"]/div//div[2]/div[3]/button                                                       
${ViewAllLink}                        xpath=(//*[contains(text(),'View All')])[1]
${OligoNameSideNaviagtion}            xpath=/html/body/div[1]/div//div[1]/div[2]//div[2]/a 
${ProductSummaryOligo2}               xpath=(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-sm-10'])[2]  #(//div/div/a)[11]
          
#*****************************************#xpath for oligo name verification************************************************************8

${ProductSummaryOligoName1}            xpath=(//div[@class='MuiTableContainer-root']//div)[3]  #(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-sm-10'])[1]
${ProductSummaryOligoName2}            xpath=(//div[@class='MuiTableContainer-root']//div)[7]
#${ProductSummaryOligoName3}            xpath=(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-sm-10'])[3]
${ReviewConfirmOligoname}             xpath=(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-sm-5'])[1]/div[1]
#*****************************************#xpath for viewAllPpopup***********************************

#${popup_window}                           xpath=/html/body/div[4]/div[3]
${ViewAllPopupWindow}                                      xpath=(//div[@class='MuiDialog-container MuiDialog-scrollPaper'])
${ViewAllPopupHeaderName}                                  xpath=(//*[contains(text(),'My Oligos')])[3]
${ViewallPopupTableXpath}                                  xpath=(//tbody[@class='MuiTableBody-root'])[1]
${ViewAllPopupCloseBtn}                                    xpath=//span[text()='Close']      #(//span[@class='MuiButton-label'])[6]    
${ViewAllPopupLineItemDeleteBtn}                           xpath=(//button[@class='MuiButtonBase-root MuiIconButton-root'])[1]   #(//span[@class='MuiIconButton-label'])[19]                                      
${ViewAllPopuDeleteAllLink}                                xpath=(//span[@class='MuiButton-label'])[7] 
${ViewAllPopupDeleteAllBin}                                xpath=(//span[@class='MuiButton-label'])[9] 
  

#*****************************************#xpath for Delete confirmation popup***********************************

${DeleteconfirmationCancleLink}                             xpath=(//*[contains(text(),'Cancel')])[2]
${DeleteconfirmDeleteBtn}                                  xpath=(//*[contains(text(),'Delete')])[4]
${DeleteBtnforconfirmProductSummary}                        xpath=(//*[contains(text(),'Delete')])[3]
${DeleteBinForSingleLineItemPopup}                          xpath=//tr[@class='MuiTableRow-root'][1]/td[3]   #//div[5]//div/div[2] 
${DeleteconfirmationForDeleteAllContent}                    xpath=/html/body/div[7]/div[3]/div/div[2]  #(//*[contains(text(),'Are you sure you want to remove ALL items from your order?')])[2]
${DeleteconfirmationForSingleContent}                       xpath=/html/body/div[7]/div[3]/div/div[2]  #(//*[contains(text(),'Are you sure you want to remove the selected item from your order?')])[2]
${DeleteconfirmationForDeleteAllline}                        xpath=(//*[contains(text(),'Delete All')])[4]

#/html/body/div[7]/div[3]/div/div[2]
#*****************************************#Xpath Reviw & confirmation Page**********************************
 
#Reviw & confirmation

${ReviewAndConfirmPageHeader}             xpath=(//*[contains(text(),'Review & Confirm')])[2]
${OligoName_ReviewConfirm}                xpath=//*[@id="__next"]/div/div[3]/div/div[2]/div[2]/div/div[2]/div[2]/div[1]/div/div/div[1]/div[1]/h4/a     #(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-sm-5']/div/h4)[1]
${ReviewConfirmOligoname2}                xpath=//*[@id="__next"]/div/div[3]/div/div[2]/div[2]/div/div[2]/div[2]/div[2]/div/div/div[1]/div[1]/h4/a/strong
${ReviewConfirmBaseCount1}                xpath=(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-sm-5'])[1]/div[2]
${ReviewConfirmPriceValue1}               xpath=(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-sm-2'])[1]
${ReviewConfirmPriceValue2}               xpath=(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-sm-2'])[2]
${confirmDeleteBinForLineItem}            xpath=(//*[@class='MuiSvgIcon-root'])[2]      #(//button[@aria-label='delete'])[2]  
${confirmDeleteBinForAll}                 xpath=(//button[@aria-label='delete'])[1]        
${confirmDownloadSummaryLink}             xpath=(//div/p/a)[1]    #//*[@id="__next"]/div/div[3]/div/div[2]/div[2]/div/div[2]/div[6]/p/a  #(//*[contains(text(),'Download Summary')])[1]
${confirmAcknowladgeCheckbox}             xpath=(//input[@type='checkbox'])[1]
${confirmAcknowladgeTextArea}             xpath=//*[@id="addInfo"]
${ExpectedErrorXpathFortextArea}          xpath=//*[@id="__next"]/div/div[3]/div/div[2]/div[2]/div/div[2]/div[6]/div/div/form/div/div[2]/div
${ReviewConfirmSubtotalxpath}             xpath=//*[@id="__next"]/div/div[3]/div/div[2]/div[2]/div/div[2]/div[6]/div/div/div[2]/div[2]/span
${ReviewConfirmWarningMessage}            xpath=//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12']

#*****************************************#Xpath Specification Section***************************************

${SpcFormat}                             xpath=//*[@id="__next"]/div//div/table/tr[1]/td[2] 
${SpcPurification}                       xpath=//*[@id="__next"]/div//table/tr[2]/td[2]
${SpcConcentration}                      xpath=//*[@id="__next"]/div//table/tr[3]/td[2]
${SpcAmount}                             xpath=(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-sm-6']/table/tr/td)[8]  #(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-sm-6']/table/tr/td)[8]    #//*[@id="__next"]/div//table/tr[4]/td[2]
${ShippingOptionsData}                   xpath=(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-sm-6'])[3]/div  #(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-sm-6']/div[@class='jss506'])[1]
${SpcAmountPur}                          xpath=//*[@id="__next"]/div//div/table/tr[1]/td[2]
${SpcFormatPur}                          xpath=//*[@id="__next"]/div//div/table/tr[3]/td[2] 
#*****************************************#Xpath for proceed to Checkout popup***************************************

#proceed to Checkout popup
${AtuclHeaderName ForPorceedToCheckOutPopup}   xpath=(//h2[@class='MuiTypography-root MuiTypography-h6'])[1]
${ProccedToCheckoutSubTotalPricepopup}         xpath=(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-xs-6']//div[Label])[1]
${ExpectedHeaderProccedToCheckOutPopup}        xpath=(//div/h2[@class='MuiTypography-root MuiTypography-h6']) 
${BtnProceedToCheckout}                        xpath=(//*[contains(text(),'Proceed To Checkout')])[2]        #(//button[@type='button'])[9]
${ProceedToCheckOutItemCount}                  xpath=(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-xs-10']//div/label)[1]
${ProceedToCheckOutSubtotal}                   xpath=(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-xs-6']//div/label)[1]

#*****************************************#Xpath for shopping cart**************************************************
${ShoppingCart_LineItem_Count}                 Xpath=((//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12'])[11]/h2//span)[2]
${ShoppingCartProductMaterial}                 xpath=(//*[contains(text(),'VC')])[1]   #//*[@id="__next"]/div/div/form/div/div/div[1]/div[2]/div/div/div[4]/div/div[2]/div/div[1]/div[3]/div[1]/div[1]/div[1]/a       #(//*[contains(text(),'VC00027N')])[1] 
${ShoppignCart_First_line_Oligo_Name}          xpath=((//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12'])[12]//div/span)[2]
${ShoppignCartProductOligoName2}               xpath=((//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12'])[12]//div/span)[4] 
${ShoppignCart_Shipping_details}               xpath=((//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12'])[12]//div)[18]     #((//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12'])[12]//div)[21]
${Shopping_Price_LineItem_One}                 xpath=((//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12'])[12]//div)[17]
${shoppingCartCheckOutBtn}                     xpath=(//span[@class='MuiButton-label'])[2]
${ShoppingCartPrintcartBtn}                    xpath=(//button[contains(text(),'Print Cart')])[1]
${ShoppingCartEditeLink}                       xpath=(//*[contains(text(),'Add Promo Code')])[1]
${ShoppingCartAllPromocardTextField}           xpath=//input[@id='cartPromoCode']  
${ShoppingCartAddInstractionBbtn}              xpath=(//span[@class='MuiButton-label'])[1]
${ShoppingCartSubmitOrderBtn}                  xpath=(//span[@class='MuiButton-label'])[2] 
${ShoppingCartRequestQuoteBtn}                 xpath=(//span[@class='MuiButton-label'])[3]
${ShoppingCartSaveCartBtn}                     xpath=(//span[@class='MuiButton-label'])[4]
${ShoppingCartAttationToTextField}             xpath=(//input[@id='shippingAddress.attentionTo'])[1]
${ShoppingCartEmailTextField}                  xpath=(//input[@id='shippingAddress.email'])[1]
${ShoppingCartPoNumberTextField}               xpath=(//input[@id='poNumber'])[1]
${ShoppingCartRegNumberTextField}              xpath=(//input[@id='reqNumber'])[1]
${ShoppingCartDepartmentTextField}             xpath=(//input[@id='shippingAddress.department'])[1]
${ShoppingCartMobileNumberTextField}           xpath=(//input[@id='shippingAddress.mobile'])[1]
${ShoppingCartPackingSlipNote}                 xpath=(//input[@id='packingSlipNote'])[1]
${ShoppingCartCCEmailTextField}                xpath=(//input[@id='orderingPartyAddress.ccForOrderConfEmailIds'])[1]
${ShoppingcartEditLinkForContactInfo}          xpath=(//*[contains(text(),'Edit')])[5]
${ShoppingCartContactInfoPhnumberfield}        xpath=(//input[@id='orderingPartyAddress.telephone'])[1]
${ShoppingCartContactInfoDoneBtn}              xpath=(//span[contains(text(),'Done')])[1]
${ShoppingCartSubtotalPricxpath}               xpath=//*[@id="__next"]/div/div/form/div/div/div[2]/div/div/div[2]/div[1]/div[2]

#*****************************************#Xpath for Order verification***************************************************

${CreatedOrderNumber}                           xpath=//div/h3

#*****************************************#Xpath for Multiple entry ***********************************************

${MultipleEntryLinkXpath}                      xpath=(//div[@class='MuiTabs-flexContainer']//span)[2]  #(//*[contains(text(),'Multiple Product Entry')])[1]  #(//button/span[@class='MuiTab-wrapper'])[2]  #(//span[@class='MuiTab-wrapper'])[2]    #(//*[contains(text(),'Multiple Product Entry')])[1]
${MultipleEntryTemplateDownload}               xpath=(//*[contains(text(),'Multiple Entry Template')])[2]
${MultipleFileUploadBtn}                       xpath=(//*[contains(text(),'Drop CSV or XLS files')])[1]
${MultipleCopyPaste}                           xpath=//textarea[@placeholder='Paste entries here and edit ']
${MultipleUploadYourDataBtn}                   xpath=//*[contains(text(),'Upload Your Data')][1]
${MultipleFileUpload}                          xpath=//input[@name="file"]
${MultipleMaxmiumFileErrorXpath}               xpath=(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-sm-3']//div)[7]   #//*[contains(text(),'Maximum number of oligos per session is 48.')]
${MultipleMissingFileErrorXpath}               xpath=(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-sm-3']//div)[7]
${MultipleVerificationTopError}                xpath=(//*[contains(text(),'Easy Oligo')])[2]
${Oligo&Probes}                                 xpath=(//*[contains(text(),'Oligos & Probes')])[1]
#*****************************************#Xpath for WellRed Product****************************************************

# 5 Modification xpath
${WellREDD2PA}                                xpath=(//span[@class='MuiTypography-root MuiFormControlLabel-label MuiTypography-body1'])[1]  #xpath=(//label[@class='MuiFormControlLabel-root'])[1]
${WellREDD3PA}                                xpath=(//span[@class='MuiTypography-root MuiFormControlLabel-label MuiTypography-body1'])[2]  #xpath=(//label[@class='MuiFormControlLabel-root'])[2]
${WellREDD4PA}                                xpath=(//span[@class='MuiTypography-root MuiFormControlLabel-label MuiTypography-body1'])[3]   #(//label[@class='MuiFormControlLabel-root'])[3]

${BaseCountForWellInSequenc}                  xpath=//*[@id="__next"]/div/div[3]/div/div[2]/div[2]/div/div[2]/div[2]/div[1]/div/div[2]/div[2]  #(//div[@class='MuiGrid-root jss538 MuiGrid-container']/div)[2]
${FormatDryDataForWellRed}                    xpath=(//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-sm-3'][3]/div)[2]

${2OD}                                        xpath=(//span[@class='MuiIconButton-label'])[8]
${4OD}                                        xpath=(//span[@class='MuiIconButton-label'])[9]
${5OD}                                        xpath=(//span[@class='MuiIconButton-label'])[10]
${10OD}                                       xpath=(//span[@class='MuiIconButton-label'])[11]
${50OD}                                       xpath=(//span[@class='MuiIconButton-label'])[12]
${100OD}                                      xpath=(//span[@class='MuiIconButton-label'])[13]
${RP1}                                        xpath=(//span[@class='MuiIconButton-label'])[14]
${HPLC}                                       xpath=(//span[@class='MuiIconButton-label'])[15]

#*****************************************#Xpath for Logout ********************************************************

#${logout}                   xpath=//a[@href="/logout"]    #//a[contains(text(), 'Logout')] 
# ${CloseBrowser}                          ${CloseBrowser}    
       

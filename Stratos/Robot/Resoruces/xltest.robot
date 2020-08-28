*** Settings ***
Library    SeleniumLibrary   
Library    ExcelLibrary
#Library    createExcleFile.ExcelUtility

Resource    Locatores.robot    


*** Test Cases ***
loginForConfig
    [Documentation]    Login to application with valid user name based on country
    Set Selenium Implicit Wait    5s
    Open Browser    http://ae1c-ecomdev-mlb01:30013/CN/en/login    gc
    Set Selenium Implicit Wait    5s
    Wait Until Element Is Visible                    ${LoginLink}
    Click Element                                    ${LoginLink} 
    Wait Until Element Is Visible                    ${userID}        
    click                                            ${userID}
    #Username    China
    sendKeys                                         ${passID}    ${passVal} 
    waitForElementPresent                            ${loginBtn}   
    click                                            ${loginBtn}
    Set Selenium Implicit Wait    5s
   # Set Selenium Implicit Wait    5s  
    #Open Browser    https://webqws.sial.com/webapp/wcs/stores/servlet/LogonForm?storeId=11001    gc
    #Maximize Browser Window
    #Set Selenium Implicit Wait    10s
    #Click Element    //*[@id="logonId"]
    #Username    JP       
    #Set Selenium Implicit Wait    10s   
    #Click Element    //*[@id="logonPassword"]  
    #Set Selenium Implicit Wait    10s
    #Click Element    //*[@id="logonForm"]/div/div[4]/button  
    #Set Selenium Implicit Wait    10s            
    #Wait Until Element Is Visible                    ${LoginLink}
    #Click Element                                    ${LoginLink} 
    #Wait Until Element Is Visible                    ${userID}        
    #click                                            ${userID}     
    #sendKeys                                         ${userID}    ${userID}          
    #sendKeys                                         ${passID}    ${passVal} 
    #waitForElementPresent                            ${loginBtn}   
    #click                                            ${loginBtn}
   
*** Test Cases ***
XLwright
    [Documentation]    tes wrif wl
    ${q}=    WRIT1
    Log    ${q}     
*** Keywords **

     
WRIT1 
      #[Arguments]    ${XlRow}    ${XlColum}    
      Open Excel Document       ${Order_Number_excel}    doc_id
      Write Excel Cell    2    1    Test@enter data       
      #[Return]    ${OrderNumber}    WRIT1    
      Save Excel Document    ${Order_Number_excel}    
     #[Return]     ${order}
    
WRIT0
     Log To Console    user as not selected 
     

    
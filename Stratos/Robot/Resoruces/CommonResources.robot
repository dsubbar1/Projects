*** Settings ***
Library             SeleniumLibrary            
Library             String 
Library             DateTime 
Library             OperatingSystem     
#Resource            Locators.robot
#Resource            ../TestData/TestData.robot


*** Keywords ***  
clearInputBoxField
    [Documentation]                               To clear input textbox field  
    [Arguments]                                   ${element}   
    # Wait Until Element Is Visible                 ${element}               ${shortWait}          
    # Clear Element Text                            ${element}
    Press Keys                                    ${element}                 DELETE    
          
ScrollDown
    [Documentation]                               To scroll down vertical bar till bottom of the page 
    # [Arguments]                                  ${value}
    Execute JavaScript                            window.scrollTo(0, document.body.scrollHeight)  
    #Sleep                                         ${waitTime}
    Capture Page Screenshot     

                
# enterDateField
    # [Arguments]                                   ${element}            ${value}
    # # Execute JavaScript                            document.getElementById('${element}').value='${value}'
    # Execute JavaScript                            document.getElementById('${validFrom}').value='${validFromTxt}'
    
scrollPageToLocation
    [Arguments]                                    ${x_location}    ${y_location}
    Execute JavaScript                             window.scrollTo(${x_location},${y_location})
    
# enterDateField
    # [Arguments]    ${locator}
    # Execute Javascript          document.querySelector("locator").removeAttribute("readonly");
    # Execute Javascript          document.querySelector("locator").removeAttribute("onchange");
    # Execute Javascript          document.querySelector("locator").setAttribute("value", "${locator}"); 
        # [Arguments]    ${locator}    ${text}
        # [Documentation]    write text letter by letter
        # ${items}    Get Length    ${text}
        # :FOR    ${item}    IN RANGE    ${items}
        # \       sendKeys    ${locator}    ${text[${item}]}

Select Datepicker Date
    [Documentation]     Select given day from datepicker
    [Arguments]     ${dateElem}     ${expectedMonthYear}    ${clickElement}
    Input Text  ${dateElem}    ${Empty}    # open the datepicker
    ${monthyear}=   Get Datepicker MonthYear
    :FOR    ${Index}    IN RANGE    1   31
    \   Run Keyword If  '${monthyear}' == '${expectedMonthYear}'   Exit For Loop
    \   Click Link    //*/div[@id='ui-datepicker-div']//*/a[contains(@class, 'ui-datepicker-prev')]
    \   ${monthyear}=   Get Datepicker MonthYear
    Click Link    ${clickElement}

Get Datepicker MonthYear
    [Documentation]     Return current month + year from datepicker
    [Return]    ${monthyear}
    ${month}=   Get Text      //*/div[@id='ui-datepicker-div']//*/div[@class='ui-datepicker-title']/span[@class='ui-datepicker-month']
    ${year}=    Get Text      //*/div[@id='ui-datepicker-div']//*/div[@class='ui-datepicker-title']/span[@class='ui-datepicker-year']
    ${monthyear}=   Catenate    ${month}  ${year}
                
getSystemDate
    [Documentation]                               Get the system date and it covert to specified format
    [Arguments]                                   ${element}   
    ${getTime}=                                   Get Time    
    ${getCurrentDate}                             Get Current Date    result_format=%Y-%m-%d
    ${element}=                                   Set Variable     
    [Return]                                      ${element} 
     
popupHandlerAcceptAlert  
    
    # [Arguments]            ${element}     
    Wait Until Element Is Visible               //*[@id="ju_iframe_524160"]
    Select Frame                                //*[@id="ju_iframe_524160"]
    Wait Until Element Is Visible               (//*[contains(text(),'Accept')])[2]
    Click Element                               (//*[contains(text(),'Accept')])[2]
    UnSelect Frame
    Maximize Browser Window 
         
JSClickElement
	[Documentation]
	...         Can be used to click hidden elements
	...         Dependencies
	...         SeleniumLibrary
	...         String
	[Arguments]     ${element_xpath}
    # escape " characters of xpath
    ${element_xpath}=       Replace String      ${element_xpath}        \"  \\\"
    Execute JavaScript  document.evaluate("${element_xpath}", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();

# DragAndDropOption
    # # NO VISIBLE ACTION HERE, BUT COMMANDS TAKE SOME MINUTES TO EXECUTE WITHOUT FAILURE
    # Wait Until Element Is Visible                 ${multiProdEntryBtn}      ${shortWait}   
    # clickAndWait                                  ${multiProdEntryBtn} 
    # Wait Until Element Is Visible                 ${multiProdEntry}  
    # Wait Until Element Is Visible                 //*[contains(text(),'Browse')]            ${shortWait}      
    # Drag And Drop                                 //*[contains(text(),'Browse')]            ${CURDIR}\\quick_order_template.xls    
    # Drag And Drop By Offset                       //*[contains(text(),'Browse')]            24      0
    # Drag And Drop By Offset     //img[@draggable='true']    100     0
    # Drag And Drop By Offset     //img[@alt='W3Schools']    10     -10
    # Mouse Down  //input[@name="file"]
    # Mouse Over  //*[contains(text(),'Browse')]
    # # # DRAG AND DROP ACTION HERE
    # Drag And Drop By Offset     //span[contains(text(),'Drag and Drop')]    500     -500
    # Sleep   5


# Download Should Be Done
    # [Arguments]    ${directory}=${global_downloadDir}
    # [Documentation]    Verifies that the directory has only one folder and it is not a temp file and returns path to the file
    # ${files} =    List Files In Directory    ${directory}
    # Length Should Be    ${files}    1
    # Should Not Match Regexp    ${files[0]}    (?i).*\\.tmp
    # Should Not Match Regexp    ${files[0]}    (?i).*\\.crdownload
    # ${file}    Join Path    ${directory}    ${files[0]}
    # Log    File was successfully downloaded to ${file}
    # [Return]    ${file}

# Wait Until File Download is Finished
    # [Arguments]    ${directory}=${global_downloadDir}    ${timeout}=${global_timeout}    ${retry}=2s
    # ${fileName} =    Wait Until Keyword Succeeds    ${timeout}    ${retry}    Download should be done    ${directory}
    # [Return]    ${fileName}  
      
      
# The value of the input should be
    # [Arguments]    ${expected}
    # ${Price}=    Get Element Attribute    //*[@id="totalPrice"]    value
    # Should Be Equal As Strings    ${Price}    ${expected}   
    
 
randomNumberGenerate
    [Arguments]                        ${RandNo}
    ${RandNo}=  Generate Random String  2   0123456789
    log    ${RandNo} 
    ${RandNo}=    Catenate              ${RandNo}   
    Log      ${RandNo} 
    ${RandNo}=    Set Variable         ${RandNo}
        
    
   

# VerifyAppVersion
     # Mouse Over                      ${ManageProfile}   
     # Click Element                   ${ManageProfile}       
     # Mouse Down                      ${aboutVersion}
     # Click Element                   ${aboutVersion}
     # Wait Until Page Contains        ${appVersion}   
     # Sleep  2

    
#Reusable Keywords   
open
    [Arguments]                                 ${element}
    Go To                                       ${element}


click
    [Arguments]                                 ${element}
    Click Element                               ${element}

sendKeys
    [Arguments]                                 ${element}    ${value}
    Press Keys                                  ${element}    ${value}

submit
    [Arguments]                                 ${element}
    Submit Form                                 ${element}

clickAndWait 
    [Arguments]                                 ${element}    
    # Run Keyword And Ignore Error             Click Element                            ${WelcomeAlert}
    Wait Until Element Is Visible               ${element}        #${waitTime}
    Click Element                               ${element}

type
    [Arguments]                                 ${element}    ${value}
    Input Text                                  ${element}    ${value} 

ClearTextBox
    [Arguments]        ${Locator}
    click         ${Locator}   
    Press Keys    ${Locator}            \BACKSPACE   
    Press Keys    ${Locator}            \BACKSPACE
    click         ${Locator}
    Press Keys    ${Locator}            \BACKSPACE
    Press Keys    ${Locator}            \BACKSPACE
    Press Keys    ${Locator}            \BACKSPACE
    Press Keys    ${Locator}            \BACKSPACE
    Press Keys    ${Locator}            \BACKSPACE
    Press Keys    ${Locator}            \BACKSPACE
    Press Keys    ${Locator}            \BACKSPACE
    Press Keys    ${Locator}            \BACKSPACE
    Press Keys    ${Locator}            \BACKSPACE
    Press Keys    ${Locator}            \BACKSPACE
    Press Keys    ${Locator}            \BACKSPACE
    Press Keys    ${Locator}            \BACKSPACE
    Press Keys    ${Locator}            \BACKSPACE


selectByValue
   [Arguments]                                  ${locator}                  ${value}
   Page Should Contain Element                  ${locator}                  #${waitTime}
   Select From List By Index                    ${locator}                  ${value}
   List Selection Should Be                     ${locator}                  ${value}
                 
selectAndWait
    [Arguments]                                 ${element}        ${value}
    Wait Until Element Is Visible               ${element}        #${waitTime}
    Select From List By Label                   ${element}        ${value}
    
select
    [Arguments]                                 ${element}   ${value}
    Wait Until Element Is Visible               ${element}        #${waitTime}
    Select From List By Label                   ${element}   ${value}    
    

verifyValue
    [Arguments]                                 ${element}  ${value}
    Element Should Contain                      ${element}  ${value}

verifyText
    [Arguments]                                 ${element}  ${value}
    Element Should Contain                      ${element}  ${value}

verifyElementPresent
    [Arguments]                                 ${element}
    Page Should Contain Element                 ${element}

verifyVisible
    [Arguments]                                 ${element}
    Page Should Contain Element                 ${element}

verifyTitle
    [Arguments]                                 ${title}
    Title Should Be                             ${title}

verifyTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertConfirmation
    [Arguments]                  ${value}
    Alert Should Be Present      ${value}

assertText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

assertTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

waitForTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

doubleClick
    [Arguments]           ${element}
    Double Click Element  ${element}

doubleClickAndWait
    [Arguments]           ${element}
    Double Click Element  ${element}
    

#Configuration functionality
SleepTimeForNextStep  
    [Arguments]    ${element}
    Sleep    2s        
    

WaitForNextStep
    [Arguments]            ${element}
    Set Selenium Implicit Wait    5s



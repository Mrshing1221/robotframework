*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${DELAY}          0
${CREATE URL}     http://${SERVER}/createClass.html	
${CREATED URL}    http://${SERVER}/classCreated.html	
${CREATE ERROR URL}     http://${SERVER}/classCreationError.html		

*** Keywords ***
Open Browser To Classcreation Page
    Open Browser    ${CREATE URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Classcreation Page Should Be Open
	
Classcreation Page Should Be Open
    Title Should Be    Create class	
	
Go To Classcreation Page
    Go To    ${CREATE URL}
    Classcreation Page Should Be Open
	
Input Title
    [Arguments]    ${title}
    Input Text    title_field    ${title}

Input Description
    [Arguments]    ${description}
    Input Text    description_field    ${description}
	
Submit Creation
    Click Button    submit_button
	
Select Difficulty
	[Arguments]    ${difficulty}
	Select From List By Index    xpath=//select[@id="difficulty_field"]    ${difficulty}
	
Select Language
	[Arguments]    ${language}
	Select From List By Index    xpath=//select[@id="language_field"]    ${language}

Created Page Should Be Open
    Location Should Be    ${CREATED URL} 
    Title Should Be    Result Page
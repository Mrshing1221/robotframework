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
${VALID USER}     demo
${VALID PASSWORD}    mode
${LOGIN URL}      http://${SERVER}/
${WELCOME URL}    http://${SERVER}/welcome.html
${ERROR URL}      http://${SERVER}/error.html
${CREATE URL}     http://${SERVER}/createClass.html	
${CREATED URL}    http://${SERVER}/classCreated.html	
${CREATE ERROR URL}     http://${SERVER}/classCreationError.html		

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page

Open Browser To Classcreation Page
    Open Browser    ${CREATE URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Classcreation Page Should Be Open
	
Classcreation Page Should Be Open
    Title Should Be    Create class	
	
Go To Classcreation
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
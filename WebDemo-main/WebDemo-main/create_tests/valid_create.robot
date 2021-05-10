*** Settings ***
Documentation     A test suite containing tests related to valid class creation.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Classcreation Page
Suite Teardown    Close Browser
Test Setup        Go To Classcreation Page
Test Template     Create Class With valid Credentials Should Success
Resource          resource.robot

*** Test Cases ***               					TITLE        	 DESCRIPTION			DIFFICULTY			LANGUAGE
Input All 1                 	 					text         	 text					1					1
Input All 2                 	 					text         	 text					1					2
Input All 3                	 						text         	 text					1					3
Input All 4                   	 					text         	 text					2					2
Input All 5                  	 					text         	 text					2					3
Input All 6                 	 					text         	 text					3					3



*** Keywords ***
Create Class With valid Credentials Should Success
    [Arguments]    ${title}    ${description}	${difficulty}	${language}
    Input Title    ${title}
    Input Description    ${description}
	Select Difficulty	 ${difficulty}
	Select Language		 ${language}
    Submit Creation
    Class Creation Should Have Successed

Class Creation Should Have Successed
    Location Should Be    ${CREATED URL}
    Title Should Be    Result Page

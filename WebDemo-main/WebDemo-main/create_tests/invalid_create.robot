*** Settings ***
Documentation     A test suite containing tests related to invalid class creation.
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
Test Template     Create Class With Invalid Credentials Should Fail
Resource          resource.robot

*** Test Cases ***               					TITLE        	 DESCRIPTION			DIFFICULTY			LANGUAGE
Empty Title 1                  	 					${EMPTY}         text					1					1
Empty Title 2                  	 					${EMPTY}         text					1					2
Empty Title 3                  	 					${EMPTY}         text					1					3
Empty Title 4                  	 					${EMPTY}         text					2					2
Empty Title 5                  	 					${EMPTY}         text					2					3
Empty Title 6                  	 					${EMPTY}         text					3					3
Empty Description 1               					text    		 ${EMPTY}				1					1
Empty Description 2               					text    		 ${EMPTY}				1					2
Empty Description 3               					text    		 ${EMPTY}				1					3
Empty Description 4               					text    		 ${EMPTY}				2					2
Empty Description 5               					text    		 ${EMPTY}				2					3
Empty Description 6               					text    		 ${EMPTY}				3					3
Empty Difficulty 1     			 					text         	 text					0					1
Empty Difficulty 2     			 					text         	 text					0					2
Empty Difficulty 3     			 					text         	 text					0					3
Empty Language 1      			 					text			 text					1         			0
Empty Language 2      			 					text			 text					2         			0
Empty Language 3      			 					text			 text					3         			0
Empty Title And Description 1		 				${EMPTY}         ${EMPTY}               1                   1
Empty Title And Description 2		 				${EMPTY}         ${EMPTY}               1                   2
Empty Title And Description 3		 				${EMPTY}         ${EMPTY}               1                   3
Empty Title And Description 4		 				${EMPTY}         ${EMPTY}               2                   2
Empty Title And Description 5		 				${EMPTY}         ${EMPTY}               2                   3
Empty Title And Description 6		 				${EMPTY}         ${EMPTY}               3                   3
Empty Title And Difficulty 1		 				${EMPTY}         text                   0            		1
Empty Title And Difficulty 2		 				${EMPTY}         text                   0            		2
Empty Title And Difficulty 3		 				${EMPTY}         text                   0            		3
Empty Title And Language 1         					${EMPTY}         text                   1                   0     
Empty Title And Language 2         					${EMPTY}         text                   2                   0 
Empty Title And Language 3         					${EMPTY}         text                   3                   0 
Empty Description And Difficulty 1 					text			 ${EMPTY}				0					1
Empty Description And Difficulty 2					text			 ${EMPTY}				0					2
Empty Description And Difficulty 3 					text			 ${EMPTY}				0					3
Empty Description And Language 1					text			 ${EMPTY}				1					0
Empty Description And Language 2					text			 ${EMPTY}				2					0
Empty Description And Language 3					text			 ${EMPTY}				3					0
Empty Difficulty And Language 						text			 text					0					0
Empty Title And Description And Difficulty 1		${EMPTY}		 ${EMPTY}				0					1
Empty Title And Description And Difficulty 2		${EMPTY}		 ${EMPTY}				0					2
Empty Title And Description And Difficulty 3		${EMPTY}		 ${EMPTY}				0					3
Empty Title And Description And Language 1			${EMPTY}		 ${EMPTY}				1					0
Empty Title And Description And Language 2			${EMPTY}		 ${EMPTY}				2					0
Empty Title And Description And Language 3			${EMPTY}		 ${EMPTY}				3					0
Empty Title And Language And Difficulty 			${EMPTY}		 text					0					0
Empty Description And Difficulty And Language		text			 ${EMPTY}				0					0
Empty All											${EMPTY}		 ${EMPTY}				0					0


*** Keywords ***
Create Class With Invalid Credentials Should Fail
    [Arguments]    ${title}    ${description}	${difficulty}	${language}
    Input Title    ${title}
    Input Description    ${description}
	Select Difficulty	 ${difficulty}
	Select Language		 ${language}
    Submit Creation
    Class Creation Should Have Failed

Class Creation Should Have Failed
    Location Should Be    ${CREATE ERROR URL}
    Title Should Be    Error Page

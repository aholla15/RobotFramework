*** Settings ***
Resource  ../Resources/common.robot
Resource  ../Resources/amazonKey.robot
Test Setup  Begin web test
Test Teardown  Closing
Library  SeleniumLibrary
*** Variables ***
${BROWSER} =  gc
${URL} =  Http://www.amazon.in
${SEARCH_TERM} =  ferrari 458
*** Test Cases ***
Navigate to SignIn page
    [Documentation]   Navigate to SignIn Page
    [Tags]  smoke
    Navigate to SignIn Page

Signing In with valid Username & Password
    [Documentation]  Valid Username & Password
    [Tags]  smoke
    Navigate to SignIn Page
    Enter Valid Username & Password

Searching Book through navigation bar
    [Documentation]  Search Book
    [Tags]  smoke
    Navigate to SignIn Page
    Enter Valid Username & Password
    Search Book from Navigation bar



*** Settings ***
Resource  ../Resources/common.robot
Resource  ../Resources/amazon.robot
Documentation  This is some basic info about the suite
Test Setup  Being web test
Test Teardown  Closing

*** Variables ***
${BROWSER} =  gc
${URL} =  Http://www.amazon.com
${SEARCH_TERM} =  ferrari 458
*** Test Cases ***
User must sign in to checkout
    [Documentation]  This is basic info about the test case
    [Tags]  Smoking
    Search for product








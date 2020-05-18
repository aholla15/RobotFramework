*** Settings ***
Documentation  This is some basic info about the suite
Library  SeleniumLibrary
*** Test Cases ***
User must sign in to checkout
    [Documentation]  This is basic info about the test case
    [Tags]  Smoking
    Open Browser  Http://www.amazon.com  gc
    Wait Until Page Contains    Discover Amazon
    Input Text  id=twotabsearchtextbox  ferrari 458
    Click Button    xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains    results for "ferrari 458"
    sleep   10
    Click Link  xpath=//*[@id="search"]/div[1]/div[2]/div/span[4]/div[1]/div[1]/div/span/div/div/span/a
    Close Browser





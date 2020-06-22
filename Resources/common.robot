*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Being web test
    Open Browser  ${URL}  ${BROWSER}

Closing
    Close Browser
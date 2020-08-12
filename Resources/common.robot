*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Begin web test
    Open Browser  ${URL}  ${BROWSER}


Closing
    Close Browser
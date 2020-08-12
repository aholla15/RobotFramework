*** Settings ***
Library  SeleniumLibrary
*** Keywords ***
Display product
    Input Text  id=twotabsearchtextbox  ${SEARCH_TERM}
    Click Button    xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains    results for "${SEARCH_TERM}"
    sleep   10

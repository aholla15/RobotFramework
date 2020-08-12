*** Settings ***
Library  SeleniumLibrary
*** Keywords ***
Signing In
    #Wait until keyword succeeds  60 s  1 s  Wait Until Page Contains Element  xpath=//div[@id="nav-signin-tooltip"]//span
    #click element  xpath=//div[@id="nav-signin-tooltip"]//span
    Wait Until page contains  Hello, Sign in
    click element  id=nav-link-accountList
    Wait Until Page Contains Element   name=signIn

UserName_Password
    Input Text  id=ap_email  ashwiniholla15@gmail.com
    click element  id=continue
    Wait Until Page Contains Element  id=ap_password
    Input Password  id=ap_password  Amazon_2012
    click element  id=signInSubmit
    Wait Until Page Contains  Deliver to Ashwini



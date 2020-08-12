*** Settings ***
Library  SeleniumLibrary
Library  Collections
*** Keywords ***
Search Book from Nav Bar
    click element   id=searchDropdownBox
    Wait Until Page Contains  All Categories
    click element  xpath=//*[@id="searchDropdownBox"]/option[13]
    Input Text  id=twotabsearchtextbox  IKIGAI
    Wait Until Page Contains Element  xpath=//*[@id="issDiv0"]
    click element  xpath=//*[@id="issDiv0"]
    Wait Until Page Contains  Ikigai: The Japanese secret to a long and happy life
    click element  xpath=//*[@id="search"]//span[3]//div[2]/div/span//div[2]//div[1]/h2/a/span
    @{Tabs} =  Get Window Titles
    select window  ${Tabs[1]}
    #@{list1} =  Get window handles
    #log to console  @{list1}
        #FOR ${Item} IN  @{list1}
         #   select window  ${Item}
          #  ${url}=  get location
           # log to console  ${url}
        #END



*** Settings ***
Resource  ../Resources/PO/landingpage.robot
Resource  ../Resources/PO/productpage.robot
*** Keywords ***
Search for product
    productpage.Load
    landingpage.Display product

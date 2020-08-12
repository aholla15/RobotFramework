*** Settings ***
Resource  ../Resources/PO/landingpage.robot
Resource  ../Resources/PO/productpage.robot
Resource  ../Resources/PO/SignIn.robot
Resource  ../Resources/PO/SearchBooks.robot
*** Keywords ***
Search for product
    productpage.Load
    landingpage.Display product

Navigate to SignIn Page
    SignIn.Signing In

Enter Valid Username & Password
    SignIn.UserName_Password

Search Book from Navigation bar
    SearchBooks.Search Book from Nav Bar
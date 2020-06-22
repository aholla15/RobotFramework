*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  RequestsLibrary
Library  Collections
Library  OperatingSystem

*** Variables ***
${base_url}  http://api.openweathermap.org
${bearerToken}  "Bearer fjakfdslfohk"
${requestURI}  /map.../json?
*** Test Cases ***
weather api
    create session  weather  ${base_url}
    ${response} =  get request  weather  /data/2.5/forecast?id=524901
    #log to console  ${response.status_code}
    #log to console  ${response.content}
    #log to console  ${response.headers}

    ${status_code} =  convert to string  ${response.status_code}
    should be equal  ${status_code}  200

    ${body}=  convert to string  ${response.content}
    should contain  ${body}  Delhi

    ${content_type_value}=  get from dictionary  ${response.headers}  Content-Type
    should be equal ${content_type_value}  application/json


TC1: to validate header & cookies
    Create session  mysession  ${base_url}
    ${response}=  get request  mysession  /photos
    log to console  ${response.headers}
    ${contentTypeValue}=  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${contentTypeValue}  application/json; charset=utf-8
    ${contentEncodeValue}=  get from dictionary  ${response.headers}  Content-Encoding
    should be equal  ${contentEncodeValue}  gzip

tc2: Test cookies
    create session  mysession  ${base_url}
    ${response}=  get request  mysession  /photos
    log to console  ${response.cookies}  #displays all the cookies from response
    {cookieValue}=  get from dictionary  ${response.cookies}  _cfuid
    log to console  {cookieValue}  #diplay specific cookie value

tc3: Basic authentication
    ${auth}=  create list  ToolsQA  TestPassword
    create session  mysession  ${base_url}  auth=  ${auth}
    ${response}=  get request  mysession  /authenticatoin/checkfor authentication
    log to console  ${response.content}
    should be equal as strings  ${response.status_code}  200

tc4: Bearer authentication
    create session  mysession  ${base_url}
    ${headers}  create dictionary  Authorization= ${bearerToken}  content-type= text/xml
    ${req_body}=  get file  location of the data file .txt
    ${response}=    post request  mysession  /  data= ${req_body}  headers=  ${headers}
    log to console  ${response.status_code}
    log to console  ${response.content}

tc5: API key authentication
    create session  mysession  ${base_url}
    ${params}  create dictionary  ${base_url}  location=3243  radius=34
    ${response}=  get request  mysession ${reqURI}  params= ${params}
    log to console  ${response.status_code}
    log to console  ${response.content}



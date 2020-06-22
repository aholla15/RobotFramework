*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}  http://localhost:8080

*** Test Cases ***
TC1:Returns all the video games(Get)
    create session  mysession  ${base_url}
    ${response}=  get request  mysession  /app/videogames
    log to console  ${response.status_code}
    log to console  ${response.content}

    #validation
    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  200


TC2: Add new video (POST)
    create session  mysession  ${base_url}
    ${body}=  create dictionary  id=100  name=Spider-Man
    ${header}=  create dictionary  Content-Type=application/json
    ${response} =  post request  mysession  /app/videogames  data = ${body}  headers = ${header}

    log to console ${response.status_code}
    log to console ${response.content}

    ${status_code}=  convert to string  ${response.status_code}
    should be equal ${status_code}  200

    ${res_body}=  convert to string  ${response.content}
    should contain  ${res_body}  recode added successfully

TC3:Returns all the video games with id(Get)
    create session  mysession  ${base_url}
    ${response}=  get request  mysession  /app/videogames/100
    log to console  ${response.status_code}
    log to console  ${response.content}

    #validation
    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  200

     ${res_body}=  convert to string  ${response.content}
    should contain  ${res_body}  spiderman

TC4:Modify existing record(Put)
   create session  mysession  ${base_url}
    ${body}=  create dictionary  id=100  name=Super-Man
    ${header}=  create dictionary  Content-Type=application/json
    ${response} =  put request  mysession  /app/videogames/100  data = ${body}  headers = ${header}

    log to console ${response.status_code}
    log to console ${response.content}

    ${status_code}=  convert to string  ${response.status_code}
    should be equal ${status_code}  200

    ${res_body}=  convert to string  ${response.content}
    should contain  ${res_body}  super-man

TC5:Delete a entry(Del)
   create session  mysession  ${base_url}
   ${response} =  delete request  mysession  /app/videogames/100

    ${status_code}=  convert to string  ${response.status_code}
    should be equal ${status_code}  200

    ${res_body}=  convert to string  ${response.content}
    should contain  ${res_body}  record deleted successfully






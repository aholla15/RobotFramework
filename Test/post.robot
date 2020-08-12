*** Settings ***
Library  RequestsLibrary
Library  Collections


*** Variables ***
${base_url}  https://reqres.in/api/users
*** Test Cases ***
user post api
    create session  apiuser  ${base_url}
    ${body}=  create dictionary  name=morpheus  job=leader
    ${head}=  create dictionary  Content-Type=application/json

    ${response}=  post request  apiuser  header=${head}  data=${body}

    log to console  ${response.status_code}
    log to console  ${response.content}

    #validations

    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  201


    ${res_body}=   convert to string  ${response.content}
    should contain  ${res_body}  createdAt












*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary
Library  os
Library  Requests
Library  XML
*** Variables ***
${base_url}  http://localhost:8080

*** Test Cases ***
    {json_obj} =    load json from file  c:/
    ${fax_number}  =  get value from json  ${json_obj}  $.phonenumber[1].number
    should be equal  ${fax_number[0]}  646 564-001

  -----
  ${xml_ob}  =  parse.xml  c:/
  ${emp_firstname} =  get element text  ${xml_obj}  .//employer[1]/firstname
  should be equal  ${emp_firstname}  john

  approach 2
  ${emp_firstname} =  get element   ${xml_obj}  .//employer[1]/firstname
  should be equal  ${emp_firstname.text}  john

  approach 3
  element text should be  ${xml_obj}  John  .//employer[1]/firstname

TC2

    Create session  mysession  ${base_url}
    ${response} =  get request  mysession  /relativeurl
    ${json_obj} =  to json  ${response.content}

    #validation
    ${country_name}=  get value from json  ${json_ob}  $.name
    log to console  ${country_name[0]}
    should be equal  ${county_name[0]}
    #another approach
    should contain any  ${country_name[0]}  AFG bdG  lks
    should not contain any  ${country_name[0]}  AFG bdG

tc3
    ${count}=  get element count  ${xml.obj}  .//employee
    should be equal as integers  ${count}  6

tc4
    element attribute should be  ${xml_obj}  id  be135  .//employee[6]

tc5
    ${child_element}=  get child elements  ${xml_obj}  .//rmployee[1]
    should not be empty  ${child_elements}

    ${fname}= get element text  ${child_elements[0]}
    log to console  ${fname}
    should be equal  ${fname}  john

 tc1
    create session  mysession  ${base_url}
    ${response}=  convert to string  ${response.content}
    ${xml_obj}=  parse xml  {xml_string}

   #validatiom
   element text should be  ${xml_ob}  15  .//ID
    #checking multiple elements
    ${child_elements}=  get child elements  ${xml_obj}
    should not be empty  ${child_elements}
    ${id}=  get element text  ${child_elements[0]}
    should be equal  ${id}  15


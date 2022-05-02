*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/4788R.robot

*** Test Cases ***
Breakdown std services
    Open Browser To Login Page      ${url}      ${BROWSER}
    Enter Login Details     ${Email}    ${Password}
    Heading to req company tab      ${company_name}
    Heading to statement of work
#    By default agency fee 15%
    Decrement should be of 1%
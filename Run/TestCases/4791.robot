*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/4791R.robot

*** Test Cases ***
Breakdown std services
    Open Browser To Login Page      ${url}      ${BROWSER}
    Enter Login Details     ${Email}    ${Password}
    Heading to req company tab      ${company_name}
    Heading to statement of work
    All checkboxes should be selected by default
    All checkboxes should be deselected after clicking deselect all
    Checking with HTML Table
    Checking Partial checkboxes
    Comparing contract table and checkbox values

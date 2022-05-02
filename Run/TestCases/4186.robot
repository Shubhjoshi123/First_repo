*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/4186R.robot





*** Test Cases ***
To view past & upcoming invoices
    Open Browser To Login Page      ${url}      ${BROWSER}
    Enter Login Details     ${Email}    ${Password}
    Heading to req company tab      ${company_name}
    Heading to DSP tab
    Creating adjustment for opened company
    Getting value from table
    close browser

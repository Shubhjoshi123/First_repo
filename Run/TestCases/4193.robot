*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/4193R.robot





*** Test Cases ***
DSP Sign-off
    Open Browser To Login Page      ${url}      ${BROWSER}
    Enter Login Details     ${Email}    ${Password}
    Heading to req company tab      ${company_name}
    Heading to DSP tab
    Creating adjustment for opened company
    Get the previous step
    Creating adjustment for opened company
    Checking the edit functionality with Negative scenario
    Checking the edit functionality with positive scenario
    Approve and check for alert
    Pause Invoices
    close browser

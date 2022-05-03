*** Settings ***
Library     SeleniumLibrary
Variables   LocatorsJ.py


*** Variables ***
${url}      https://staging.next.buyboxexperts.com/signin
${browser}  Chrome

${Email}    sjoshi@buyboxexperts.com
${Password}     BBEShubh@230597

${Company_name}     Rolex

*** Keywords ***
Open Browser To Login Page
    [documentation]     Used for opening browser
    [Arguments]     ${LOGIN URL}      ${BROWSER}
    Open Browser  ${LOGIN URL}  ${BROWSER}
    Maximize Browser Window

Enter Login Details
    [documentation]     Login credential provided in this keyword
    [Arguments]     ${Email}    ${Password}
    # Enter Email
    input text      ${BBE_USERNAME}        ${Email}
    click button    ${CONTINUE_BUTTON}
    Sleep       4
    # Enter Password
    input text      ${BBE_Password}       ${Password}
    click button    xpath://button[text()="Sign In"]
    sleep       3

Heading to req company tab
    [documentation]     Req company can be allocated upto main functionality
    [Arguments]        ${company_name}
    click element       ${partner_tab}
    sleep       5
    click element   ${search_box}
    press keys      None        ${Company_name}
    sleep       6
    click element   ${searched_company}
    sleep       3

Heading to DSP tab
    click element   ${billing_tab}
    sleep       5
    press keys      ${body}     PAGE_UP
    sleep       3
    click element   ${dsp_tab}
    sleep       3
    click button    ${cr_adjustment}
    sleep       4

Creating adjustment for opened company
    click element    ${dropdown}
    sleep       2
    press keys      None        ARROW_DOWN
    press keys      None        ENTER
    sleep       4
    input text      ${TB_1}     1000
    input text      ${TB_2}     2000
    input text      ${TB_3}     3000
    input text      ${TB_4}     7000
    sleep       2
    click button    ${cont_button}
    sleep       3

Get the previous step
    click element   ${back_arrow}
    click element   ${rb_2}
    sleep       2
    click element   ${rb_3}
    sleep       2

Checking the edit functionality with Negative scenario
    click element   ${edit}
    sleep       2
    clear element text      ${TB_1_1}
    element should be visible   ${TB_1_1}
    element should be enabled   ${TB_1_1}

    clear element text      ${TB_1_2}
    element should be visible   ${TB_1_2}
    element should be enabled   ${TB_1_2}

    clear element text      ${TB_1_3}
    element should be visible   ${TB_1_3}
    element should be enabled   ${TB_1_3}
    input text      ${TB_1_3}        abcgmailcom

    clear element text      ${TB_1_4}
    element should be visible   ${TB_1_4}
    element should be enabled   ${TB_1_4}
    input text      ${TB_1_4}        1234

    click element   ${Confirm}
    sleep       3

    element should be visible   ${Error_alert_3}
    element should be visible   ${Error_alert_4}

    input text      ${TB_1_1}        shubh
    input text      ${TB_1_2}        joshi
    click element   ${Confirm}
    sleep       2

    element should be visible   ${Error_alert_3}
    element should be visible   ${Error_alert_4}

    click element   ${close}
    sleep       2

Checking the edit functionality with positive scenario
    click element   ${edit}
    sleep       2
    clear element text      ${TB_1_1}
    element should be visible   ${TB_1_1}
    element should be enabled   ${TB_1_1}
    input text      ${TB_1_1}        Shubh

    clear element text      ${TB_1_2}
    element should be visible   ${TB_1_2}
    element should be enabled   ${TB_1_2}
    input text      ${TB_1_2}        joshi

    clear element text      ${TB_1_3}
    element should be visible   ${TB_1_3}
    element should be enabled   ${TB_1_3}
    input text      ${TB_1_3}        abc@gmail.com

    clear element text      ${TB_1_4}
    element should be visible   ${TB_1_4}
    element should be enabled   ${TB_1_4}
    input text      ${TB_1_4}        1234567890

    click element   ${close}
    sleep       2

Approve and check for alert
    click element   ${approve}
    wait until page contains        invoice Adjustment created successfuly
    page should contain         invoice Adjustment created successfuly

Pause Invoices
    sleep       10
    click button    ${cr_adjustment}
    sleep       3
    click element   ${Pause}
    click element    ${dropdown}
    sleep       2
    press keys      None        ARROW_DOWN
    press keys      None        ENTER
    sleep       4
    click element   ${Radio_button_1}
    click element   ${Radio_button_3}
    click element   ${Radio_button_5}
    click element   ${Radio_button_7}
    click element   ${continue_pause}
    sleep       2
    click element   ${continue_pause}

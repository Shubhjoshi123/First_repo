*** Settings ***
Library     SeleniumLibrary
Variables   LocatorsJ.py
Library   String
Library     StringFormat

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

Getting value from table
    ${Value}=   get text        ${amount_value}
    log      ${Value}
    ${market}=  get text        ${market_name}
    log     ${market}
    ${market_1}=    Convert to string       ${market}
    ${fromtablewith$} =    set variable     ${Value}
    ${fromtablewith} =      Remove String       ${fromtablewith$}       ,       $
    ${Ownvalue} =       set variable     ${5000}
    ${finalvalue} =      Evaluate     ${fromtablewith}+${Ownvalue}
    log      ${finalvalue}
    input text      ${TB_1}     ${finalvalue}
    sleep       2
    click button    ${cont_button}
    sleep       3
    click element   ${approve}
    sleep       15


    click element       ${past_invoices}
    sleep       3

    # Count No. of rows
    ${No_of_rows}=    get element count     (//table[@class="sc-fFubgz bjNVbG mt-0"]) [1]//tbody//tr

    ${No_of_rows_1}=      Evaluate        ${No_of_rows} + 1

    FOR     ${i}    IN RANGE    1    ${No_of_rows_1}
        ${a}=         format string       //tbody//tr [{0}]//td [2]      ${i}
        log      ${a}
        ${b}=       set variable        (//table[@class="sc-fFubgz bjNVbG mt-0"]) [1]
        ${c}=       set variable        ${b}${a}
        log      ${c}
        ${d}=   get text        ${c}
        ${e}=   set variable        ${d}
        ${f}=    Remove String        ${e}   ,    $
        ${g}=       Convert To Number       ${f}
        Exit For Loop If     ${f} == ${finalvalue}
    END
    log to console      Amount Matched

    FOR     ${i}    IN RANGE    1    ${No_of_rows_1}
        ${z}=         format string       //tbody//tr [{0}]//td [1]//div [2]      ${i}
        log      ${z}
        ${y}=       set variable        (//table[@class="sc-fFubgz bjNVbG mt-0"]) [1]
        ${x}=       set variable        ${y}${z}
        log      ${x}
        ${w}=   get text        ${x}
        ${v}=   set variable        ${w}
        ${t}=   Convert to string        ${v}
        Exit For Loop If     "${t}" == "${market_1}"
    END

    log to console      Marketplace Matched
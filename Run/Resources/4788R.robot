*** Settings ***
Library     SeleniumLibrary
Variables   LocatorsJ.py
Library     String
Library     StringFormat



*** Variables ***
${url}      https://staging.next.buyboxexperts.com/signin
${browser}  Chrome

${Email}    sp.joshi@gmail.com
${Password}     Shubh@96

${Company_name}     Test_Breakdown

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
    sleep       7

Heading to statement of work
    click element   ${View_action}
    sleep       3
    press keys      None        ARROW_DOWN
    sleep       1.5
    press keys      None        ENTER
    sleep       8
#    wait until element is visible    ${SERVICE_AGREEMENT_HEADER}
    press keys      None        TAB
    sleep       0.8
    press keys      None        TAB
    click element   ${SERVICE_AGREEMENT}
    sleep       0.8
    click element       ${DSP_Advertising}
    Execute javascript  document.body.style.zoom="70%"
    sleep       3
    execute javascript  scrollTo(0,5700)

By default agency fee 15%
    ${default_fee_0} =    set variable    ${15}
    ${default_fee_1} =    convert to string     ${default_fee_0}

    ${fee} =  get text  ${Contract_percentage}
    ${Selected_fee_0} =    convert to string     ${fee}
    ${Selected_fee_1} =    Remove String        ${Selected_fee_0}   ,    %
    should be equal as strings     ${default_fee_1}    ${Selected_fee_1}

Decrement should be of 1%
    ${fee} =  get text  ${Contract_percentage}
    ${Selected_fee_0} =    convert to string     ${fee}
    ${Selected_fee_1} =    Remove String        ${Selected_fee_0}   ,    %
    log to console      ${Selected_fee_1}

    sleep           5           # Monthly AD Budget
    press keys      None        TAB
    press keys      None        10000
    sleep       2               # Agency Fee Percentage
    press keys      None        TAB
    sleep       2
    press keys      None        ARROW_DOWN
    press keys      None        ARROW_DOWN
    press keys      None        ENTER
    sleep       2               # Initial Period
    press keys      None        TAB
    press keys      None        ARROW_DOWN
    sleep       2
    press keys      None        ARROW_DOWN
    press keys      None        ARROW_DOWN
    sleep       2
    press keys      None        ENTER
    sleep       2               # DSP MarketPlace
    press keys      None        TAB
    press keys      None        ARROW_DOWN
    press keys      None        ENTER

    ${fee_A} =  get text  ${Contract_percentage}
    ${Selected_fee_B} =    convert to string     ${fee_A}
    ${Selected_fee_C} =    Remove String        ${Selected_fee_B}   ,    %
#    log to console      ${Selected_fee_C}

    ${Calculation} =    Evaluate       ${Selected_fee_1}-${Selected_fee_C}
#    log to console      ${Calculation}

    ${Decrement} =      set variable        ${1}
    Should be equal as strings      ${Calculation}      ${Decrement}

    press keys      None        TAB
    press keys      None        ENTER
    sleep       3

    select frame        (//div[@class="container-fluid"]) [2]
#    scroll element into view        ${Save_Changes}
    click button        ${Save_Changes}
    sleep       5
    click element       ${Cross}
    sleep       5
    Execute javascript  document.body.style.zoom="70%"
    sleep       3

*** Settings ***
Library     SeleniumLibrary
Variables   LocatorsJ.py
Library     Collections
Library     String
Library     StringFormat
Library     shubham.py



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
    sleep       3
    click element   ${searched_company}
    sleep       5

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
#    click element   ${SERVICE_AGREEMENT}
    click element       (//h4[@class="sendar-details"]) [1]
    sleep       0.8
    click element   ${STATEMENT_OF_WORK1}
    sleep       2



All checkboxes should be selected by default
    click element       ${select_deselect}
#    click element       ${select_deselect}
    checkbox should be selected     ${Expert}
    checkbox should be selected     ${plan}
    checkbox should be selected     ${call}
    checkbox should be selected     ${creation}
    checkbox should be selected     ${Compliance}
    checkbox should be selected     ${Consultation}
    checkbox should be selected     ${Catalog}
    checkbox should be selected     ${Seller}
    checkbox should be selected     ${Reporting}
    checkbox should be selected     ${Holiday}
    checkbox should be selected     ${Promotion}
    checkbox should be selected     ${Advertising}
    checkbox should be selected     ${Account}
    checkbox should be selected     ${Strategy}
    checkbox should be selected     ${Total}
    checkbox should be selected     ${Channel}

All checkboxes should be deselected after clicking deselect all
    click element       ${select_deselect}
    Sleep       2
    checkbox should not be selected     ${Expert}
    checkbox should not be selected     ${plan}
    checkbox should not be selected     ${call}
    checkbox should not be selected     ${creation}
    checkbox should not be selected     ${Compliance}
    checkbox should not be selected     ${Consultation}
    checkbox should not be selected     ${Catalog}
    checkbox should not be selected     ${Seller}
    checkbox should not be selected     ${Reporting}
    checkbox should not be selected     ${Holiday}
    checkbox should not be selected     ${Promotion}
    checkbox should not be selected     ${Advertising}
    checkbox should not be selected     ${Account}
    checkbox should not be selected     ${Strategy}
    checkbox should not be selected     ${Total}
    checkbox should not be selected     ${Channel}

    click element       ${select_deselect}


Checking with HTML Table
    sleep       2
    scroll element into view        ${HTML_Table}

Checking Partial checkboxes
    scroll element into view        ${STATEMENT_OF_WORK1}
    click element       ${Expert_1}
    click element       ${plan_1}

    scroll element into view        ${Channel_1}
    click element       ${Catalog_1}
    click element       ${Seller_1}
    click element       ${Advertising_1}
    click element       ${Account_1}

Comparing contract table and checkbox values
    @{Checkboxes_names} =   create list  Expert Strategy and Consultation  Strategic Plan  Catalog Management and Organization  Seller Performance Consultation  Advertising Management  Seller Account Management

    # Creating List from tables
    ${No_of_rows}=    get element count     //table[@class=" contact-list "]//tr
    ${No_of_rows_1}=      Evaluate        ${No_of_rows} + 1

     ${a}=         StringFormat.Format String       //tr [{0}]      ${No_of_rows}
     log      ${a}
     ${b}=       set variable        //td
     ${c}=       set variable        //table[@class=" contact-list "]
     ${d}=       set variable        ${c}${a}${b}
     log      ${d}

    # This are columns of last row
    ${No_of_columns}=    get element count     ${c}
    ${No_of_columns_1}=      Evaluate        ${No_of_columns} + 1

    # List for table contains
    @{table_items}=     create list

    FOR     ${i}    IN RANGE    2    ${No_of_rows_1}
         FOR     ${j}    IN RANGE    1    4
             ${a}=         StringFormat.Format String       //tr [{0}]      ${i}
             log      ${a}
             ${b_1}=         StringFormat.Format String       //td [{0}]      ${j}
             ${b}=       set variable        ${b_1}
             ${c}=       set variable        //table[@class=" contact-list "]
             ${d}=       set variable        ${c}${a}${b}
             log      ${d}
             ${Value}=   Run Keyword And Ignore Error       get text        ${d}
             append to list     ${table_items}      ${Value}
         END
    END
    list should not contain value       ${table_items}       ${Checkboxes_names}


    scroll element into view        ${Save_Changes}
    click button        ${Save_Changes}
    sleep       5
    click element       ${Cross}
    sleep       5
    Execute javascript  document.body.style.zoom="70%"
    sleep       3

    ${m}=       get element count       ${agreement_services}
    log  ${m}
    ${n}=       Evaluate        ${m} + 1

#    ${o}=   get text        ${agreement_services_1}
#    log to console      ${o}

    @{Under_agreements}=    create list


    FOR     ${i}    IN RANGE    1       ${n}
        ${x}=       StringFormat.Format String       //li [{0}]) [1]      ${i}
        ${y}=       set variable        ((//div[@class="sc-jHVexB iiHqcD"]//ul[@class="selected-list"])
        ${z}=       set variable        ${y}${x}
        ${o}=       get text        ${z}
#        log to console      ${o}
        append to list      ${Under_agreements}    ${o}
    END

    log to console      ${Under_agreements}
    @{Under_agreements_1} =     create list
    ${Value_4}=      shubham.main       ${Under_agreements}
#    log to console      ${Value_4}
#    list should contain value      ${Value_4}      ${table_items}

    ${length} =     Get length      ${Value_4}
    FOR     ${i}    IN RANGE    0       ${length}
        ${T} =  Get from list   ${Value_4}     ${i}
        should contain       ${table_items}       ${T}
    END

    close browser
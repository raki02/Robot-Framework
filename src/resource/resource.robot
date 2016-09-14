*** Settings ***
Documentation     A resource file with reusable keywords and variables.
Library           Selenium2Library    30    30

*** Variables ***
${BROWSER}        ff
${DELAY}          1.0
${REMOTE_URL}     ${Empty}
${DESIRED_CAPABILITIES}    ${Empty}

*** Keywords ***
Browser Setup
    #Open Browser    about:    ${BROWSER}
    Open browser    about:    ${BROWSER}    remote_url=${REMOTE_URL}    desired_capabilities=${DESIRED_CAPABILITIES}
    Set Selenium Speed    ${DELAY}

Close Test Browser
    Run keyword if    '${REMOTE_URL}' != ''    Report Sauce Status    Arcus ${SUITE_NAME}    ${PREV_TEST_STATUS}
    Close all browsers

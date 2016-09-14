*** Settings ***
Documentation     Login Page Methods
Resource          ../main/basepage.robot

*** Variables ***
# List of Locators
${input_email}    id=autofocus
${input_password}    name=password
${btn_login}      css=.button-auth
${err_msg}        css=.error
# Data variables
${uservalue}      robot@droptask.com
${mypass}         robot123
&{robot_login}    username=robot@droptask.com    password=robot123
&{test_login}     username=in_test@droptask.com    password=test123
&{invalid_login}    username=robotd1@droptask.com    password=robot_123

*** Keywords ***
Login To Application
    [Arguments]    ${username}    ${password}
    [Documentation]    Login into application with given username and password.
    Wait Until Element Is Visible    ${input_email}    ${TIME_OUT}
    Input Text    ${input_email}    ${username}
    Input Password    ${input_password}    ${password}
    Click Element    ${btn_login}

Login Failed Message
    [Documentation]    Check whether an error message is displayed on login with invalid username or password.
    Element Should Contain    ${err_msg}    Incorrect email address and/or password.

Open Browser and Login
    [Documentation]    Open and maximize the browser, login into the application.
    Open Browser To Login Page
    Login To Application    ${uservalue}    ${mypass}

Login With Valid Credentials Should Pass
    [Arguments]    ${username}    ${password}
    [Documentation]    Login to the application with a valid username and password will login successfully.
    Open Browser To Login Page
    Login To Application    ${username}    ${password}
    Logout of Application

Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    [Documentation]    Login with an invalid username or password will throw an error.
    Open Browser To Login Page
    Login To Application    ${username}    ${password}
    Login Failed Message

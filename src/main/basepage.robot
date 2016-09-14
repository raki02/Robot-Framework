*** Settings ***
Resource          ../resource/resource.robot

*** Variables ***
${LOGIN_URL}      https://app.droptask.com
${TIME_OUT}       50s
${user_menu}      css=#header-menu
${Settings_menu}    css=button[title*='settings']
${logout_menu}    css=#menu-logout
${search_project}    xpath=//i[@class='icon-dt_projects']/ancestor::div/div[@class='controls']/div[2]
${menu_createProject}    css=.menu-item.create-new-project
${confirm_btn}    css=.confirm
${icon_close}     xpath=//button[@data-dismiss="modal"]

*** Keywords ***
Open Browser To Login Page
    [Documentation]    Go to https://app.droptask.com, maximize browser and verify the page title.
    Go To    ${LOGIN_URL}
    Maximize Browser Window
    Login Page Should Be Open

Login Page Should Be Open
    [Documentation]    In login page, verify the title 'DropTask Authentication'
    Title Should Be    DropTask Authentication

Logout of Application
    [Documentation]    Logout of the application
    Click Element    ${user_menu}
    Click Element    ${logout_menu}

Delete Cookies and Logout
    [Documentation]    Logout of the application and delete cookies.
    Logout of Application
    Delete All Cookies

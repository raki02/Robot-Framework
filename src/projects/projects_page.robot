*** Settings ***
Documentation     Projects Page Methods
Resource          ../login/login_page.robot

*** Variables ***
#List of Locators
${input_projectName}    css=#project-create-name
${input_contact}    css=.has-options>input
${btn_createProject}    css=*[value='Create Project']
${icon_trash}     css=#project-edit-delete-project
${project_menu}    css=.menu-project-link
#Data Variables
&{create_project}    project_name=CRM    contact_name=Shwetha
&{delete_project}    project_name=Self Storage Manager    contact_name=Jayalakshm
&{edit_project}    project_name=e-CRM    contact_name=Arundhati

*** Keywords ***
Create Project
    [Arguments]    ${project_name}    ${contact_name}
    [Documentation]    Navigate to 'Create Project' page and create a project.
    Click Element    ${user_menu}
    Click Element    ${search_project}
    Click Element    ${menu_createProject}
    Input Text    ${input_projectName}    ${project_name}
    Click Element    ${input_contact}
    Click Element    css=.name[title*='${contact_name}']
    Click Button    ${btn_createProject}
    Wait Until Element Is Visible    ${Settings_menu}

Delete Project
    [Documentation]    Delete a project using trash icon.
    Click Element    ${Settings_menu}
    Click Element    ${icon_trash}
    Click Button    ${confirm_btn}

Verify That Project Is Created
    [Arguments]    ${project_name}
    [Documentation]    Verify that created project name is in project menu.
    Element Should Contain    ${project_menu}    ${project_name}
    Click Element    ${user_menu}

Verify That Project Is Deleted
    [Arguments]    ${project_name}
    [Documentation]    Verify that project has been deleted.
    Element Should Contain    css=div[class*='sortable'] .header    No Active Projects
    Click Element    ${user_menu}

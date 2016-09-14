*** Settings ***
Suite Setup       Browser Setup
Suite Teardown    Close Test Browser
Test Setup        Open Browser and Login
Test Teardown     Delete Cookies and Logout
Metadata          Executed At    %{COMPUTERNAME}
Metadata          Test User    Jayalakshmi
Metadata          Operating System    %{OS}
Metadata          Processor    %{PROCESSOR_LEVEL}
Metadata          Test Framework    Robot Framework Python
Resource          ../login/login_page.robot
Resource          projects_page.robot

*** Test Cases ***
Create New Project
    Create Project    &{create_project}
    Verify That Project Is Created    &{create_project}[project_name]
    [Teardown]    Run Keywords    Delete Project
    ...    AND    Delete Cookies and Logout

Delete Created Project
    Create Project    &{delete_project}
    Delete Project
    Verify That Project Is Deleted    &{delete_project}[project_name]

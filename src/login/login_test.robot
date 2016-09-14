*** Settings ***
Suite Setup       Browser Setup
Suite Teardown    Close Test Browser
Metadata          Executed At    %{COMPUTERNAME}
Metadata          Test User    Jayalakshmi
Metadata          Operating System    %{OS}
Metadata          Processor    %{PROCESSOR_LEVEL}
Metadata          Test Framework    Robot Framework Python
Resource          login_page.robot

*** Test Cases ***
Valid Login Test Case
    [Template]    Login With Valid Credentials Should Pass
    &{robot_login}

Invalid Login Test Case
    [Template]    Login With Invalid Credentials Should Fail
    &{invalid_login}
    &{robot_login}[username]    &{invalid_login}[password]
    &{invalid_login}[username]    &{robot_login}[password]

*** Settings ***
Documentation    Tudo começa aqui

Resource    pages/login.resource
Resource    components/toast.resource
Resource    components/nav.resource
Resource    pages/enroll.resource

Resource    services/sessions.resource
Resource    services/students.resource

Resource    database.resource
Library     JSONLibrary

*** Keywords ***
# Helpers
Do Login
    [Arguments]    ${user}
    Go to login Page
    Fill Credencials    ${user}[email]    ${user}[pass]
    Submit Credencials
    User should be logged in    ${user}[name]

Get Fixtures
    [Arguments]    ${fixture_file}

    ${fixture}    Load Json From File    
    ...           ${EXECDIR}/web/resources/fixtures/${fixture_file}.json
    ...           encoding=UTF-8

    [Return]      ${fixture}
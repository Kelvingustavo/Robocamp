*** Settings ***
Documentation    Tudo começa aqui

Resource    ../resources/pages/login.resource
Resource    ../resources/components/toast.resource
Resource    ../resources/components/nav.resource
Resource    ../resources/pages/enroll.resource

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
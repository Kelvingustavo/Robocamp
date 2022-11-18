*** Settings ***
Library    Browser

*** Keywords ***
Go to login Page
    New Browser    headless=false    browser=chromium
    New Page       http://localhost:3000

Fill Credencials
    [Arguments]    ${email}    ${pass}
    Fill Text        css=input[placeholder="Seu e-mail"]        ${email}
    Fill Text        css=input[placeholder="Sua Senha"]         ${pass}

Submit Credencials
    Click            css=button >> text=Entrar no sistema
# Versões alternativas de como escolher um elemento
    # Click            xpath=//button[text()="Entrar no sitema"]
    # Click            text=Entrar no sistema

Field Type should be Email
    Get Attribute    css=input[placeholder="Seu e-mail"]
    ...    Type    equal    email

Alert Text should be
    [Arguments]       ${field}     ${expected_text}

    Get Text    xpath=//input[@type="${field}"]/..//span
    ...         equal       ${expected_text}
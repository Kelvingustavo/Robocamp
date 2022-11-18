*** Settings ***
Documentation    Keywords que representam a pagina de cadastro de matriculas
Library          Browser
Library          libs/DateTricks.py

*** Keywords ***
Go to Enrolls
    Click    css=a[href="/matriculas"]

Go to Enroll Form
    Click    css=a[href="/matriculas/new"]
    
Select Student
    [Arguments]    ${student}
    Fill Text    xpath=//div[contains(text(), "nome do aluno")]/..//input    
    ...          ${student}

    Click        css=div[class$=option] >> text=${student}
    
Select Plan
    [Arguments]    ${plan}
    Click        xpath=//label[text()="PLANO"]/..//div[contains(text(), "Selecione")]

    Click        css=div[class$=option] >> text=${plan}
    
Fill start Date
    [Arguments]    ${date}

    Focus    css=input[name=start_date]

    ${start_date}    Get Start Date
    
    FOR    ${number}    IN    @{start_date}
        Keyboard Key    press     ${number} 
    END
*** Settings ***
Documentation    Suite de testes de matricula de alunos
Resource    ../resources/base.resource


*** Test Cases ***
Deve Matricular um aluno

    ${admin}      Get Fixtures    admin
    ${student}    Get Fixtures    student

    Reset Student Enroll    ${student}[email]
    Do Login    ${admin}

    Go to Enrolls
    Go to Enroll Form
    Select Student     ${student}[name]
    Select Plan        ${student}[enroll][plan]
    Take Screenshot    
    Fill Start Date
    Submit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso

    Sleep    5
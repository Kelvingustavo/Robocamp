*** Settings ***
Documentation    Suite de testes de matricula de alunos
Resource    ../resources/base.resource

*** Test Cases ***
Deve Matricular um aluno

    #Falcao não mexer
    #Smart
    #11/10/2022

    ${admin}    Create Dictionary
    ...        name=Admin
    ...        email=admin@smartbit.com
    ...        pass=qacademy

    Do Login    ${admin}

    Go to Enrolls
    Go to Enroll Form
    Select Student     Falcão Não mexer
    Select Plan        Smart
    Fill start Date    10


    Sleep    5



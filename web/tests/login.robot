*** Settings ***
Documentation    Suite de testes de autenticação
Resource    ../resources/base.resource


*** Test Cases ***
Login do Administrador
    Go to login Page
    Fill Credencials    admin@smartbit.com    qacademy
    Submit Credencials
    User should be logged in    Admin

Email não cadastrado
    Go to login Page
    Fill Credencials    404@smartbit.com    qacademy
    Submit Credencials
    Verify Toaster    Suas credenciais são inválidas, por favor tente novamente!

Senha invalida
    Go to login Page
    Fill Credencials    admin@smartbit.com    123456
    Submit Credencials
    Verify Toaster    Suas credenciais são inválidas, por favor tente novamente!

Email no formato incorreto
    Go to login Page
    Fill Credencials    $@com.br    123456  
    Submit Credencials

Senha em branco
    Go to login Page
    Fill Credencials    admin@smartbit.com    ${EMPTY}
    Submit Credencials
    Alert Text should be    password     A senha é obrigatória

Email em branco
    Go to login Page
    Fill Credencials    ${EMPTY}    qacademy
    Submit Credencials
    Alert Text should be    email        O e-mail é obrigatório

Email e senha são obrigatorios
    Go to login Page
    Submit Credencials
    Alert Text should be    email       O e-mail é obrigatório
    Alert Text should be    password    A senha é obrigatória

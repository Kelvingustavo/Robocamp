*** Settings ***
Documentation    Gerenciando a massa de testes atraves do banco de dados

Library    DatabaseLibrary

*** Keywords ***
Connect To Postgres    
    Connect To Database	    psycopg2
	...                     ihctqvsa
    ...                     ihctqvsa
    ...                     SiZX-h61TMimwHmfvzzfNkqGwumLwtqE
    ...                     babar.db.elephantsql.com
    ...                     5432

Select Student Where Email
    [Arguments]    ${email}

    ${query}        Set Variable
    ...             SELECT * FROM "public"."students" where email = '${email}';
    
    ${result}       Query    ${query}

    [Return]        ${result}[0]

Delete Enroll by email
    [Arguments]    ${email}

    ${user}     Select Student Where Email    ${email}
    
    ${query}    Set Variable
    ...         DELETE FROM "public"."enrollments" WHERE student_id = ${user}[0];

    Execute Sql String    ${query}

Delete Student By Email
    [Arguments]            ${email}

    ${query}       Set Variable
    ...            DELETE FROM public.students WHERE email = '${email}';

    Execute SQL String     ${query}
#Helpers
Reset Student Enroll
    [Arguments]                 ${email}
    Connect To Postgres
    Delete Enroll by email      ${email}
    Disconnect From Database
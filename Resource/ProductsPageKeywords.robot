*** Settings ***
Variables  ../Locators/ProductsPage.py

*** Keywords ***
Quando Joao informa que é menor de idade
    Get Text  ${txt_msg_idade}  ==  Você tem 18 anos ou mais?
    Click  ${bt_age_gate_button_no}

Então é retornado a informação que o usuario precisa ter 18 anos ou mais para consumir bebidas alcoólicas
    Wait For Elements State  ${txt_msg_under_age}
    Get Text  ${txt_msg_under_age}  ==  Você precisa ter 18 anos ou mais para consumir bebidas alcoólicas.
#language: pt

Funcionalidade: Cadastrar equipamento
    Como aplicação
    Quero cadastrar um equipamento
    Para ter um equipamento cadastrado para a realizacao de exames

@equipamento
    Esquema do Cenario: Equipamento cadastrado com sucesso
        Dado que acessei API de Hospital Contingencia para o cadastro de equipamento
        Quando faço uma chamada do tipo POST para o endpoint /equipamentos
        Então devo receber o codigo 200 para equipamento cadastrado com sucesso
        E devo visualizar a mensagem  com o "<Nome>" do equipamento inserido com sucesso

        Exemplos:
        |Nome    |
        |SIEMENS |





    
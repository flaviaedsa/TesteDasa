#language: pt
@equipamento
Funcionalidade: Cadastrar equipamento
    Como aplicação
    Quero cadastrar um equipamento
    Para ter um equipamento cadastrado para a realizacao de exames


    Esquema do Cenario: Equipamento cadastrado com sucesso
        Dado que acessei API de Hospital Contingencia para o cadastro de equipamento
        Quando faço uma chamada do tipo POST para o endpoint /equipamentos
        Então devo receber o codigo 200 para equipamento cadastrado com sucesso
        E devo visualizar a mensagem  com o "<Nome>" do equipamento inserido com sucesso

        Exemplos:
        |Nome    |
        |SIEMENS |


    Esquema do Cenario: Equipamento já está cadastrado
        Dado que acessei API de Hospital Contingencia para o cadastro de equipamento
        Quando faço uma chamada do tipo POST para o endpoint /equipamentos
        E em seguida faço uma nova chamada para o mesmo endpoint
        Então devo receber o codigo 409 para equipamento já cadastrado
        E devo visualizar a mensagem com o "<Nome>" do equipamento informando que o mesmo já existe

        Exemplos:
        |Nome    |
        |SIEMENS |








    
#language: pt

@equipamento
Funcionalidade: Cadastrar equipamento
    Como aplicação
    Quero cadastrar um equipamento
    Para ter um equipamento cadastrado para a realizacao de exames


    Esquema do Cenario: Equipamento cadastrado com sucesso
        Dado que eu tenha os seguintes equipamentos:
               | nome | <nome> |
        Quando faço uma chamada do tipo POST para o endpoint de cadastro de equipamentos
        Então devo receber o codigo "200" para equipamento cadastrado com sucesso
        E devo visualizar a mensagem  com o "<nome>" do equipamento inserido com sucesso

        Exemplos:
        |nome    |
        |SIEMENSS |


    Esquema do Cenario: Validacao de equipamento ja cadastrado
        Dado que eu tenha os seguintes equipamentos cadastrados:
               | nome | <nome> |
        Quando faço uma chamada do tipo POST passando equipamentos ja cadastrados
        Então devo receber o codigo "409" para equipamento ja existente
        E devo visualizar a mensagem  com o "<nome>" do equipamento ja cadastrado

        Exemplos:
        |nome    |
        |SIEMENSS |








    
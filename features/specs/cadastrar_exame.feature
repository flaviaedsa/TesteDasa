#language: pt

Funcionalidade: Cadastrar exame
    Como aplicação
    Quero cadastrar um exame
    Para o processamento de exames dos laboratórios

@exame
    Esquema do Cenario: Exame cadastrado com sucesso
        Dado que acessei API de Hospital Contingencia para o cadastro de exames  
        Quando faço uma chamada do tipo POST para o endpoint /exames
        Então devo receber o codigo 200 para exame cadastrado com sucesso
        E devo visualizar a mensagem  com o "<Nome>" do exame inserido com sucesso

        Exemplos:
        |Nome   |
        |GLICO  |
        |TSH    |

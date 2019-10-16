#language: pt

@exame
Funcionalidade: Cadastrar exame
    Como aplicação
    Quero cadastrar um exame
    Para atender os laboratorios


    Esquema do Cenario: Equipamento cadastrado com sucesso
        Dado que eu tenha um equipamento cadastrado:
            | nome | <nome> |
        E tenha os seguintes exames:  
            | exame | <exame1> | <exame2> |
        Quando faço uma chamada do tipo POST para o endpoint de cadastro de exames
        Então devo receber o codigo "200" para exame cadastrado com sucesso
        E devo visualizar a mensagem  com o "<exame>" do exame inserido com sucesso

        Exemplos:
        |nome     |exame1 |exame2
        |SIEMENS  |GLICO  |TSH
   

#language: pt

@exame
Funcionalidade: Cadastrar exame
    Como aplicação
    Quero cadastrar um exame
    Para atender os laboratorios


    Esquema do Cenario: Exame cadastrado com sucesso
        Dado que eu tenha um equipamento cadastrado:
            | nome      | <nome>      |
            | protocolo | <protocolo> |
        E tenha os seguintes exames para cadastrar:  
            | exame    | <exame>    |
            | material | <material> |
        Quando faço uma chamada do tipo POST para o endpoint de cadastro de exames
        Então devo receber o codigo 200 para exame cadastrado com sucesso
        E devo visualizar a mensagem  com o "<exame>" do exame inserido com sucesso

        Exemplos:
            | nome     | protocolo | exame     | material |
            | SIEMENSS | ASTM      | Urina     | Soro     |
            | SIEMENSS | ASTM      | Ferritina | Soro     |


    Esquema do Cenario: Exame não cadastrado por falta de equipamento
        Dado que eu tenha um equipamento cadastrado:
            | nome      | <nome>      |
            | protocolo | <protocolo> |
        E tenha os seguintes exames para cadastrar:  
            | exame    | <exame>    |
            | material | <material> |
        Quando faço uma chamada do tipo POST para o endpoint de cadastro de exames com equipamento inexistente
        Então devo receber o codigo 412 para exame não cadastrado
        E devo visualizar a mensagem de que é necessario cadastrar um equipamento
        Exemplos: 
            | nome     | protocolo | exame  | material | 
            | SIEMENSS | ASTM      | Ferro  | Soro     |      
              
#language: pt

@exame
Funcionalidade: Cadastrar exame
    Como aplicação
    Quero cadastrar um exame
    Para o processamento de exames dos laboratórios

    Esquema do Cenario: Exame cadastrado com sucesso
        Dado que acessei API de Hospital Contingencia para o cadastro de exames
        E tenho um equipamente cadastrado  
        Quando faço uma chamada do tipo POST para o endpoint /exames
        Então devo receber o codigo 200 para exame cadastrado com sucesso
        E devo visualizar a mensagem  com o "<Nome>" do exame inserido com sucesso

        Exemplos:
        |Nome   |
        |GLICO  |
        # |TSH    |

    # Esquema do Cenario: Exame não cadastrado
    #     Dado que acessei API de Hospital Contingencia para o cadastro de exames  
    #     E não tenho um "<Equipamento>" cadastrado
    #     Quando faço uma chamada do tipo POST para o endpoint /exames
    #     Então devo receber o codigo 412 para exame não cadastrado
    #     E devo visualizar a mensagem  com o "<Nome>" do exame que precisa ser cadastrado

    #     Exemplos:
    #     |Nome   |Equipamento|
    #     |GLICO  |SIEMENS    |
    #     # |TSH    |



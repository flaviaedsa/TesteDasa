#language: pt

@ordem
Funcionalidade: Cadastrar ordem
    Como aplicação
    Quero cadastrar uma ordem
    Para processar os exames 

    Esquema do Cenario: Ordem cadastrada com sucesso
        Dado que eu tenha um equipamento cadastrado:
            | nome      | <nome>      |
            | protocolo | <protocolo> |
        E tenha os seguintes exames cadastrados:  
            | exame1    | <exame1>    |
            | exame2    | <exame2>    |
            | exame3    | <exame3>    |
            | exame4    | <exame4>    |
            | material1 | <material1> |
            | material2 | <material2> |
            | material3 | <material3> |
        Quando faço uma chamada do tipo POST para o endpoint de cadastro de ordens
        Então devo receber o codigo 200 visualizar as ordens
        E devo visualizar uma ordem com 3 amostras
        E devo visualizar uma amostra com 2 exames que possuem o mesmo material
        E devo visualizar uma amostra para cada exame de material distinto

        Exemplos:
            | nome     | protocolo | exame1    | exame2    | exame3 | exame4 | material1 | material2 | material3 |
            | SIEMENSS | ASTM      | Hemograma | VitaminaD | B12    | Urina  | Soro      | Sangue    | Urina     |    


    Esquema do Cenario: Ordem não cadastrada por falta de exame
        Dado que eu tenha um equipamento cadastrado:
            | nome      | <nome>      |
            | protocolo | <protocolo> |
        E tenha os seguintes exames cadastrados:  
            | exame1    | <exame1>    |
            | exame2    | <exame2>    |
            | exame3    | <exame3>    |
            | exame4    | <exame4>    |
            | material1 | <material1> |
            | material2 | <material2> |
            | material3 | <material3> |
        Quando faço uma chamada do tipo POST para o endpoint de cadastro de ordens com exame inexistente
        Então devo receber o codigo 412 para ordem não cadastrada
        E devo visualizar a mensagem de que é necessario cadastrar um exame

        Exemplos:
            | nome      | protocolo | exame1    | exame2    | exame3 | exame4 | material1 | material2 | material3 |
            | SIEMENSS  | ASTM      | Hemograma | VitaminaD | B12    | Urina  | Soro      | Sangue    | Urina     |          
#language: pt

Funcionalidade: Realizar o cadastro de um equipamento
    Como teste automatizado
    Quero chamar os servicos
    Para cadastrar um equipamento

    Como um usuario do sistema
    Eu quero realizar as requisicoes na API
    Para manipular as informacoes do cadastro de startup
  
  Cenario: Realizar o cadastro de um equipamento preenchendo todos os campos

        Dado que o servico <Endpoint> esteja disponivel
        Quando fizer o login no <Endpoint>
        E realizar a chamada do servico <Endpoint>
        Então devo receber o codigo 200 
        E a resposta deve ser valida <Endpoint>

        Dado o endereco da API para manter o cadastro de startup
        Quando realozar uma requisicao para cadastrar uma startup
        Entao a API ira retornar os dados do cadastro da startip respondendo o codigo 200


Funcionalidade: Listar Personagens Marvel

    Sendo uma aplicação
    Posso solicitar o endpoint que lista os personagens da Marvel
    Para obter informações sobre os personagens

@listarPersonagens
Esquema do Cenário: Listar quantidade limitada de personagens
    
    Dado que eu informe os seguintes dados de autenticação da API:
        | ts     | <ts>     |
        | apikey | <apikey> |
        | hash   | <hash>   |
    Quando que eu faço uma solicitação do tipo GET para o endpoint que lista "<quantidade>" limitada de personagens da Marvel
    Então o código de resposta HTTP deve ser igual a "<status_code>"
    E devo receber a "<quantidade>" limitada de personagens


    
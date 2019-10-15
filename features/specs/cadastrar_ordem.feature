#language: pt

@ordem
Funcionalidade: Cadastrar ordem
    Como aplicação
    Quero cadastrar uma ordem
    Para ter acesso aos dados do paciente que realizou o exame


   Cenario: Ordem cadastrada com sucesso
        Dado que acessei API de Hospital Contingencia para o cadastro de ordens 
        Quando faço uma chamada do tipo POST para o endpoint /ordens
        Então devo receber o codigo 200 para ordem cadastrada com sucesso
       
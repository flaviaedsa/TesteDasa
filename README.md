### TesteDasa ###

Este teste tem o objetivo de:

1. Realizar cadastro de EQUIPAMENTO.
2. Realizar cadastro de EXAME.
3. Realizar cadastro de ORDEM.
4. Fazer um cadastro de um dado já existente
5. Validar que o equipamento só aceita um protocolo.
6. Um exame só pode ser executado em um equipamento existente.
7. Uma Ordem só aceita exames existentes. 
8. Ao cadastrar uma ordem onde os exames possuem o mesmo material (campo aberto no cadastro de exame) esses exames devem estar contidos na mesma amostra gerada no retorno do POST /ordens. Exames de material distintos devem ser alocados em amostras diferentes.

## Tecnologias

- Cucumber
- Capybara 
- Linguagem Ruby
- Cenários em BDD
- Gem HTTParty


## Configurando o ambiente:

Antes de rodar os testes, por favor instale:

[Ruby/ rbenv/ bundler] - Instalando rbenv, ruby e bundler

- Guia Instalando Ruby no Windows: 
https://medium.com/qaninja/instalando-ruby-cucumber-e-capybara-no-windows-10-acb1fe833a95

- Guia Instalando Ruby no Ubuntu: 
https://medium.com/qaninja/como-instalar-ruby-com-rbenv-no-ubuntu-a75d1999362b

## Instalação & Execução
    $ git clone <repositório>
    $ cd repositorio/
    $ gem install bundler
    $ bundler install
    $ cucumber


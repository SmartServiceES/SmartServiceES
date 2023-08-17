Feature: Busca de cliente
  As a Usuario do sistema
  I want to buscar os clientes por seu nome ou CPF
  So that eu atribua o cliente correto ao servico prestado

  Scenario: Busca de cliente por nome Pedro Antonio
    Given Eu estou na pagina de listagem de clientes
    And O cliente com nome completo "Pedro Antonio" data de nascimento "2000-09-14" cpf "97516259047" email "pedroAntonio@outlook.com" senha "ZECzAKy" telefone "81998432108" rua "Rua Santos Dumount" numero "245" CEP "55715000" Bairro "Jardim santa rosa" cidade "Feira Nova" complemento "Casa" existe
    When Eu preencho no campo de busca por nome o nome "Pedro Antonio"
    And eu clico em Pesquisar por nome
    Then eu visualizo o cliente de nome "Pedro Antonio"

  Scenario: Busca de cliente por nome Lucas Mateus
    Given Eu estou na pagina de listagem de clientes
    And O cliente com nome completo "Lucas Mateus" data de nascimento "2000-09-14" cpf "69248043062" email "lucasmateus@outlook.com" senha "t4tBMMetah" telefone "79986157505" rua "Rua Santos Dumount" numero "245" CEP "55715000" Bairro "Jardim santa rosa" cidade "Feira Nova" complemento "Casa" existe
    When Eu preencho no campo de busca por nome o nome "Lucas Mateus"
    And eu clico em Pesquisar por nome
    Then eu visualizo o cliente de nome "Lucas Mateus"

  Scenario: Buscar cliente que não existe
    Given Eu estou na pagina de listagem de clientes
    And Eu preencho no campo de busca por nome o nome "Carlos Andrade"
    And eu clico em Pesquisar por nome
    Then eu visualizo a pagina em branco sem nenhum cliente "Carlos Andrade"

  Scenario: Busca de cliente por CPF
    Given Eu estou na pagina de listagem de clientes
    And O cliente com nome completo "Pedro Alvaro" data de nascimento "2000-09-14" cpf "06006615045" email "pedroalvaro@outlook.com" senha "ZECpmdzAK" telefone "89980574385" rua "Rua Santos Dumount" numero "245" CEP "55715000" Bairro "Jardim santa rosa" cidade "Feira Nova" complemento "Casa" existe
    When Eu preencho no campo de busca por CPF o CPF "06006615045"
    And eu clico em Pesquisar
    Then eu visualizo o cliente de CPF "06006615045"

  Scenario: Buscar cliente que o cpf não existe
    Given Eu estou na pagina de listagem de clientes
    And Eu preencho no campo de busca por CPF o CPF "24289604072"
    And eu clico em Pesquisar
    Then eu visualizo a pagina em branco sem nenhum cliente de CPF "24289604072"
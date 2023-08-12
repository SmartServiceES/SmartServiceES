Feature: Busca de prestador de servico
  As a Usuario do sistema
  I want to buscar os prestadores de servico por categoria: encanador, eletricista ou pedreiro
  So that eu visualize os prestadores de servico disponiveis

  Scenario: Buscar prestador de servico com categoria encanador
    Given eu estou na pagina de listagem de todos os prestadores de servicos
    And O prestador de servico com nome "Robert Freire", telefone "12365698798", data de nascimento "2003-01-01", email "robert2312@example.com", senha "orobert" e profissao "Encanador" existe
    When eu preencho no campo de busca a profissao "Encanador"
    And eu clico em Pesquisar
    Then eu visualizo uma lista de prestadores de servico com a categoria "Encanador"

  Scenario: Buscar prestador de servico com categoria eletricista
    Given eu estou na pagina de listagem de todos os prestadores de servicos
    And O prestador de servico com nome "Robert Cavalcanti", telefone "23165698798", data de nascimento "2003-10-01", email "cavalcanti2312@example.com", senha "ocavalcanti" e profissao "Eletricista" existe
    When eu preencho no campo de busca a profissao "Eletricista"
    And eu clico em Pesquisar
    Then eu visualizo uma lista de prestadores de servico com a categoria "Eletricista"

  Scenario: Buscar prestador de servico pedreiro
    Given eu estou na pagina de listagem de todos os prestadores de servicos
    And O prestador de servico com nome "Robert Melo", telefone "23169854798", data de nascimento "2003-10-06", email "melo2312@example.com", senha "omelo12442" e profissao "Pedreiro" existe
    When eu preencho no campo de busca a profissao "Pedreiro"
    And eu clico em Pesquisar
    Then eu visualizo uma lista de prestadores de servico com a categoria "Pedreiro"

  Scenario: Buscar prestador de servico com categoria invalida
    Given eu estou na pagina de listagem de todos os servicos
    And eu preencho no campo de busca a profissao "Marceneiro"
    And eu clico em Pesquisar
    Then eu visualizo a pagina em branco sem nenhuma categoria "Marceneiro"

  Scenario: Buscar prestadores de servico de varias categorias
    Given eu estou na pagina de listagem de todos os servicos
    And O prestador de servico com nome "Robert Andrade", telefone "23169654798", data de nascimento "2003-10-07", email "andrade2312@example.com", senha "oandrade12442" e profissao "Pedreiro" existe
    And O prestador de servico com nome "Robert Freitas", telefone "25465698798", data de nascimento "2003-10-08", email "freitas22312@example.com", senha "ofreitas1522" e profissao "Eletricista" existe
    When eu preencho no campo de busca a profissao "Pedreiro"
    And eu clico em Pesquisar
    Then eu visualizo uma lista de prestadores de servico com a categoria "Pedreiro"
    When eu preencho no campo de busca a profissao "Eletricista"
    And eu clico em Pesquisar
    Then eu visualizo uma lista de prestadores de servico com a categoria "Eletricista"
Feature: Busca de serviço
  As a Usuario do sistema
  I want to buscar os servicos disponiveis por categoria, encanador, eletricista ou pedreiro
  So that eu visualize os servicos disponiveis

  Scenario: Buscar serviços de pedreiro
    Given que existem serviços cadastrados na categoria "pedreiro"
    When eu procuro pelos serviços da categoria "pedreiro"
    Then eu visualizo uma lista de serviços disponíveis de pedreiro

  Scenario: Buscar serviços de eletricista
    Given que contem serviços cadastrados na categoria "eletricista"
    When procuro serviços nesta categoria "eletricista"
    Then eu visualizo uma lista de serviços disponíveis de eletricista

  Scenario: Buscar serviços de encanador
    Given que tem serviços cadastrados na categoria "encanador"
    When eu busco por um tipo de serviço da categoria "encanador"
    Then eu visualizo uma lista de serviços disponíveis de encanador

  Scenario: Buscar serviços em uma categoria inexistente
    Given que não existem serviços cadastrados na categoria "marceneiro"
    When eu varro pelos serviços da categoria "marceneiro"
    Then eu visualizo uma mensagem informando que não há serviços disponíveis nesta categoria

  Scenario: Buscar serviços em várias categorias
    Given que existem serviços cadastrados nas categorias "encanador,eletricista,pedreiro"
    When eu vasculo pelos serviços das categorias "encanador,eletricista,pedreiro"
    Then eu visualizo uma lista de serviços disponíveis para cada categoria
Feature: Gerenciamento de servico

  As a Usuario do sistema
  I want to registrar, editar e remover um servico
  So that eu mantenha o portfolio de servicos atualizado

  Scenario: cadastrar servico valido
    Given Eu estou na pagina de registrar servicos
    And O trabalhador com nome_completo "Joao Carlos", telefone "87090900000", data_de_nascimento "07/05/1994", email "joaocarlos@gmail.com", senha "12345", profissao "Mestre de obras" existe
    When Eu preencho os campos de Nome "Trabalho" Descricao "Trabalho da faculdade" Valor "200" Categoria "Faculdade" Horario inicio "2023-08-10 20:20" Horario termino "2023-08-10 21:30"
    And Eu clico em Create Servico
    Then Eu vejo a mensagem "Servico was successfully created."

  Scenario: cadastrar servico com nome vazio
    Given Eu estou na pagina de registrar servicos
    And O trabalhador com nome_completo "Wiezir Carlos", telefone "87090900010", data_de_nascimento "07/05/1995", email "Wiezircarlos@gmail.com", senha "95001", profissao "Mestre de obras" existe
    When Eu preencho os campos de Nome "" Descricao "Trabalho da faculdade" Valor "200" Categoria "Faculdade" Horario inicio "2023-08-11 20:20" Horario termino "2023-08-11 21:30"
    And Eu clico em Create Servico
    Then Eu vejo a mensagem de erro "3 errors prohibited this servico from being saved"

  Scenario: cadastrar servico com valor vazio
    Given Eu estou na pagina de registrar servicos
    And O trabalhador com nome_completo "Tier Carlos", telefone "87090900011", data_de_nascimento "07/05/1996", email "Kauoscarlos@gmail.com", senha "84444", profissao "Mestre de obras" existe
    When Eu preencho os campos de Nome "Trabalho" Descricao "Trabalho da faculdade" Valor "" Categoria "Faculdade" Horario inicio "2023-08-12 20:20" Horario termino "2023-08-12 21:30"
    And Eu clico em Create Servico
    Then Eu vejo a mensagem de erro "1 error prohibited this servico from being saved"

  Scenario: remover servico valido
    Given Eu estou na pagina de servicos
    And O trabalhador com nome_completo "Ribearun Carlos", telefone "87090900001", data_de_nascimento "07/05/1997", email "Ribearuncarlos@gmail.com", senha "34211", profissao "Mestre de obras" existe
    And O servico de Nome "Trabalho" Descricao "Trabalho da faculdade" Valor "200" Categoria "Faculdade" Horario inicio "2023-08-13 20:20" Horario termino "2023-08-13 21:30" existe
    When Eu estou na pagindo do servico de nome "Trabalho"
    And Eu clico em Destroy this servico
    Then Eu vejo a mensagem "Servico was successfully destroyed."

  Scenario: remover servico inexistente
    Given Eu estou na pagina de servicos
    When Eu vejo que o servico com nome "ConstruLar" nao esta listado
    Then Continuo na pagina de servico
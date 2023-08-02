Feature: Gerenciamento de servico

  As a Usuario do sistema
  I want to registrar, editar e remover um servico
  So that eu mantenha o portfolio de servicos atualizado

  Scenario: cadastrar servico valido
    Given Eu estou na pagina de registrar servicos
    And O trabalhador com nome_completo "Joao Carlos", telefone "87090900000", data_de_nascimento "07/05/1994", email "joaocarlos@gmail.com", senha "12345", profissao "Mestre de obras" existe
    When Agora preencho os campos de Nome "Trabalho" Descricao "Trabalho da faculdade" Valor "200" Categoria "Faculdade" Horario inicio "20:20" Horario termino "21:30"
    And Eu clico em Create Servico
    Then Vejo "Servico was successfully created."

  Scenario: cadastrar servico com nome vazio
    Given Eu estou na pagina de registrar servicos
    And O trabalhador com nome_completo "Joao Carlos", telefone "87090900000", data_de_nascimento "07/05/1994", email "joaocarlos@gmail.com", senha "12345", profissao "Mestre de obras" existe
    When Agora preencho os campos de Nome "" Descricao "Trabalho da faculdade" Valor "200" Categoria "Faculdade" Horario inicio "20:20" Horario termino "21:30"
    And Eu clico em Create Servico
    Then Vejo a mensagem "3 errors prohibited this servico from being saved" que o servico não foi criado

  Scenario: cadastrar servico com valor vazio
    Given Eu estou na pagina de registrar servicos
    And O trabalhador com nome_completo "Joao Carlos", telefone "87090900000", data_de_nascimento "07/05/1994", email "joaocarlos@gmail.com", senha "12345", profissao "Mestre de obras" existe
    When Agora preencho os campos de Nome "Trabalho" Descricao "Trabalho da faculdade" Valor "" Categoria "Faculdade" Horario inicio "20:20" Horario termino "21:30"
    And Eu clico em Create Servico
    Then Vejo a mensagem "1 error prohibited this servico from being saved" que o servico não foi criado

  Scenario: remover servico valido
    Given Eu estou na pagina de servicos
    And O trabalhador com nome_completo "Joao Carlos", telefone "87090900000", data_de_nascimento "07/05/1994", email "joaocarlos@gmail.com", senha "12345", profissao "Mestre de obras" existe
    And O servico de Nome "Trabalho" Descricao "Trabalho da faculdade" Valor "200" Categoria "Faculdade" Horario inicio "20:20" Horario termino "21:30" existe
    When Eu clico em servico de nome "Trabalho"
    And Eu clico em Destroy this servico
    Then Vejo "Servico was successfully destroyed."

  Scenario: remover servico inexistente
    Given Eu estou na pagina de servicos
    When Agora na pagina de servico não encontrou servico de Nome "Trabalho"
    Then Continuo na pagina de servico
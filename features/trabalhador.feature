Feature: Gerenciamento de prestador de servico
    As a Usuario do sistema
    I want to registrar, editar e remover um prestador de servico
    So that eu mantenha os prestadores de servico atualizados

Scenario: Registrar prestador de servico   
    Given Eu estou na pagina de registrar trabalhadores
    When Eu preencho nome "Joao Henrique", o telefone "87123456789", a data de nascimento "1990-01-01", o email "joao@example.com", a senha "123456" e a profissao "Engenheiro"
    And Eu clico em Create trabalhador
  Then Eu vejo a mensagem de criado com sucesso 'Trabalhador was successfully created.'

Scenario: Editar prestador de servico
  Given O trabalhador com o nome "Joao Henrique", telefone "12345678998", data de nascimento "1990-01-01", email "joao@example.com", senha "123456" e profissao "Engenheiro" existe
  And Eu estou na pagina de edicao do trabalhador com o nome "Joao Henrique"
  When Eu atualizo o telefone para "98765432132" e a profissao para "Arquiteto"
  And Eu clico em Update trabalhador
  Then Eu vejo a mensagem de editado com sucesso 'Trabalhador was successfully updated.'

Scenario: Excluir prestador de servico
  Given O trabalhador com nome "Joao Henrique", telefone "87123456789", data de nascimento "1990-01-01", email "joao@example.com", senha "123456" e profissao "Engenheiro" existe
  And Eu estou na pagina de detalhes do trabalhador com o nome "Joao Henrique"
  When Eu clico em Destroy this trabalhador
  Then Eu vejo a mensagem de sucesso 'Trabalhador was successfully destroyed.'

Scenario: Tentativa de cadastro com número de telefone muito curto
  Given Eu estou em registrar trabalhadores
  When Eu preencho o nome "Joao Henrique", o telefone "123", a data de nascimento "1990-01-01", o email "joao@example.com", a senha "123456" e a profissao "Engenheiro"
  And Eu clico em Create Trabalhador
  Then Eu vejo a mensagem de erro "Telefone precisa ter 11 dígitos"

Scenario: Tentativa de edição com e-mail inválido
  Given Eu tenho no sistema um trabalhador com o nome "Joao Henrique", telefone "98765432132", data de nascimento "1990-01-01", email "joao@example.com", senha "123456" e profissao "Engenheiro"
  And Eu estou na pagina de edicao desse trabalhador com o nome "Joao Henrique"
  When Eu atualizo o e-mail para "emailinvalido"
  And Eu clico em Update Trabalhador
  Then Eu vejo uma mensagem de erro "Email is invalid"

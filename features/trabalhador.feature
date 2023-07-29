Feature: Gerenciamento de prestador de servico
    As a Usuario do sistema
    I want to registrar, editar e remover um prestador de servico
    So that eu mantenha os prestadores de servico atualizados

Scenario: Registrar prestador de servico   
    Given Eu estou na pagina de registrar trabalhadores
    When Eu preencho o nome "Joao Henrique", o telefone "87123456789", a data de nascimento "1990-01-01", o endereco "Rua X", o email "joao@example.com", a senha "123456" e a profissao "Engenheiro"
    And Eu clico em 'Create trabalhador'
    Then Eu vejo a mensagem de sucesso 'Trabalhador was successfully created.'

Feature: Gerenciamento de cliente
  As a Usuario do sistema
  I want to registrar, editar, exibir e remover um cliente
  So that eu mantenha a lista de clientes atualizada

  Scenario: Cadastrar um cliente valido
    Given Eu estou na pagina de registrar clientes
    When Eu preencho nome completo "Pedro Caitano" data de nascimento "2000-09-14" cpf "05621812450" email "pedroshouldz@outlook.com" senha "senha123" telefone "81998436108" rua "Rua Santos Dumount" numero "245" CEP "55715000" Bairro "Jardim santa rosa" cidade "Feira Nova" complemento "Casa"
    And Eu clico em Create Cliente
    Then Eu vejo a mensagem de criado com sucesso "Cliente was successfully created."
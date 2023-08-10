Feature: Gerenciamento de cliente
  As a Usuario do sistema
  I want to registrar, editar, exibir e remover um cliente
  So that eu mantenha a lista de clientes atualizada

  Scenario: Cadastrar um cliente valido
    Given Eu estou na pagina de registrar clientes
    When Eu preencho nome completo "Pedro Caitano" data de nascimento "2000-09-14" cpf "05621812450" email "pedroshouldz@outlook.com" senha "senha123" telefone "81998436108" rua "Rua Santos Dumount" numero "245" CEP "55715000" Bairro "Jardim santa rosa" cidade "Feira Nova" complemento "Casa"
    And Eu clico em Create Cliente
    Then Eu vejo a mensagem de criado com sucesso "Cliente was successfully created."

  Scenario: Editar um cliente valido
    Given Eu estou na pagina de listagem de clientes
    And O cliente com nome completo "Pedro Caitano" data de nascimento "2000-09-14" cpf "05621812450" email "pedroshouldz@outlook.com" senha "senha123" telefone "81998436108" rua "Rua Santos Dumount" numero "245" CEP "55715000" Bairro "Jardim santa rosa" cidade "Feira Nova" complemento "Casa" existe
    When Eu clico em Edit this cliente
    And Eu edito o nome do cliente para "Barba Branca"
    Then Eu vejo a mensagem que o cliente foi editado com sucesso 'Cliente was successfully updated.'

  Scenario: Deletar um cliente valido
    Given Eu estou na pagina de listagem de clientes
    And O cliente com nome completo "Pedro Caitano" data de nascimento "2000-09-14" cpf "05621812450" email "pedroshouldz@outlook.com" senha "senha123" telefone "81998436108" rua "Rua Santos Dumount" numero "245" CEP "55715000" Bairro "Jardim santa rosa" cidade "Feira Nova" complemento "Casa" existe
    When Eu clico em Destroy this cliente
    Then Eu vejo a mensagem que o cliente foi deletado com sucesso 'Cliente was successfully destroyed.'

  Scenario: Cadastrar um cliente invalido
    Given Eu estou na pagina de registrar clientes
    When Eu preencho nome completo "P" data de nascimento "2000-09-14" cpf "05621812450" email "pedroshouldz@outlook.com" senha "senha123" telefone "81998436108" rua "Rua Santos Dumount" numero "245" CEP "55715000" Bairro "Jardim santa rosa" cidade "Feira Nova" complemento "Casa"
    And Eu clico em Create Cliente
    Then Eu vejo uma mensagem de erro "1 error prohibited this cliente from being saved:"

  Scenario: Editar com dados invalidos
    Given Eu estou na pagina de listagem de clientes
    And O cliente com nome completo "Pedro Caitano" data de nascimento "2000-09-14" cpf "05621812450" email "pedroshouldz@outlook.com" senha "senha123" telefone "81998436108" rua "Rua Santos Dumount" numero "245" CEP "55715000" Bairro "Jardim santa rosa" cidade "Feira Nova" complemento "Casa" existe
    When Eu clico em Edit this cliente
    And Eu edito o nome do cliente para "B"
    Then Eu vejo uma mensagem de erro "1 error prohibited this cliente from being saved:"
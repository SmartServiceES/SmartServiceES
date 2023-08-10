#Criar cliente valido
Given('Eu estou na pagina de registrar clientes' )do
  visit '/clientes/new'
  expect(page).to have_current_path('/clientes/new')
end

  When('Eu preencho nome completo {string} data de nascimento {string} cpf {string} email {string} senha {string} telefone {string} rua {string} numero {string} CEP {string} Bairro {string} cidade {string} complemento {string}') do |nome, data_nascimento, cpf, email, senha, telefone, rua, numero, cep, bairro, cidade, complemento|
    fill_in "cliente[nome_completo]",	with: nome
    fill_in "cliente[data_nascimento]",	with: data_nascimento
    fill_in "cliente[cpf]",	with: cpf
    fill_in "cliente[email]",	with: email
    fill_in "cliente[senha]",	with: senha
    fill_in "cliente[telefone]",	with: telefone
    fill_in "cliente[endereco_attributes][nome_da_rua]",	with: rua
    fill_in "cliente[endereco_attributes][numero_da_casa]",	with: numero
    fill_in "cliente[endereco_attributes][cep]",	with: cep
    fill_in "cliente[endereco_attributes][bairro]",	with: bairro
    fill_in "cliente[endereco_attributes][cidade]",	with: cidade
    fill_in "cliente[endereco_attributes][complemento]",	with: complemento

  end

  When('Eu clico em Create Cliente') do
    click_button "Create Cliente"
  end

  Then('Eu vejo a mensagem de criado com sucesso {string}.') do |mensagem|
    expect(page).to have_content(mensagem)
  end

# Editar valido

Given('Eu estou na pagina de listagem de clientes') do
  visit '/clientes/'
  expect(page).to have_current_path('/clientes/')
end

Given('O cliente com nome completo {string} data de nascimento {string} cpf {string} email {string} senha {string} telefone {string} rua {string} numero {string} CEP {string} Bairro {string} cidade {string} complemento {string} existe') do |nome, data_nascimento, cpf, email, senha, telefone, rua, numero, cep, bairro, cidade, complemento|
  visit '/clientes/new'
  expect(page).to have_current_path('/clientes/new')
  fill_in "cliente[nome_completo]",	with: nome
  fill_in "cliente[data_nascimento]",	with: data_nascimento
  fill_in "cliente[cpf]",	with: cpf
  fill_in "cliente[email]",	with: email
  fill_in "cliente[senha]",	with: senha
  fill_in "cliente[telefone]",	with: telefone
  fill_in "cliente[endereco_attributes][nome_da_rua]",	with: rua
  fill_in "cliente[endereco_attributes][numero_da_casa]",	with: numero
  fill_in "cliente[endereco_attributes][cep]",	with: cep
  fill_in "cliente[endereco_attributes][bairro]",	with: bairro
  fill_in "cliente[endereco_attributes][cidade]",	with: cidade
  fill_in "cliente[endereco_attributes][complemento]",	with: complemento
  click_button "Create Cliente"
end
When('Eu clico em Edit this cliente') do
  click_link "Edit this cliente"
end

When('Eu edito o nome do cliente para {string}') do |nome_novo|
  fill_in "cliente[nome_completo]",	with: nome_novo
  click_button "Update Cliente"
end

Then('Eu vejo a mensagem que o cliente foi editado com sucesso {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

#Deletar cliente valido

When('Eu clico em Destroy this cliente') do
  click_button "Destroy this cliente"
end

Then('Eu vejo a mensagem que o cliente foi deletado com sucesso {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

#Cadastrar invalido
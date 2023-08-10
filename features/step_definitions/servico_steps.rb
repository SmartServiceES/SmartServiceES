#Criar Servico

Given('Eu estou na pagina de registrar servicos') do
  visit '/servicos/new'
  expect(page).to have_current_path('/servicos/new')
end

Given('O trabalhador com nome_completo {string}, telefone {string}, data_de_nascimento {string}, email {string}, senha {string}, profissao {string} existe') do |nome, telefone, data_nascimento_str, email, senha, profissao|
  visit '/trabalhadors/new'
  data_nascimento = Date.parse(data_nascimento_str)
  fill_in "trabalhador[nome_completo]",	with: nome
  fill_in "trabalhador[telefone]",	with: telefone
  fill_in "trabalhador[data_nascimento]",	with: data_nascimento.strftime('%Y-%m-%d')
  fill_in "trabalhador[email]",	with: email
  fill_in "trabalhador[senha]",	with: senha
  fill_in "trabalhador[profissao]",	with: profissao
  click_button 'Salvar'
  expect(page).to have_content("Trabalhador was successfully created.")
end


When('Eu preencho os campos de Nome {string} Descricao {string} Valor {string} Categoria {string} Horario inicio {string} Horario termino {string}') do |nome, descricao, valor, categoria, horario_inicio, horario_termino|
  visit '/servicos/new'

  fill_in "servico[nome]",	with: nome
  fill_in "servico[descricao]",	with: descricao
  fill_in "servico[valor]", with: valor
  fill_in "servico[categoria]", with: categoria
  fill_in "servico[horario_inicio]",	with: horario_inicio
  fill_in "servico[horario_termino]",	with: horario_termino
end

When('Eu clico em Create Servico') do
  click_button "Create Servico"
end

Then('Eu vejo a mensagem {string}') do |mensagem|
  wait = Selenium::WebDriver::Wait.new(timeout: 20) # Tempo máximo de espera em segundos
  expect(page).to have_content(mensagem)


end

Then('Eu vejo a mensagem de erro {string} que o servico não foi criado') do |mensagem|
  expect(page).to have_content(mensagem)
  expect(page).to have_current_path('/servicos/new')
end

# Destruir servico OK
Given('O servico de Nome {string} Descricao {string} Valor {string} Categoria {string} Horario inicio {string} Horario termino {string} existe') do |nome, descricao, valor, categoria, horario_inicio, horario_termino|
  visit '/servicos/new'

  fill_in "servico[nome]",	with: nome
  fill_in "servico[descricao]",	with: descricao
  fill_in "servico[valor]", with: valor
  fill_in "servico[categoria]", with: categoria
  fill_in "servico[horario_inicio]",	with: horario_inicio
  fill_in "servico[horario_termino]",	with: horario_termino
  click_button "Create Servico"
  expect(page).to have_content("Servico was successfully created.")
end

When('Eu estou na pagindo do servico de nome {string}') do |nome|
  expect(page).to have_content(nome)
end

When('Eu clico em Destroy this servico') do
  click_button "Destroy this servico"
  expect(page).to have_content("Servico was successfully destroyed.")
end

#Deletar servico não existente OK
Given('Eu estou na pagina de servicos') do
  visit '/servicos'
  expect(page).to have_current_path('/servicos')
end

When('Eu vejo que o servico com nome {string} nao esta listado') do |servico|
  expect(page).to have_no_content(servico)
end

Then('Continuo na pagina de servico') do
  expect(page).to have_current_path('/servicos')
end

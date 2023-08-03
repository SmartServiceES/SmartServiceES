Given('eu estou na pagina de cadastrar um novo servico') do
  visit '/servicos/new'
  expect(page).to have_current_path('/servicos/new')
end

Given('eu preencho o nome do serviço {string} Descricao {string} Valor {string} Categoria {string} Horario inicio {string} Horario termino {string}') do |nome,
  descricao, valor, categoria, horario_inicio, horario_termino|

  visit '/trabalhadors/new'
  fill_in "trabalhador[nome_completo]",	with: "Roberto Freitas"
  fill_in "trabalhador[telefone]",	with: "87991784512"
  fill_in "trabalhador[data_nascimento]",	with: "2003-06-10"
  fill_in "trabalhador[email]",	with: "roberto@gmail.com"
  fill_in "trabalhador[senha]",	with: "senha1542"
  fill_in "trabalhador[profissao]",	with: "profissional"
  click_button 'Create Trabalhador'
  expect(page).to have_content("Trabalhador was successfully created.")

  visit '/servicos/new'
  fill_in "servico[nome]",	with: nome
  fill_in "servico[descricao]",	with: descricao
  fill_in "servico[valor]", with: valor
  fill_in "servico[categoria]", with: categoria
  fill_in "servico[horario_inicio]",	with: horario_inicio
  fill_in "servico[horario_termino]",	with: horario_termino
end

Given('eu clico em Create Servico') do
  click_button "Create Servico"
end

When('eu preencho no campo de busca a categoria {string}') do |categoria|
  fill_in "q_categoria_cont",	with: categoria
end

Then('eu visualizo uma lista de serviços disponíveis de {string}') do |categoria|
  visit '/servicos'
  expect(page).to have_content(categoria)
end

Given('eu estou na pagina de listagem de todos os servicos') do
  visit '/servicos'
  expect(page).to have_current_path('/servicos')
end

Then('eu não encontro nenhum servico da categoria {string}') do |categoria|
  expect(page).to have_no_content(categoria)
end

Given('o servico {string} Descricao {string} Valor {string} Categoria {string} Horario inicio {string} Horario termino {string} está cadastrado') do |nome, descricao, valor, categoria, horario_inicio, horario_termino|
  visit '/trabalhadors/new'
  fill_in "trabalhador[nome_completo]",	with: "pedro Freitas"
  fill_in "trabalhador[telefone]",	with: "87991724512"
  fill_in "trabalhador[data_nascimento]",	with: "2003-06-11"
  fill_in "trabalhador[email]",	with: "pedro@gmail.com"
  fill_in "trabalhador[senha]",	with: "senha265"
  fill_in "trabalhador[profissao]",	with: "profissional"
  click_button 'Create Trabalhador'
  expect(page).to have_content("Trabalhador was successfully created.")

  visit '/servicos/new'
  fill_in "servico[nome]",	with: nome
  fill_in "servico[descricao]",	with: descricao
  fill_in "servico[valor]", with: valor
  fill_in "servico[categoria]", with: categoria
  fill_in "servico[horario_inicio]",	with: horario_inicio
  fill_in "servico[horario_termino]",	with: horario_termino
  click_button "Create Servico"
end

Given('e o servico {string} Descricao {string} Valor {string} Categoria {string} Horario inicio {string} Horario termino {string} está cadastrado') do |nome, descricao, valor, categoria, horario_inicio, horario_termino|
  visit '/trabalhadors/new'
  fill_in "trabalhador[nome_completo]",	with: "joao Freitas"
  fill_in "trabalhador[telefone]",	with: "87941724512"
  fill_in "trabalhador[data_nascimento]",	with: "2003-07-11"
  fill_in "trabalhador[email]",	with: "joao@gmail.com"
  fill_in "trabalhador[senha]",	with: "senha854"
  fill_in "trabalhador[profissao]",	with: "profissional"
  click_button 'Create Trabalhador'
  expect(page).to have_content("Trabalhador was successfully created.")

  visit '/servicos/new'
  fill_in "servico[nome]",	with: nome
  fill_in "servico[descricao]",	with: descricao
  fill_in "servico[valor]", with: valor
  fill_in "servico[categoria]", with: categoria
  fill_in "servico[horario_inicio]",	with: horario_inicio
  fill_in "servico[horario_termino]",	with: horario_termino
  click_button "Create Servico"
end


Given('eu visito a pagina de listagem de todos os servicos') do
  visit '/servicos'
  expect(page).to have_current_path('/servicos')
end

Given('eu clico em Search') do
  click_button "Search"
end

Then('eu visualizo uma lista de serviços disponíveis para das categorias {string}') do |categoria|
  expect(page).to have_content(categoria)
end
When('Eu preencho no campo de busca por nome o nome {string}') do |nome|
  visit '/clientes'
  fill_in "q_nome_completo_cont",	with: nome
end

When('eu clico em Pesquisar por nome') do
  click_button "Pesquisar por nome"
end

Then('eu visualizo o cliente de nome {string}') do |nome|
  expect(page).to have_content(nome)
end


Then('eu visualizo a pagina em branco sem nenhum cliente {string}') do |nome|
  expect(page).to have_no_content(nome)
end


When('Eu preencho no campo de busca por CPF o CPF {string}') do |cpf|
  visit '/clientes'
  fill_in "q_cpf_cont",	with: cpf
end

Then('eu visualizo o cliente de CPF {string}') do |cpf|
  expect(page).to have_content(cpf)
end


Then('eu visualizo a pagina em branco sem nenhum cliente de CPF {string}') do |cpf|
  expect(page).to have_no_content(cpf)
end
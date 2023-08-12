Given('eu estou na pagina de listagem de todos os prestadores de servicos') do
  visit '/trabalhadors'
  expect(page).to have_current_path('/trabalhadors')
end

Given('O prestador de servico com nome {string}, telefone {string}, data de nascimento {string}, email {string}, senha {string} e profissao {string} existe') do |
nome, telefone, data_nascimento, email, senha, profissao|

  visit '/trabalhadors/new'
  fill_in "trabalhador[nome_completo]",	with: nome
  fill_in "trabalhador[telefone]",	with: telefone
  fill_in "trabalhador[data_nascimento]",	with: data_nascimento
  fill_in "trabalhador[email]",	with: email
  fill_in "trabalhador[senha]",	with: senha
  fill_in "trabalhador[profissao]",	with: profissao
  click_button 'Salvar'
  expect(page).to have_content("Trabalhador was successfully created.")


end

When('eu preencho no campo de busca a profissao {string}') do |categoria|
  visit '/trabalhadors'
  expect(page).to have_current_path('/trabalhadors')
  fill_in "q_profissao_cont",	with: categoria
end

When('eu clico em Pesquisar') do
  click_button "Pesquisar"
end

Then('eu visualizo uma lista de prestadores de servico com a categoria {string}') do |categoria|
  expect(page).to have_content(categoria)
end

Then('eu visualizo a pagina em branco sem nenhuma categoria {string}') do |categoria|
  expect(page).to have_no_content(categoria)
end





 #CRIAR

Given('Eu estou na pagina de registrar trabalhadores') do
    visit '/trabalhadors/new'
    expect(page).to have_current_path('/trabalhadors/new')
end
  
  When('Eu preencho nome {string}, o telefone {string}, a data de nascimento {string}, o email {string}, a senha {string} e a profissao {string}') do |nome, telefone, data_nascimento_str, email, senha, profissao|
    data_nascimento = Date.parse(data_nascimento_str)
    fill_in "trabalhador[nome_completo]",	with: nome
    fill_in "trabalhador[telefone]",	with: telefone
    fill_in "trabalhador[data_nascimento]",	with: data_nascimento.strftime('%Y-%m-%d')
    fill_in "trabalhador[email]",	with: email
    fill_in "trabalhador[senha]",	with: senha
    fill_in "trabalhador[profissao]",	with: profissao
  end
  
  When('Eu clico em Create trabalhador') do
    click_button "Create Trabalhador"
  end

  Then('Eu vejo a mensagem de criado com sucesso {string}') do |mensagem|
    expect(page).to have_content(mensagem)
  end

  #EDITAR

Given('O trabalhador com o nome {string}, telefone {string}, data de nascimento {string}, email {string}, senha {string} e profissao {string} existe') do |nome, telefone, data_nascimento_str, email, senha, profissao|
    visit '/trabalhadors/new'
    expect(page).to have_current_path('/trabalhadors/new')
    data_nascimento = Date.parse(data_nascimento_str)
    fill_in "trabalhador[nome_completo]",	with: nome
    fill_in "trabalhador[telefone]",	with: telefone
    fill_in "trabalhador[data_nascimento]",	with: data_nascimento.strftime('%Y-%m-%d')
    fill_in "trabalhador[email]",	with: email
    fill_in "trabalhador[senha]",	with: senha
    fill_in "trabalhador[profissao]",	with: profissao
    click_button "Create Trabalhador"
  end
  
  Given('Eu estou na pagina de edicao do trabalhador com o nome {string}') do |nome|
    visit 'trabalhadors/1/edit'
    expect(current_path).to eq('/trabalhadors/1/edit')
  end
  
  When('Eu atualizo o telefone para {string} e a profissao para {string}') do |novo_telefone, nova_profissao|
    fill_in "trabalhador[telefone]", with: novo_telefone
    fill_in "trabalhador[profissao]", with: nova_profissao
  end
  
  When('Eu clico em Update trabalhador') do
    click_button "Update Trabalhador"
  end
  
  Then('Eu vejo a mensagem de editado com sucesso {string}') do |mensagem|
    expect(page).to have_content(mensagem)
  end
  
  #DELETAR
Given('O trabalhador com nome {string}, telefone {string}, data de nascimento {string}, email {string}, senha {string} e profissao {string} existe') do |nome, telefone, data_nascimento_str, email, senha, profissao|
  visit '/trabalhadors/new'
  expect(page).to have_current_path('/trabalhadors/new')
  data_nascimento = Date.parse(data_nascimento_str)
    fill_in "trabalhador[nome_completo]",	with: nome
    fill_in "trabalhador[telefone]",	with: telefone
    fill_in "trabalhador[data_nascimento]",	with: data_nascimento.strftime('%Y-%m-%d')
    fill_in "trabalhador[email]",	with: email
    fill_in "trabalhador[senha]",	with: senha
    fill_in "trabalhador[profissao]",	with: profissao
    click_button "Create Trabalhador"
  end

  Given('Eu estou na pagina de detalhes do trabalhador com o nome {string}') do |nome|
    expect(page).to have_content(nome)
  end

  When('Eu clico em Destroy this trabalhador') do
    click_on "Destroy this trabalhador"
  end

  Then('Eu vejo a mensagem de sucesso {string}') do |string|
    expect(page).to have_content(string)
  end

#Telefone pequeno
Given('Eu estou em registrar trabalhadores') do
    visit '/trabalhadors/new'
    expect(current_path).to eq('/trabalhadors/new')
  end
  
  When('Eu preencho o nome {string}, o telefone {string}, a data de nascimento {string}, o email {string}, a senha {string} e a profissao {string}') do |nome, telefone, data_nascimento_str, email, senha, profissao|
    data_nascimento = Date.parse(data_nascimento_str)
  
    fill_in "trabalhador[nome_completo]", with: nome
    fill_in "trabalhador[telefone]", with: telefone
    fill_in "trabalhador[data_nascimento]", with: data_nascimento.strftime('%Y-%m-%d')
    fill_in "trabalhador[email]", with: email
    fill_in "trabalhador[senha]", with: senha
    fill_in "trabalhador[profissao]", with: profissao
  end
  
  When('Eu clico em Create Trabalhador') do
    click_button "Create Trabalhador"
  end
  
  Then('Eu vejo a mensagem de erro {string}') do |mensagem|
    expect(page).to have_content(mensagem)
  end

  #Email invalido
  Given('Eu tenho no sistema um trabalhador com o nome {string}, telefone {string}, data de nascimento {string}, email {string}, senha {string} e profissao {string}') do |nome, telefone, data_nascimento_str, email, senha, profissao|
    data_nascimento = Date.parse(data_nascimento_str)

    Trabalhador.create!(
      nome_completo: nome,
      telefone: telefone,
      data_nascimento: data_nascimento,
      email: email,
      senha: senha,
      profissao: profissao
    )
  end
  
  Given('Eu estou na pagina de edicao desse trabalhador com o nome {string}') do |nome|
    visit 'trabalhadors/1/edit'
    expect(current_path).to eq('/trabalhadors/1/edit')
  end
  
  When('Eu atualizo o e-mail para {string}') do |novo_email|
    fill_in "trabalhador[email]", with: novo_email
  end

  When('Eu clico em Update Trabalhador') do
    click_button "Update Trabalhador"
  end

  Then('Eu vejo uma mensagem de erro {string}') do |mensagem|
    expect(page).to have_content(mensagem)
  end
  
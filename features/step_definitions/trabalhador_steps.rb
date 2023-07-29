Given('Eu estou na pagina de registrar trabalhadores') do
    visit '/trabalhadors/new'
    expect(current_path).to eq('/trabalhadors/new')
  end
  
  When('Eu preencho o nome {string}, o telefone {string}, a data de nascimento {string}, o endereco {string}, o email {string}, a senha {string} e a profissao {string}') do |nome, telefone, data_nascimento_str, endereco, email, senha, profissao|
    data_nascimento = Date.parse(data_nascimento_str)
  
    fill_in "trabalhador[nome_completo]",	with: nome
    fill_in "trabalhador[telefone]",	with: telefone
    fill_in "trabalhador[data_nascimento]",	with: data_nascimento.strftime('%Y-%m-%d')
    fill_in "trabalhador[email]",	with: email
    fill_in "trabalhador[senha]",	with: senha
    fill_in "trabalhador[profissao]",	with: profissao
  end
  
  When('Eu clico em {string}') do |string|
    click_button "Create Trabalhador"
  end
  
  Then('Eu vejo a mensagem de criado com sucesso {string}') do |string|
    expect(page).to have_content(string)
  end

# Step para criar um trabalhador no banco de dados
Given('Eu tenho um trabalhador com o nome {string}, telefone {string}, data de nascimento {string}, endereco {string}, email {string}, senha {string} e profissao {string}') do |nome, telefone, data_nascimento_str, endereco, email, senha, profissao|
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
  
  # Step para acessar a página de edição do trabalhador
  Given('Eu estou na pagina de edicao do trabalhador com o nome {string}') do |nome|
    trabalhador = Trabalhador.find_by(nome_completo: nome)
    visit edit_trabalhador_path(trabalhador)
  end
  
  # Step para atualizar o telefone e a profissão do trabalhador
  When('Eu atualizo o telefone para {string} e a profissao para {string}') do |novo_telefone, nova_profissao|
    fill_in "trabalhador[telefone]", with: novo_telefone
    fill_in "trabalhador[profissao]", with: nova_profissao
  end
  
  # Step para clicar no botão de atualizar trabalhador
  When('Eu aperto em {string}') do |string|
    click_button "Update Trabalhador"
  end
  
  # Step para verificar a mensagem de sucesso após a edição do trabalhador
  Then('Eu vejo a mensagem de editado com sucesso {string}') do |string|
    expect(page).to have_content(string)
  end
  
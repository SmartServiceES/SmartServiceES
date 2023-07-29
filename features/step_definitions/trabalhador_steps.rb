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
  
  Then('Eu vejo a mensagem de sucesso {string}') do |string|
    expect(page).to have_content(string)
  end
  
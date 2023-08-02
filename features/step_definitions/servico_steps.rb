Given("que existem serviços cadastrados na categoria {string}") do |categoria|
  @servicos_pedreiro =  Servico.create([
                                         { nome: 'Encanador 1', categoria: 'encanador' },
                                         { nome: 'Encanador 2', categoria: 'encanador' },
                                         { nome: 'pedreiro 1', categoria: 'pedreiro' },
                                         { nome: 'pedreiro 2', categoria: 'pedreiro' },
                                         { nome: 'Eletricista 1', categoria: 'eletricista' },
                                         { nome: 'Eletricista 2', categoria: 'eletricista' }
                                       ])

end

When("eu procuro pelos serviços da categoria {string}") do |categoria|
  @resultados = Servico.where(categoria: categoria)
end

Then("eu visualizo uma lista de serviços disponíveis de pedreiro") do
  expect(@resultados.all? { |servico| servico.categoria == 'pedreiro' }).to be true
end




Given("que contem serviços cadastrados na categoria {string}") do |categoria|
  @servicos_eletricista = Servico.create([
                                           { nome: 'Encanador 1', categoria: 'encanador' },
                                           { nome: 'Encanador 2', categoria: 'encanador' },
                                           { nome: 'pedreiro 1', categoria: 'pedreiro' },
                                           { nome: 'pedreiro 2', categoria: 'pedreiro' },
                                           { nome: 'Eletricista 1', categoria: 'eletricista' },
                                           { nome: 'Eletricista 2', categoria: 'eletricista' }
                                         ])
end

When("procuro serviços nesta categoria {string}") do |categoria|
  @resultados = Servico.where(categoria: categoria)
end

Then("eu visualizo uma lista de serviços disponíveis de eletricista") do
  expect(@resultados.all? { |servico| servico.categoria == 'eletricista' }).to be true
end




Given("que tem serviços cadastrados na categoria {string}") do |categoria|
  @servicos_encanador = Servico.create([
                                         { nome: 'Encanador 1', categoria: 'encanador' },
                                         { nome: 'Encanador 2', categoria: 'encanador' },
                                         { nome: 'pedreiro 1', categoria: 'pedreiro' },
                                         { nome: 'pedreiro 2', categoria: 'pedreiro' },
                                         { nome: 'Eletricista 1', categoria: 'eletricista' },
                                         { nome: 'Eletricista 2', categoria: 'eletricista' }
                                       ])
end

When("eu busco por um tipo de serviço da categoria {string}") do |categoria|
  @resultados = Servico.where(categoria: categoria)
end

Then("eu visualizo uma lista de serviços disponíveis de encanador") do
  expect(@resultados.all? { |servico| servico.categoria == 'eletricista' }).to be true
end




Given("que não existem serviços cadastrados na categoria {string}") do |categoria|
  Servico.where(categoria: categoria)#.destroy_all
end

When("eu varro pelos serviços da categoria {string}") do |categoria|
  @servicos_encontrados = Servico.where(categoria: categoria)
end

Then("eu visualizo uma mensagem informando que não há serviços disponíveis nesta categoria") do
  if @servicos_encontrados.empty?
    puts "Não há serviços disponíveis nesta categoria."
  else
    puts "A lista de serviços encontrados é:"
    @servicos_encontrados.each do |servico|
      puts servico.nome
    end
  end
end






Given("que existem serviços cadastrados nas categorias {string}") do |categorias|
  categorias_list = categorias.split(', ')
  @servicos = {}
  categorias_list.each do |categoria|
    @servicos[categoria] = Servico.create([
                                            { nome: 'Encanador 1', categoria: 'encanador' },
                                            { nome: 'Encanador 2', categoria: 'encanador' },
                                            { nome: 'pedreiro 1', categoria: 'pedreiro' },
                                            { nome: 'pedreiro 2', categoria: 'pedreiro' },
                                            { nome: 'Eletricista 1', categoria: 'eletricista' },
                                            { nome: 'Eletricista 2', categoria: 'eletricista' }
                                          ])
  end
end

When("eu vasculo pelos serviços das categorias {string}") do |categorias|
  categorias_list = categorias.split(', ')
  @resultados = {}
  categorias_list.each do |categoria|
    @resultados[categoria] = Servico.where(categoria: categoria)
  end
end

Then("eu visualizo uma lista de serviços disponíveis para cada categoria") do
  expect(@resultados.all? ).to be true
end
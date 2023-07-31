require "test_helper"

class ServicoTest < ActiveSupport::TestCase

  test 'criando servico com dados validos' do

    trabalhador = Trabalhador.new nome_completo: 'Pedro Souza',
                                  telefone: '81998436108',
                                  data_nascimento: '2000-09-14',
                                  email: 'pedroshouldz@outlook.com',
                                  senha: 'senha123',
                                  profissao: 'Lavador de carro'
    trabalhador.save

    servico = Servico.new(nome: 'Lava se Carros e Motos',
                          descricao: 'Lavagem completa de veiculos',
                          valor: '35', categoria: 'Estética Automotiva',
                          horario_inicio: '2023-08-29 08:00:00',
                          horario_termino: '2023-08-29 12:00:00',
                          trabalhador_id: trabalhador.id)

    assert servico.save

  end

  test 'Atualizando servico com dados invalidos' do

    trabalhador = Trabalhador.new nome_completo: 'Pedro Souza',
                                  telefone: '81998436108',
                                  data_nascimento: '2000-09-14',
                                  email: 'pedroshouldz@outlook.com',
                                  senha: 'senha123',
                                  profissao: 'Lavador de carro'
    trabalhador.save

    servico = Servico.new nome: 'Lava se Carros e Motos',
                          descricao: 'Lavagem completa de veiculos',
                          valor: '35', categoria: 'Estética Automotiva',
                          horario_inicio: '2023-08-29 08:00:00',
                          horario_termino: '2023-08-29 12:00:00',
                          trabalhador_id: trabalhador.id
    servico.save

    servico.update horario_inicio: '2022-08-29 08:00:00', horario_termino: '2022-08-29 12:00:00'

    assert_not servico.save

  end

  test 'criando servico com dados invalidos' do

    trabalhador = Trabalhador.new nome_completo: 'Pedro Souza',
                                  telefone: '81998436108',
                                  data_nascimento: '2000-09-14',
                                  email: 'pedroshouldz@outlook.com',
                                  senha: 'senha123',
                                  profissao: 'Lavador de carro'
    trabalhador.save

    servico = Servico.new nome: 'Lava-se Carros e Motos',
                          descricao: '5555555555555',
                          valor: '', categoria: 'Estética Automotiva',
                          horario_inicio: '2023-08-29 08:00:00',
                          horario_termino: '2023-08-29 12:00:00',
                          trabalhador_id: trabalhador.id
    assert_not servico.save


  end

end

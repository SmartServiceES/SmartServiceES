require "test_helper"

class ContratoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    endereco = Endereco.new(nome_da_rua: 'Rua Oliveira',
                            numero_da_casa: '753',
                            cep: '55715200',
                            bairro: 'Prado aguas claras',
                            cidade: 'Feira Velha',
                            complemento: 'Apartamento')

    @cliente = Cliente.new(nome_completo:'Vanderson Vilesclaudio',
                            data_nascimento: '1965-06-12 00:00',
                            cpf: '05621298450',
                            email: 'Vanderson@email.com',
                            senha: '11556547',
                            telefone: '87986250145',
                           endereco: endereco)
    @cliente.save

    @trabalhador = Trabalhador.new nome_completo: 'Pedro Souza',
                                  telefone: '81998436108',
                                  data_nascimento: '2000-09-14',
                                  email: 'pedroshouldz@outlook.com',
                                  senha: 'senha123',
                                  profissao: 'Lavador de carro'
    @trabalhador.save

    @servico = Servico.new(nome: 'Lava se Carros e Motos',
                          descricao: 'Lavagem completa de veiculos',
                          valor: '35', categoria: 'Estética Automotiva',
                          horario_inicio: '2023-08-29 08:00:00',
                          horario_termino: '2023-08-29 12:00:00',
                          trabalhador_id: @trabalhador.id)

    @servico.save
  end

  test 'Criando contrato com dados válidos' do
    contrato = Contrato.new(cliente_id: @cliente.id, servico_id: @servico.id)
    puts "Antes de salvar: #{contrato.inspect}"
    assert contrato.save
  end
  
  test 'Criando contrato sem o cliente' do
    @contrato = Contrato.new(cliente_id: nil,
                             servico_id: @servico.id)
    assert_not @contrato.save
  end

  test 'Criando contrato sem o servico' do
    @contrato = Contrato.new(cliente_id: @cliente.id, servico_id: nil )
    assert_not @contrato.save
  end

end

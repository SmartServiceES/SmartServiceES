require "test_helper"

class ContratoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @endereco = Endereco.new(nome_da_rua: 'Rua Oliveira',
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

    @trabalhador = Trabalhador.new( nome_completo: 'Miles Morales', 
                                    telefone: '81974139856', 
                                    data_nascimento: '2000-09-14',
                                    email: 'Miles@email.com', 
                                    senha: 'senha123', 
                                    profissao: 'Engenheiro')
  end

  test 'Criando contrato com dados válidos' do
    @contrato = Contrato.new(   cliente: @cliente,
                                trabalhador: @trabalhador)
    assert @contrato.save
  end
  
  test 'Criando contrato sem o cliente' do
    @contrato = Contrato.new(   trabalhador: @trabalhador)
    assert not @contrato.save
  end

  test 'Criando contrato sem o trabalhador' do
    @contrato = Contrato.new(   cliente: @cliente)
    assert not @contrato.save
  end

end

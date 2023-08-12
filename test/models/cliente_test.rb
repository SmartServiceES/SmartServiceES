require "test_helper"

class ClienteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @endereco = Endereco.new(nome_da_rua: 'Rua Santos Dumount',
                            numero_da_casa: '245',
                            cep: '55715000',
                            bairro: 'Jardim Santa Rosa',
                            cidade: 'Feira Nova',
                            complemento: 'Casa')
    @endereco.save
  end

  test 'salvar cliente com dados validos' do
    cliente = Cliente.new(nome_completo:'Mauricio Freire',
                           data_nascimento: '2001-09-14 00:00',
                           cpf: '09521812450',
                           email: 'mauricio152@gmail.com',
                           senha: '11224896',
                           telefone: '87995562145',
                           endereco: @endereco)

    assert cliente.save
  end

  test 'salvar cliente com telefone incorreto' do

    cliente = Cliente.new(nome_completo:'Mauricio Freitas',
                          data_nascimento: '2002-09-14 00:00',
                          cpf: '05236812450',
                          email: 'mauriciofreitas@gmail.com',
                          senha: '11658896',
                          telefone: '8722113344',
                          endereco: @endereco)

    assert_not cliente.save
  end

  test 'salvar cliente com dados invalidos' do
    cliente = Cliente.new nome_completo:'Mauricio Melo',
                          data_nascimento: '2000-09-14 00:00',
                          cpf: '0562181245000',
                          email: 'mauricio@gmail.com',
                          senha: '11554896',
                          telefone: '87987562145'

    assert_not cliente.save
  end
end

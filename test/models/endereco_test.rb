require "test_helper"

class EnderecoTest < ActiveSupport::TestCase

  def setup ## devido a chave estrangeira
    cliente = Cliente.new(nome_completo:'Robert Freire',
                          data_nascimento: '2003-10-06 00:00',
                          cpf: '12345678990',
                          email: 'robert@gmail.com',
                          senha: '12345678',
                          telefone: '8712366589',
                          endereco: @endereco)

    @endereco = Endereco.new(nome_da_rua: 'Rua das Americas',
                             numero_da_casa: '120',
                             cep: '58549985',
                             bairro: 'Sao Cristovao',
                             cidade: 'Recife',
                             complemento: 'Casa',
                             cliente_id: cliente.id )
  end

  test 'Criar endereco com todos dados validos' do
    @endereco.save
  end

  test 'Atualizar endereco com dados invalidos' do
    @endereco.cep = '00'
    assert_not @endereco.save
  end

  test 'Criar endereco com dados invalidos' do
    endereco = Endereco.new(nome_da_rua: 'Rua',
                            numero_da_casa: '120',
                            cep: '58gi85',
                            bairro: 'Sao Cristovao',
                            cidade: '1522',
                            complemento: 'Casa')

    assert_not endereco.save
  end



end

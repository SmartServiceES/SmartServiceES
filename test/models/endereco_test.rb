require "test_helper"

class EnderecoTest < ActiveSupport::TestCase

  def setup ## devido a chave estrangeira

    cliente = Cliente.new(nome_completo:'Mauricio Freire',
                          data_nascimento: '2001-09-14 00:00',
                          cpf: '09521812450',
                          email: 'mauricio152@gmail.com',
                          senha: '11224896',
                          telefone: '87995562145')

    cliente.save

  end

  test 'Criar endereco com todos dados validos' do
    @endereco = Endereco.new(nome_da_rua: 'Rua das Americas',
                             numero_da_casa: '120',
                             cep: '58549985',
                             bairro: 'Sao Cristovao',
                             cidade: 'Recife',
                             complemento: 'Casa')

    @endereco.save
  end

  test 'Atualizar endereco com dados invalidos' do
    @endereco = Endereco.new(nome_da_rua: 'Rua das Americas',
                             numero_da_casa: '120',
                             cep: '00',
                             bairro: 'Sao Cristovao',
                             cidade: 'Recife',
                             complemento: 'Casa')

    assert_not @endereco.save
  end

  test 'Criar endereco com dados invalidos' do
    @endereco = Endereco.new(nome_da_rua: 'Rua',
                            numero_da_casa: '120',
                            cep: '58gi85',
                            bairro: 'Sao Cristovao',
                            cidade: '1522',
                            complemento: 'Casa')

    assert_not @endereco.save
  end



end

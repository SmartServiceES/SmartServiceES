require "test_helper"

class TrabalhadorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'Criando trabalhador com dados válidos' do
    trabalhador = Trabalhador.new nome_completo: 'Pedro Souza',
                                  telefone: '81998436108',
                                  data_nascimento: '2000-09-14',
                                  email: 'pedroshouldz@outlook.com',
                                  senha: 'senha123',
                                  profissao: 'Pedreiro'
    assert trabalhador.save
  end

  test 'Atualizando dados de um trabalhador com dados válidos' do
    trabalhador = Trabalhador.new nome_completo: 'Pedro Souza',
                                  telefone: '81998436108',
                                  data_nascimento: '2000-09-14',
                                  email: 'pedroshouldz@outlook.com',
                                  senha: 'senha123',
                                  profissao: 'Pedreiro'
    assert trabalhador.save

    trabalhador.update nome_completo: 'Pedro Caitano'

    assert_equal 'Pedro Caitano', trabalhador.reload.nome_completo
  end

  test 'Criando trabalhador com dados invalidos' do
    trabalhador = Trabalhador.new nome_completo: 'Pedro Souza',
                                  telefone: '81998436108',
                                  data_nascimento: '2023-01-15',
                                  email: 'pedroshouldz@outlook.com',
                                  senha: 'senha123',
                                  profissao: 'Pedreiro'
    assert_not trabalhador.save
  end
end

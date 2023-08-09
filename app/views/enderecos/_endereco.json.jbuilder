json.extract! endereco, :id, :nome_da_rua, :numero_da_casa, :cep, :bairro, :cidade, :complemento, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)

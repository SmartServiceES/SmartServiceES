json.extract! cliente, :id, :nome_completo, :data_nascimento, :cpf, :email, :senha, :telefone, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)

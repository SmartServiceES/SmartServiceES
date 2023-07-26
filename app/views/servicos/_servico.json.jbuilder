json.extract! servico, :id, :nome, :descricao, :valor, :categoria, :horario_inicio, :horario_termino, :created_at, :updated_at
json.url servico_url(servico, format: :json)

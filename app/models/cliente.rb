class Cliente < ApplicationRecord
  has_many :servico

  def self.ransackable_attributes(auth_object = nil)
    ["cpf", "created_at", "data_nascimento", "email", "id", "nome_completo", "senha", "telefone", "updated_at"]
  end

end

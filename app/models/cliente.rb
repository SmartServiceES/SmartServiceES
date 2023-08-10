class Cliente < ApplicationRecord
  has_many :servico
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco, allow_destroy: true
  
  def self.ransackable_attributes(auth_object = nil)
    ["cpf", "created_at", "data_nascimento", "email", "id", "nome_completo", "senha", "telefone", "updated_at"]
  end
end

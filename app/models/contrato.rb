class Contrato < ApplicationRecord
    belongs_to :cliente
    belongs_to :trabalhador
  
    validates :cliente_id, presence: true
    validates :trabalhador_id, presence: true
  
end
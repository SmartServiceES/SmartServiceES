class Contrato < ApplicationRecord
    belongs_to :cliente
    belongs_to :servico, dependent: :destroy

    validates :cliente_id, presence: true
    validates :servico_id, presence: true
  
end
class Contrato < ApplicationRecord
    belongs_to :cliente
    belongs_to :servico

    def self.ransackable_attributes(auth_object = nil)
        ["cliente_id", "created_at", "id", "servico_id", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["cliente", "servico"]
    end

    validates :cliente_id, presence: true
    validates :servico_id, presence: true
  
end
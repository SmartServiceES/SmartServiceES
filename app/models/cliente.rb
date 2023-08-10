class Cliente < ApplicationRecord
  has_many :servico
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco, allow_destroy: true
end

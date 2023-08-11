class Endereco < ApplicationRecord
  belongs_to :cliente

  validates :nome_da_rua, presence: true, length: {maximum: 40}, format: { with: /\A[a-zA-z ]+\z/}
  validates :numero_da_casa, presence: true, length: {maximum: 40}
  validates :cep, presence: true, length: {maximum: 8}
  validates :bairro, presence: true, length: {maximum: 40}, format: { with: /\A[a-zA-z ]+\z/}
  validates :cidade, presence: true, length: {maximum: 40}, format: { with: /\A[a-zA-z ]+\z/}
  validates :complemento, presence: true, length: {maximum: 40}, format: { with: /\A[a-zA-z ]+\z/}
end

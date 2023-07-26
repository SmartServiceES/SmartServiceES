class Servico < ApplicationRecord

  validates :nome, presence: true, length: {in: 3..30}, format: {with: /\A[a-zA-Z ]+\z/, message: "Use apenas letras"}
  validates :descricao, presence: true, length: {in: 1..150}, format: {with: /\A[a-zA-Z ]+\z/, message: "Use apenas letras"}
  validates_datetime :horario_inicio,on_or_after: -> { DateTime.current }, message: "deve ser igual ou posterior à data e hora atual"
  validates_datetime :horario_termino,on_or_after: -> { DateTime.current }, message: "deve ser igual ou posterior à data e hora atual"
  validates :valor, numericality: { greater_than_or_equal_to: 0 }


end

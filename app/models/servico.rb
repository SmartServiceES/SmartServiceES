class Servico < ApplicationRecord
  belongs_to :trabalhador
  has_one_attached :pix
  def self.ransackable_attributes(_auth_object = nil)
    ["categoria", "created_at", "descricao", "horario_inicio", "horario_termino", "id", "nome", "trabalhador_id", "updated_at", "valor"]
  end
  validates :nome, presence: true, length: {in: 3..30}, format: {with: /\A[a-zA-Z ]+\z/, message: "Use apenas letras"}
  validates :descricao, presence: true, length: {in: 1..150}, format: {with: /\A[a-zA-Z ]+\z/, message: "Use apenas letras"}
  validates_datetime :horario_inicio,on_or_after: -> { DateTime.current }, message: "deve ser igual ou posterior à data e hora atual"
  validates_datetime :horario_termino,on_or_after: -> { DateTime.current }, message: "deve ser igual ou posterior à data e hora atual"
  validates :valor, numericality: { greater_than_or_equal_to: 0 }
  validates :pix, presence: true

  def nome_completo_e_sobrenome
    "#{id} #{nome}" # Substitua 'nome' e 'sobrenome' pelos seus atributos reais
  end
end

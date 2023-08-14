class Cliente < ApplicationRecord
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco, allow_destroy: true
  has_many :contratos

  validates :nome_completo, presence: {message: 'Nome completo obrigatório'}, format: {with: /\A[a-zA-z ]+\z/}, length: {minimum: 8, maximum: 80}
  validates :cpf, presence: {message: 'CPF obrigatório'}, length: {minimum: 11, maximum: 11}, numericality: {only_integer: true}, uniqueness: true
  validates :email, presence: {message: 'E-mail obrigatório'}, format: {with: URI:: MailTo::EMAIL_REGEXP}, uniqueness: true
  validates :senha, presence: {message: 'Senha obrigatória'}, length: {minumum: 5, maximum: 20}, uniqueness: true
  validates :telefone, presence: {message: 'Telefone para contato obrigatório'}, length: {is: 11, message: 'Precisa ter 11 dígitos'}
  validates_date :data_nascimento, before: -> { 18.years.ago }, before_message: "você deve ser maior de 18 para se cadastrar."

  def self.ransackable_attributes(_auth_object = nil)
    ["cpf", "created_at", "data_nascimento", "email", "id", "nome_completo", "senha", "telefone", "updated_at"]
  end

  def nome_completo_e_sobrenome
    "#{nome_completo} - #{cpf}"
  end

  def nome_cpf

  end
end

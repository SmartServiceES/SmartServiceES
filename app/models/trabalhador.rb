class Trabalhador < ApplicationRecord
  has_many :servicos, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "data_nascimento", "email", "id", "nome_completo", "profissao", "senha", "telefone", "updated_at"]
  end

  validates :nome_completo, presence: {message: 'obrigatório (minimo 8)'}, format: {with: /\A[a-zA-z ]+\z/}, length: {minimum: 8, maximum: 80}
  validates :data_nascimento, presence: true
  validates :email, presence: {message: 'obrigatório'}, format: {with: URI:: MailTo::EMAIL_REGEXP}, uniqueness: true
  validates :telefone, presence: {message: 'para contato obrigatório'}, length: {is: 11, message: 'precisa ter 11 dígitos'}
  validates :profissao, presence: {message: 'Campo obrigatório'}, length: {maximum: 40}
  validates :senha, presence: {message: 'obrigatória'}, length: {minumum: 5, maximum: 20}, uniqueness: true
  validates_date :data_nascimento, before: -> { 18.years.ago }, before_message: "você deve ser maior de 18 para se cadastrar."
end

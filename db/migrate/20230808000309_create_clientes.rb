class CreateClientes < ActiveRecord::Migration[7.0]
  def change
    create_table :clientes do |t|
      t.text :nome_completo
      t.date :data_nascimento
      t.text :cpf
      t.text :email
      t.text :senha
      t.text :telefone

      t.timestamps
    end
  end
end

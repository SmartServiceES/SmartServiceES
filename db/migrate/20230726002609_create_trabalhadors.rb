class CreateTrabalhadors < ActiveRecord::Migration[7.0]
  def change
    create_table :trabalhadors do |t|
      t.string :nome_completo
      t.string :telefone
      t.date :data_nascimento
      t.string :email
      t.string :senha
      t.string :profissao

      t.timestamps
    end
  end
end

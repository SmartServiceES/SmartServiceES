class CreateServicos < ActiveRecord::Migration[7.0]
  def change
    create_table :servicos do |t|
      t.string :nome
      t.string :descricao
      t.float :valor
      t.string :categoria
      t.datetime :horario_inicio
      t.datetime :horario_termino

      t.timestamps
    end
  end
end

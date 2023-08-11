class CreateContratos < ActiveRecord::Migration[7.0]
  def change
    create_table :contratos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.references :servico, null: false, foreign_key: true
      t.timestamps
    end
  end
end

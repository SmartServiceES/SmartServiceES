class CreateContratos < ActiveRecord::Migration[7.0]
  def change
    create_table :contratos do |t|

      t.timestamps
    end
  end
end

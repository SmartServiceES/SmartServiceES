class AddStatusToContratos < ActiveRecord::Migration[7.0]
  def change
    add_column :contratos, :status, :string
  end
end

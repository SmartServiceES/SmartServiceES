class AddClienteToEndereco < ActiveRecord::Migration[7.0]
  def change
    add_reference :enderecos, :cliente, null: false, foreign_key: true
  end
end

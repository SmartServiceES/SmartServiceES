class AddClienteToServico < ActiveRecord::Migration[7.0]
  def change
    add_reference :servicos, :servico, null: false, foreign_key: true
  end
end

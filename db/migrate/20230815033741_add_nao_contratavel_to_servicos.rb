class AddNaoContratavelToServicos < ActiveRecord::Migration[7.0]
  def change
    add_column :servicos, :contratado, :boolean, default: false
  end

end

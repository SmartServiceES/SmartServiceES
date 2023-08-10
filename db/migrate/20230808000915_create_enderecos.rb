class CreateEnderecos < ActiveRecord::Migration[7.0]
  def change
    create_table :enderecos do |t|
      t.text :nome_da_rua
      t.text :numero_da_casa
      t.text :cep
      t.text :bairro
      t.text :cidade
      t.text :complemento

      t.timestamps
    end
  end
end

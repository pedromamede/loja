class CreateVendas < ActiveRecord::Migration
  def self.up
    create_table :vendas do |t|
      t.integer :produto_id
      t.integer :vendedor_id
      t.integer :cliente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :vendas
  end
end


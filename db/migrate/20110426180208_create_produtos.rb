class CreateProdutos < ActiveRecord::Migration
  def self.up
    create_table :produtos do |t|
      t.string :nome
      t.string :descricao
      t.float :valor
      t.integer :quantidade

      t.timestamps
    end
  end

  def self.down
    drop_table :produtos
  end
end


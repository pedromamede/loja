class Venda < ActiveRecord::Base

  belongs_to :produto
  belongs_to :vendedore
  belongs_to :cliente

  validates_presence_of :produto_id, :message => "- Selecione um produto."
  validates_presence_of :vendedor_id, :message => "- Selecione um vendedor."
  validates_presence_of :produto_id, :message => "- Selecione um cliente."

end


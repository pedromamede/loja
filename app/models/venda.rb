class Venda < ActiveRecord::Base

  belongs_to :produto
  belongs_to :vendedor
  belongs_to :cliente

  validates_presence_of :produto_id, :message => "- Selecione um produto."
  validates_presence_of :vendedor_id, :message => "- Selecione um vendedor."
  validates_presence_of :cliente_id, :message => "- Selecione um cliente."

  after_save :atualizar_estoque

  def atualizar_estoque
    produto = self.produto
    produto.quantidade = produto.quantidade-1
    produto.save
  end

end


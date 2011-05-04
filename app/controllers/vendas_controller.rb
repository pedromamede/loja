class VendasController < ApplicationController

  def index
    @vendas = Venda.order "cliente_id"
  end

end


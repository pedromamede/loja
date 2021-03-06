class VendasController < ApplicationController

  def index
    if params[:nome_cliente] && params[:nome_cliente]!=''
      clientes = Cliente.where(["nome LIKE ?","%#{params[:nome_cliente]}%"])
      if clientes!=nil && clientes!=[]
        @cliente = clientes.first
        @vendas = clientes.first.vendas
      else
        @vendas = []
      end
    else
      @vendas = Venda.all
    end
  end

  def show
    @venda = Venda.find(params[:id])
  end

  def new
    @venda = Venda.new
  end

  def create
    @venda = Venda.new(params[:venda])
    if @venda.save
      redirect_to (@venda, :notice => 'Venda efetuada com sucesso!')
    else
      render :action => "new"
    end
  end

  def update
    @venda = Venda.find(params[:id])
    puts @venda.id
    if @venda.update_attributes(params[:venda])
      redirect_to (@venda, :notice => 'Dados da venda atualizados com sucesso!')
    else
      render :action => 'edit'
    end
  end

  def edit
    @venda = Venda.find(params[:id])
    puts @venda.id
  end

  def destroy
    @venda = Venda.find(params[:id])
    @venda.destroy
    redirect_to :action => 'index'
  end

end


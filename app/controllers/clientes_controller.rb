class ClientesController < ApplicationController

  def index
    @clientes = Cliente.order "nome"
  end

  def show
    @cliente = Cliente.find(params[:id])
  end

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(params[:cliente])
    if @cliente.save
      redirect_to(@cliente,:notice => "Cliente cadastrado com sucesso!")
    else
      render :action => "new"
    end
  end

  def edit
    @cliente = Cliente.find(params[:id])
  end

  def update
    @cliente = Cliente.find(params[:id])
    if @cliente.update_attributes(params[:cliente])
      redirect_to(@cliente, :notice => "Cliente atualizado com sucesso!")
    else
      render :action => "edit"
    end
  end

  def destroy
    @cliente = Cliente.find(params[:id])
    begin
      @cliente.destroy
      redirect_to(:action => "index")
    rescue ActiveRecord::DeleteRestrictionError => error
      flash[:error] = "O cliente está ligado a uma ou mais vendas e não pode ser excluido."
      redirect_to clientes_path
    end
  end

end


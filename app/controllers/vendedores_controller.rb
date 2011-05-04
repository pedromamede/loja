class VendedoresController < ApplicationController

  def index
    @vendedores = Vendedor.order "nome"
  end

  def new
    @vendedor = Vendedor.new
  end

  def create
    @vendedor = Vendedor.new(params[:vendedor])
    if @vendedor.save
      redirect_to(@vendedor,:notice => "Vendedor cadastrado com sucesso!")
    else
      render :action => "new"
    end
  end

  def edit
    @vendedor = Vendedor.find(params[:id])
  end

  def update
    @vendedor = Vendedor.find(params[:id])
    if @vendedor.update_attributes(params[:vendedor])
      redirect_to(@vendedor,:notice => "Vendedor atualiza com sucesso!")
    else
      render :action => "edit"
    end
  end


  def show
    @vendedor = Vendedor.find(params[:id])
  end

  def destroy
    @vendedor = Vendedor.find(params[:id])
    @vendedor.destroy
    redirect_to(:action => "index")
  end

end


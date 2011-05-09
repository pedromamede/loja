class ProdutosController < ApplicationController

  def index
    @produtos = Produto.order "nome"
  end

  def show
    @produto = Produto.find(params[:id])
  end

  def new
    @produto = Produto.new
  end

  def create
    @produto = Produto.new(params[:produto])
    if @produto.save
      redirect_to(@produto,:notice => "Produto cadastrado com sucesso!")
    else
      render :action => "new"
    end
  end

  def edit
    @produto = Produto.find(params[:id])
  end

  def update
    @produto = Produto.find(params[:id])
    if @produto.update_attributes(params[:produto])
      redirect_to(@produto, :notice => "Produto atualizado com sucesso!")
    else
      render :action => "edit"
    end
  end

  def destroy
    @produto = Produto.find(params[:id])
    begin
      @produto.destroy
      redirect_to(:action => "index")
    rescue ActiveRecord::DeleteRestrictionError => error
      flash[:error] = "O produto está ligado a uma ou mais vendas e não pode ser excluido."
      redirect_to produtos_path
    end
  end

end


module ApplicationHelper

  def formato_moeda_real(valor)
    number_to_currency(valor,:unit=>'R$',:separator=>',',:delimiter=>'.')
  end

  def menu_principal
    itens_do_menu = ['Produtos','Vendedores','Clientes','Vendas']
    menu = "<strong>"
    itens_do_menu.each do |item|
      menu << "- #{item} "
    end
    menu << "</strong>  "
    raw menu
  end
end


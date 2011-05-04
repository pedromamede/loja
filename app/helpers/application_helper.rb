module ApplicationHelper

  def formato_moeda_real(valor)
    number_to_currency(valor,:unit=>'R$',:separator=>',',:delimiter=>'.')
  end
end


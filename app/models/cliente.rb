class Cliente < ActiveRecord::Base

  has_many :vendas

  validates_presence_of [:nome,:cpf],:message => '- deve ser preenchido.'
  validates_uniqueness_of :cpf,:message => '- Este CPF já está cadastrado.'
  validates_uniqueness_of :email,:message => '- Este email já está cadastrado.'
  validates_uniqueness_of :telefone,:message => '- Este telefone já está cadastrado.'

end


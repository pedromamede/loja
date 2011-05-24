class Produto < ActiveRecord::Base

  has_many :vendas, :dependent => :restrict

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_presence_of [:nome,:descricao,:valor],:message => "- deve ser preenchido."
  validates_uniqueness_of :nome,:message => "- Este nome já está cadastrado."
  validates_numericality_of [:valor,:quantidade],:message => "- deve ser um número."

  scope :em_estoque, :conditions => 'quantidade > 0'

end


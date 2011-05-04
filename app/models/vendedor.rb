class Vendedor < ActiveRecord::Base

  has_many :vendas

  validates_presence_of [:nome,:codigo,:salario],:message => "- deve ser preenchido."
  validates_numericality_of [:codigo,:salario], :message => "- deve ser um número."
  validates_uniqueness_of :nome, :message => "- Este nome já está cadastrado."
  validates_uniqueness_of :codigo, :message => "- Este código já está cadastrado."

end


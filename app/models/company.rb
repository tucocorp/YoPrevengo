class Company < ActiveRecord::Base
	attr_accessible :name, :address, :company_type
	
	# Relaciones
	has_many :work_areas, :dependent => :destroy
	has_many :evaluation_criteries

	# Validaciones
	# Nombre de la Compañia
	validates 	:name, :presence => { :message => "Debe ingresar un nombre" }
	
 	# Direccion
	validates 	:address, :presence => { :message => "Debe ingresar una direccion" }
 	
 	# Giro de la Compañia			
 	validates 	:company_type, :presence => { :message => "Debe ingresar una direccion" }
end

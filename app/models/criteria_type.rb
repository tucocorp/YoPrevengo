class CriteriaType < ActiveRecord::Base
	attr_accessible :name
	# Relaciones
	has_many :evaluation_criteries

	# Validaciones
	# Nombre del tipo de Criterio
	validates_presence_of :name, :message => "Debe ingresar un nombre de tipo de criterio"
end

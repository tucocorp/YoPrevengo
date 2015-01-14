class Danger < ActiveRecord::Base
	attr_accessible :description
	# Relaciones
	has_many :risks, :dependent => :destroy

	# Validaciones
	# Descripcion de la actividad
	validates 	:description, :presence => { :message => "Debe ingresar un Peligro" }
end

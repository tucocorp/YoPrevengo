class UnitaryTask < ActiveRecord::Base
	attr_accessible :description, :activity_id, :risk_ids, :generate
	
	# Relaciones
	belongs_to :activity
	has_many :matrix_headers

	# Validaciones
	# Descripcion de la tarea unitaria
	validates 	:description, :presence => { :message => "Debe ingresar una tarea unitaria" }

end

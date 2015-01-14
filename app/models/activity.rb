class Activity < ActiveRecord::Base
	attr_accessible :description, :work_flow_id, :activity_type_id
	
	# Relaciones
	belongs_to :work_flow
	belongs_to :activity_type
	has_many :unitary_tasks, :dependent => :destroy

	# Validaciones
	# Descripcion de la actividad
	validates 	:description, :presence => { :message => "Debe ingresar una actividad" }

end

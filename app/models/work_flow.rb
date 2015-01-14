class WorkFlow < ActiveRecord::Base
	attr_accessible :name, :description, :work_area_id
	
	# Relaciones
	belongs_to :work_area
	has_many :activities, :dependent => :destroy

	#accepts_nested_attributes_for :work_area, :allow_destroy => true
	
	# Validaciones
	# Nombre del Proceso de Trabajo
	validates 	:name, :presence => { :message => "Debe ingresar un nombre de Area" }
	
 	# Descripcion de Proceso de Trabajo
	validates 	:description, :presence => { :message => "Debe ingresar una descripcion" }
end

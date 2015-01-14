class EvaluationCritery < ActiveRecord::Base
	attr_accessible :name, :description, :value, :criteria_type_id, :company_id

	# Relaciones
	belongs_to :criteria_type
	belongs_to :company

	# Validaciones
	# Nombre del Criterio de Evaluacion
	validates_presence_of :name, :message => "Debe ingresar un nombre de criterio de evaluacion"
	
	# Descripcion del Criterio de Evaluacion
	validates_presence_of :description, :message => "Debe ingresar una Descripcion"
	

	# Valor del Criterio de Evaluacion
	validates_presence_of :value, :message => "Debe ingresar un valor de evaluacion"
	validates_numericality_of :value, :on => :create, :message => "El valor debe ser numerico"
end

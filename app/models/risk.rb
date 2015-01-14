class Risk < ActiveRecord::Base
	attr_accessible :name, :description , :matrix_header_ids, :damage_ids
	# Relaciones
	belongs_to :danger
	has_many :risk_matrices
	has_many :matrix_headers, :through => :risk_matrices

	has_many :risks_damages
	has_many :damages, :through => :risks_damages
	# Validaciones
	# Descripcion del riesgo
	validates 	:description, :presence => { :message => "Debe ingresar un riesgo" }
end

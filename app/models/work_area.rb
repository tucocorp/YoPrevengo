class WorkArea < ActiveRecord::Base
	attr_accessible :name, :description, :company_id
	
	# Relaciones
	belongs_to :company
	has_many :work_flows, :dependent => :destroy

	# Validaciones
	# Nombre del Area de Trabajo
	validates 	:name, :presence => { :message => "Debe ingresar un nombre de Area" }
	
 	# Descripcion del Area de Trabajo
	validates 	:description, :presence => { :message => "Debe ingresar una descripcion" }

end

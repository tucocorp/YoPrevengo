class ActivityType < ActiveRecord::Base
	attr_accessible :name
	
	# Relaciones
	has_many :activities

	# Validaciones
	# Nombre
 	validates   :name,
 				:presence => true,
 				:length => {:minimum => 1, :maximum => 254}
end

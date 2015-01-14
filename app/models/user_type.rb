class UserType < ActiveRecord::Base
	attr_accessible :name
	
	# Relaciones
	has_many :users

	# Validaciones
	# Nombre
 	validates   :name,
 				:presence => true,
 				:length => {:minimum => 1, :maximum => 254}
end

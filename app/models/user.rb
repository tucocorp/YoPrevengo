class User < ActiveRecord::Base
	attr_accessible :old_password, :run, :username, :lastname, :surname, :phono, :email, :password, :password_confirmation, :user_type_id
	#Relaciones
	belongs_to :user_type

	#autentificacion de usuario
	authenticates_with_sorcery! 
	

	#validaciones
	#Rut
	validates_presence_of :run, :message => "Ingrese su rut"
	validates_length_of :run, :maximum=>9, :message => "Debe tener maximo 9 caracteres"
	validates_uniqueness_of :run, :message => "El rut que ha ingresado ya existe"
	
	#validates 	:run, 
	#:presence => true, :message => "Ingrese su nombre"	# campos vacios
	#		  	:uniqueness => true, # unico
	#		  	:numericality => true, #numerico
	#		 	:length => {:minimum => 1, :maximum => 9} #tamaño

	#Nombre
	validates_presence_of :username, :message => "Ingrese su nombre"
 	#validates   :username,
 	#			:presence => true,
 	#			:length => {:minimum => 1, :maximum => 254}

 	#Apellido Paterno
 	validates_presence_of :lastname, :message => "Ingrese su apellido paterno"
 	#validates   :lastname,
	#			:presence => true,
 	#			:length => {:minimum => 1, :maximum => 254}

 	#Apellido Materno
 	validates_presence_of :surname, :message => "Ingrese su nombre materno"
 	#validates   :surname,
 	#			:presence => true,
 	#			:length => {:minimum => 1, :maximum => 254}

 	#Telefono
 	#validates_presence_of :phono, :message => "Ingrese su telefono"
 	validates_numericality_of :phono, :on => :create, :message => "El telefono debe ser numerico"
 	#validates   :phono,
 	#			:presence => true,
 	#			:numericality => true,
 	#			:length => {:minimum => 1, :maximum => 20}

 	#Email
 	validates_presence_of :surname, :message => "Ingrese su correo electronico"
 	validates_uniqueness_of :email, :message => "El correo que ha ingresado ya ha sido ocupado por otro usuario"
 	#validates   :email,
 	#			:presence => true

 	#password
 	validates_confirmation_of :password, :message => 'Tiene que confirmar la password'
  	validates_presence_of :password, :on => :create, :message => 'ingrese su password'
 end

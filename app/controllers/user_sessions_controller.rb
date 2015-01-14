class UserSessionsController < ApplicationController
	def new
		#@user = User.new
		#@entrar = "   Entrar   "
	end
	def create
		if user = login(params[:username], params[:password])
			redirect_back_or_to(root_path, message: "Login exitoso")
		else
			flash.now[:alert] = "Algo salio mal con el login"
			render action: :new
		end
	end

	def destroy
		logout
		redirect_to(:login, message: "Logged out")
	end
end
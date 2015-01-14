class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.find(:all, :joins => :user_type, :order =>["user_types.name","users.username"])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @res = 0
    @usuarios = "Agregar"
    @users = UserType.all
    @user = User.new
    #@tipoUsuario = UserType.all 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @res = 1
    @usuarios = "Actualizar"
    @users = UserType.all
    @user = User.find(params[:id])
  end

  def edit_password
    @user = User.find(params[:id])
    @users = UserType.all
  end

  # POST /users
  # POST /users.json
  def create
    @usuarios = "Agregar"
    @user = User.new(params[:user])

   # @user.user_type_id = 2

    if @user.save
      redirect_to root_path, :notice => "Se ha creado el usuario #{@user.username} #{@user.lastname} #{@user.surname} exitosamente."
    else
      render :new
    end

  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @usuarios = "Actualizar"
    @users = UserType.all
    @user = User.find(params[:id])
    @cont = params[:cont]

    respond_to do |format|
      if @user.update_attributes(params[:user])
        if @cont != 1
          format.html { redirect_to users_path, notice: "El usuario #{@user.username} #{@user.lastname} ha sido actualizado exitosamente." }
          format.json { head :no_content }
        else
          format.html { redirect_to root_path, notice: "El usuario #{@user.username} #{@user.lastname} ha sido actualizado exitosamente." }
          format.json { head :no_content }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_password
    @user = User.find(params[:id])
    if request.post?
      if User.authenticate(@user.username, params[:old_password]) == @user
        @user.password = params[:nuevo_password]
        @user.password_confirmation = params[:password_confirmation]
        if @user.save
          redirect_to root_path
        else
          redirect_to edit_contrasena_path
        end
      else
        flash[:error] = "Invalid Password"
        redirect_to edit_contrasena_path
      end
    end
  end
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def actualizar_datos
    @boton = "Actualizar Datos Personales"
    @user = User.find(params[:id])
  end

  def guardar_actualizar_datos
     @user = User.find(params[:id])
     respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'se modifico exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def asignarRol
    @user = User.find(params[:id])
    @tipoUsuario = UserType.all 
    @opcion = 1
  end
end

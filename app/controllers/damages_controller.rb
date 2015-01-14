class DamagesController < ApplicationController
  # GET /damages
  # GET /damages.json
  def index
    @damages = Damage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @damages }
    end
  end

  # GET /damages/1
  # GET /damages/1.json
  def show
    @damage = Damage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @damage }
    end
  end

  # GET /damages/new
  # GET /damages/new.json
  def new
    
    @boton = "Agregar"
    @damage = Damage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @damage }
    end
  end

  # GET /damages/1/edit
  def edit
    @boton = "Actualizar"
    @damage = Damage.find(params[:id])
  end

  # POST /damages
  # POST /damages.json
  def create
    @damage = Damage.new(params[:damage])

    respond_to do |format|
      if @damage.save
        format.html { redirect_to damages_path, notice: 'se creo exitosamente.' }
        format.json { render json: @damage, status: :created, location: @damage }
      else
        format.html { render action: "new" }
        format.json { render json: @damage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /damages/1
  # PUT /damages/1.json
  def update
    @damage = Damage.find(params[:id])

    respond_to do |format|
      if @damage.update_attributes(params[:damage])
        format.html { redirect_to @damage, notice: 'se modifico exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @damage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /damages/1
  # DELETE /damages/1.json
  def destroy
    @damage = Damage.find(params[:id])
    @damage.destroy

    respond_to do |format|
      format.html { redirect_to damages_url }
      format.json { head :no_content }
    end
  end
end

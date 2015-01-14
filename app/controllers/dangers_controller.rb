class DangersController < ApplicationController
  # GET /dangers
  # GET /dangers.json
  def index
    @dangers = Danger.all
    @risks = Risk.all
    @riesgo = 0

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dangers }
    end
  end

  # GET /dangers/1
  # GET /dangers/1.json
  def show
    @riesgos = Risk.where(:danger_id => params[:id])
    @danger = Danger.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @danger }
    end
  end

  # GET /dangers/new
  # GET /dangers/new.json
  def new
    @boton = "Agregar"
    @danger = Danger.new

    
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @danger }
    end
  end

  # GET /dangers/1/edit
  def edit
    @boton = "Actualizar"
    @danger = Danger.find(params[:id])
  end

  # POST /dangers
  # POST /dangers.json
  def create
    @danger = Danger.new(params[:danger])

    respond_to do |format|
      if @danger.save
        format.html { redirect_to dangers_url, notice: 'se creo exitosamente.' }
        format.json { render json: @danger, status: :created, location: @danger }
      else
        format.html { render action: "new" }
        format.json { render json: @danger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dangers/1
  # PUT /dangers/1.json
  def update
    @danger = Danger.find(params[:id])

    respond_to do |format|
      if @danger.update_attributes(params[:danger])
        format.html { redirect_to @danger, notice: 'se modifico exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @danger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dangers/1
  # DELETE /dangers/1.json
  def destroy
    @danger = Danger.find(params[:id])
    @danger.destroy

    respond_to do |format|
      format.html { redirect_to dangers_url }
      format.json { head :no_content }
    end
  end
end

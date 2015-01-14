class RisksController < ApplicationController
  # GET /risks
  # GET /risks.json
  def index
    @risks = Risk.order("danger_id")
    @riesgo = 0

    #@risk = Risk.find(params[:id])
    #@danger = Danger.find(params[:danger_id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @risks }
    end
  end

  
  # GET /risks/1
  # GET /risks/1.json
  def show
    @risk = Risk.find(params[:id])
    @danger = Danger.find(params[:danger_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @risk }
    end
  end

  # GET /risks/new
  # GET /risks/new.json
  def new
    @boton = "Agregar"
    @risk = Risk.new
    @danger = Danger.find(params[:danger_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @risk }
    end
  end

  # GET /risks/1/edit
  def edit
    @boton  = "Actualizar"
    @risk   = Risk.find(params[:id])
   @danger = Danger.find(params[:danger_id])
  end

  # POST /risks
  # POST /risks.json
  def create
    @danger = Danger.find(params[:danger_id])
    @risk = @danger.risks.new(params[:risk])

    respond_to do |format|
      if @risk.save
        format.html { redirect_to dangers_url, notice: 'El riesgo fue creado exitosamente.' }
        format.json { render json: @risk, status: :created, location: @risk }
      else
        format.html { render action: "new" }
        format.json { render json: @risk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /risks/1
  # PUT /risks/1.json
  def update
    params[:risk][:damage_ids] ||= []
    @risk = Risk.find(params[:id])
    @danger = Danger.find(params[:danger_id])

    respond_to do |format|
      if @risk.update_attributes(params[:risk])
        format.html { redirect_to [@danger, @risk], notice: 'El riesgo fue actualizado con exito.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @risk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /risks/1
  # DELETE /risks/1.json
  def destroy
    @risk = Risk.find(params[:id])
    @danger = Danger.find(params[:danger_id])
    @risk.destroy

    respond_to do |format|
      format.html { redirect_to dangers_url }
      format.json { head :no_content }
    end
  end
end

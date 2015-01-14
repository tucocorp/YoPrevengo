class EvaluationCriteriesController < ApplicationController
  # GET /evaluation_criteries
  # GET /evaluation_criteries.json
  def index
    @evaluation_criteries = EvaluationCritery.all
    @company = Company.find(params[:company_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @evaluation_criteries }
    end
  end

  # GET /evaluation_criteries/1
  # GET /evaluation_criteries/1.json
  def show
    
    @evaluation_critery = EvaluationCritery.find(params[:id])
    @company = Company.find(params[:company_id]) 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evaluation_critery }
    end
  end

  # GET /evaluation_criteries/new
  # GET /evaluation_criteries/new.json
  def new
    @tipoevaluacion = params[:x]
    @boton = "Agregar"
    @criteria_type = CriteriaType.all
    @evaluation_critery = EvaluationCritery.new
    @company = Company.find(params[:company_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evaluation_critery }
    end
  end

  # GET /evaluation_criteries/1/edit
  def edit
    @boton = "Actualizar"
    @criteria_type = CriteriaType.all
    @evaluation_critery = EvaluationCritery.find(params[:id])
    @tipoevaluacion = @evaluation_critery.criteria_type.name
    @company = Company.find(params[:company_id])
  end

  # POST /evaluation_criteries
  # POST /evaluation_criteries.json
  def create
    @criteria_type = CriteriaType.all
    @company = Company.find(params[:company_id])
    @evaluation_critery = @company.evaluation_criteries.new(params[:evaluation_critery])
    

    respond_to do |format|
      if @evaluation_critery.save
        format.html { redirect_to [@company], notice: 'El criterio de evaluacion ha sido agregado exitosamente.' }
        format.json { render json: @evaluation_critery, status: :created, location: @evaluation_critery }
      else
        format.html { render action: "new" }
        format.json { render json: @evaluation_critery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /evaluation_criteries/1
  # PUT /evaluation_criteries/1.json
  def update
    @criteria_type = CriteriaType.all
    @evaluation_critery = EvaluationCritery.find(params[:id])
    @company = Company.find(params[:company_id])

    respond_to do |format|
      if @evaluation_critery.update_attributes(params[:evaluation_critery])
        format.html { redirect_to [@company,@evaluation_critery], notice: 'El criterio de evaluacion ha sido actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @evaluation_critery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluation_criteries/1
  # DELETE /evaluation_criteries/1.json
  def destroy
    @company = Company.find(params[:company_id])
    @evaluation_critery = EvaluationCritery.find(params[:id])
    @evaluation_critery.destroy

    respond_to do |format|
      format.html { redirect_to [@company] }
      format.json { head :no_content }
    end
  end
end

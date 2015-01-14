class WorkAreasController < ApplicationController
  # GET /work_areas
  # GET /work_areas.json
  def index
    @work_areas = WorkArea.all
    @company = Company.find(params[:company_id]) 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @work_areas }
    end
  end

  # GET /work_areas/1
  # GET /work_areas/1.json
  def show
    @procesos = WorkFlow.where(:work_area_id => params[:id])
    @company = Company.find(params[:company_id]) 
    @work_area = WorkArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work_area }
    end
  end

  # GET /work_areas/new
  # GET /work_areas/new.json
  def new
    @boton = "Agregar"
    @procesos = "Agregar Nuevo Area de Trabajo"
    @work_area = WorkArea.new
    @company = Company.find(params[:company_id])
    
   respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work_area }
    end
  end

  # GET /work_areas/1/edit
  def edit

    @boton = "Actualizar"
    @work_area = WorkArea.find(params[:id])
    @company = Company.find(params[:company_id])
  end

  # POST /work_areas
  # POST /work_areas.json
  def create
    @company = Company.find(params[:company_id])
    @work_area = @company.work_areas.new(params[:work_area])

    respond_to do |format|
      if @work_area.save
        format.html { redirect_to [@company], notice: 'se creo exitosamente.' }
        format.json { render json: @work_area, status: :created, location: @work_area }
      else
        format.html { render action: "new" }
        format.json { render json: @work_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /work_areas/1
  # PUT /work_areas/1.json
  def update
    @work_area = WorkArea.find(params[:id])
    @company = Company.find(params[:company_id])

    respond_to do |format|
      if @work_area.update_attributes(params[:work_area])
        format.html { redirect_to [@company,@work_area], notice: 'se modifico exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_areas/1
  # DELETE /work_areas/1.json
  def destroy
    @company = Company.find(params[:company_id]) 
    @work_area = WorkArea.find(params[:id])
    @work_area.destroy

    respond_to do |format|
      format.html { redirect_to [@company] }
      format.json { head :no_content }
    end
  end
end

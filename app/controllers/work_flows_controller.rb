class WorkFlowsController < ApplicationController
  # GET /work_flows
  # GET /work_flows.json
  def index
    @work_flows = WorkFlow.all
   
    @work_area = WorkArea.find(params[:work_area_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @work_flows }
    end
  end

  # GET /work_flows/1
  # GET /work_flows/1.json
  def show
    @actividades = Activity.where(:work_flow_id => params[:id])
    @work_area = WorkArea.find(params[:work_area_id])
    @work_flow = WorkFlow.find(params[:id])
    @company = Company.find(@work_area.company_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work_flow }
    end
  end

  # GET /work_flows/new
  # GET /work_flows/new.json
  def new
    @boton = "Agregar"
    @work_flow = WorkFlow.new
    @work_area = WorkArea.find(params[:work_area_id])
    @company = Company.find(@work_area.company_id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work_flow }
    end
  end

  # GET /work_flows/1/edit
  def edit
    @boton = "Actualizar"
    @work_flow = WorkFlow.find(params[:id])
    @work_area = WorkArea.find(params[:work_area_id])
    @company = Company.find(@work_area.company_id)
  end

  # POST /work_flows
  # POST /work_flows.json
  def create
    @work_area = WorkArea.find(params[:work_area_id])
    @work_flow = @work_area.work_flows.new(params[:work_flow])
    @company = Company.find(@work_area.company_id)

    respond_to do |format|
      if @work_flow.save
        format.html { redirect_to [@company, @work_area], notice: 'se creo exitosamente.' }
        format.json { render json: @work_flow, status: :created, location: @work_flow }
      else
        format.html { render action: "new" }
        format.json { render json: @work_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /work_flows/1
  # PUT /work_flows/1.json
  def update
    @work_flow = WorkFlow.find(params[:id])
    @work_area = WorkArea.find(params[:work_area_id])

    respond_to do |format|
      if @work_flow.update_attributes(params[:work_flow])
        format.html { redirect_to [@work_area,@work_flow], notice: 'se modifico exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_flows/1
  # DELETE /work_flows/1.json
  def destroy

    @work_flow = WorkFlow.find(params[:id])
    @work_area = WorkArea.find(params[:work_area_id])
    @company = Company.find(@work_area.company_id)
    @work_flow.destroy

    respond_to do |format|
      format.html { redirect_to [@company, @work_area] }
      format.json { head :no_content }
    end
  end
end
class UnitaryTasksController < ApplicationController
  # GET /unitary_tasks
  # GET /unitary_tasks.json
  def index
    @unitary_tasks = UnitaryTask.all
     @activity = Activity.find(params[:activity_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @unitary_tasks }
    end
  end
  def list    
    @riesgos = Risk.all
    @riesgo = 0
    @riesgoarray = Array.new
    @tarea = UnitaryTask.find(params[:id])

    respond_to do |format|
      format.html # list.html.erb
      format.json { render json: @unitary_task }
    end
  end
  # GET /unitary_tasks/1
  # GET /unitary_tasks/1.json
  def show
    @i = 1
    @headers = MatrixHeader.where(:unitary_task_id => params[:id])
    @unitary_task = UnitaryTask.find(params[:id])
    @activity = Activity.find(params[:activity_id])
    @work_flow = WorkFlow.find(@activity.work_flow_id)
    @company = Company.find(@work_flow.work_area.company_id)
       
    @probabilidad = EvaluationCritery.where(:company_id => @company.id , :criteria_type_id => 2).order(:criteria_type_id)
    @consecuencia = EvaluationCritery.where(:company_id => @company.id , :criteria_type_id => 1).order(:criteria_type_id)
    @max = @consecuencia.last.value

    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unitary_task }
    end
  end

  # GET /unitary_tasks/new
  # GET /unitary_tasks/new.json
  def new
    @boton = "Agregar"
    @unitary_task = UnitaryTask.new
    @activity = Activity.find(params[:activity_id])
    @work_flow = WorkFlow.find(@activity.work_flow_id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @unitary_task }
    end
  end

  # GET /unitary_tasks/1/edit
  def edit
    @boton = "Actualizar"
    @unitary_task = UnitaryTask.find(params[:id])
    @activity = Activity.find(params[:activity_id])
    @work_flow = WorkFlow.find(@activity.work_flow_id)
  end

  # POST /unitary_tasks
  # POST /unitary_tasks.json
  def create
    @activity = Activity.find(params[:activity_id])
    @unitary_task = @activity.unitary_tasks.new(params[:unitary_task])
    @work_flow = WorkFlow.find(@activity.work_flow_id)

    respond_to do |format|
      if @unitary_task.save
        format.html { redirect_to [@work_flow, @activity], notice: 'se creo exitosamente.' }
        format.json { render json: @unitary_task, status: :created, location: @unitary_task }
      else
        format.html { render action: "new" }
        format.json { render json: @unitary_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /unitary_tasks/1
  # PUT /unitary_tasks/1.json
  def update
    @unitary_task = UnitaryTask.find(params[:id])
    @activity = Activity.find(params[:activity_id])
    @work_flow = WorkFlow.find(@activity.work_flow_id)

    respond_to do |format|
      if @unitary_task.update_attributes(params[:unitary_task])
        format.html { redirect_to [@activity, @unitary_task], notice: 'se modifico exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unitary_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unitary_tasks/1
  # DELETE /unitary_tasks/1.json
  def destroy
    @unitary_task = UnitaryTask.find(params[:id])
    @activity = Activity.find(params[:activity_id])
    @work_flow = WorkFlow.find(@activity.work_flow_id)

    @unitary_task.destroy

    respond_to do |format|
      format.html { redirect_to [@work_flow,@activity] }
      format.json { head :no_content }
    end
  end


end
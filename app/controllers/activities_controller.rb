class ActivitiesController < ApplicationController
  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
    @tipos = ActivityType.where(:activity_id => params[:id])
    @work_flow = WorkFlow.find(params[:work_flow_id])
    @work_area = WorkArea.find(@work_flow.work_area_id)


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @unitarytask = UnitaryTask.where(:activity_id => params[:id])
    @activity = Activity.find(params[:id])
    @work_flow = WorkFlow.find(params[:work_flow_id])
    @work_area = WorkArea.find(@work_flow.work_area_id)
    @activities = ActivityType.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.json
  def new
    @boton = "Agregar"
    @activities = ActivityType.all
    @activity = Activity.new
    @work_flow = WorkFlow.find(params[:work_flow_id])
    @work_area = WorkArea.find(@work_flow.work_area_id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @boton = "Actualizar"
    @activities = ActivityType.all
    @activity = Activity.find(params[:id])
    @work_flow = WorkFlow.find(params[:work_flow_id])
    @work_area = WorkArea.find(@work_flow.work_area_id)
  end

  # POST /activities
  # POST /activities.json
  def create
    @activities = ActivityType.all
    @work_flow = WorkFlow.find(params[:work_flow_id])
    @activity = @work_flow.activities.new(params[:activity])
    @work_area = WorkArea.find(@work_flow.work_area_id)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to [@work_area, @work_flow], notice: 'se creo exitosamente.' }
        format.json { render json: @activity, status: :created, location: @activity }
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.json
  def update
    @activities = ActivityType.all
    @activity = Activity.find(params[:id])
    @work_flow = WorkFlow.find(params[:work_flow_id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to [@work_flow, @activity], notice: 'se modifico exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity = Activity.find(params[:id])
    @work_flow = WorkFlow.find(params[:work_flow_id])
    @work_area = WorkArea.find(@work_flow.work_area_id)
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to [@work_area, @work_flow] }
      format.json { head :no_content }
    end
  end
end

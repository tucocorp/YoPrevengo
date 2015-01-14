class ActivityTypesController < ApplicationController
  # GET /activity_types
  # GET /activity_types.json
  def index
    @activity_types = ActivityType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activity_types }
    end
  end

  # GET /activity_types/1
  # GET /activity_types/1.json
  def show
    @activity_type = ActivityType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity_type }
    end
  end

  # GET /activity_types/new
  # GET /activity_types/new.json
  def new
    @activity_type = ActivityType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity_type }
    end
  end

  # GET /activity_types/1/edit
  def edit
    @activity_type = ActivityType.find(params[:id])
  end

  # POST /activity_types
  # POST /activity_types.json
  def create
    @activity_type = ActivityType.new(params[:activity_type])

    respond_to do |format|
      if @activity_type.save
        format.html { redirect_to @activity_type, notice: 'se creo exitosamente.' }
        format.json { render json: @activity_type, status: :created, location: @activity_type }
      else
        format.html { render action: "new" }
        format.json { render json: @activity_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activity_types/1
  # PUT /activity_types/1.json
  def update
    @activity_type = ActivityType.find(params[:id])

    respond_to do |format|
      if @activity_type.update_attributes(params[:activity_type])
        format.html { redirect_to @activity_type, notice: 'se modifico exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_types/1
  # DELETE /activity_types/1.json
  def destroy
    @activity_type = ActivityType.find(params[:id])
    @activity_type.destroy

    respond_to do |format|
      format.html { redirect_to activity_types_url }
      format.json { head :no_content }
    end
  end
end

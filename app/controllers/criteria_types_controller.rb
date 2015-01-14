class CriteriaTypesController < ApplicationController
  # GET /criteria_types
  # GET /criteria_types.json
  def index
    @criteria_types = CriteriaType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @criteria_types }
    end
  end

  # GET /criteria_types/1
  # GET /criteria_types/1.json
  def show
    @criteria_type = CriteriaType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @criteria_type }
    end
  end

  # GET /criteria_types/new
  # GET /criteria_types/new.json
  def new
    @criteria_type = CriteriaType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @criteria_type }
    end
  end

  # GET /criteria_types/1/edit
  def edit
    @criteria_type = CriteriaType.find(params[:id])
  end

  # POST /criteria_types
  # POST /criteria_types.json
  def create
    @criteria_type = CriteriaType.new(params[:criteria_type])

    respond_to do |format|
      if @criteria_type.save
        format.html { redirect_to @criteria_type, notice: 'Criteria type was successfully created.' }
        format.json { render json: @criteria_type, status: :created, location: @criteria_type }
      else
        format.html { render action: "new" }
        format.json { render json: @criteria_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /criteria_types/1
  # PUT /criteria_types/1.json
  def update
    @criteria_type = CriteriaType.find(params[:id])

    respond_to do |format|
      if @criteria_type.update_attributes(params[:criteria_type])
        format.html { redirect_to @criteria_type, notice: 'Criteria type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @criteria_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criteria_types/1
  # DELETE /criteria_types/1.json
  def destroy
    @criteria_type = CriteriaType.find(params[:id])
    @criteria_type.destroy

    respond_to do |format|
      format.html { redirect_to criteria_types_url }
      format.json { head :no_content }
    end
  end
end

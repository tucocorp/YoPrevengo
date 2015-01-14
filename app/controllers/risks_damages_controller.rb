class RisksDamagesController < ApplicationController
  # GET /risks_damages
  # GET /risks_damages.json
  def index
    @risks_damages = RisksDamage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @risks_damages }
    end
  end

  # GET /risks_damages/1
  # GET /risks_damages/1.json
  def show
    @risks_damage = RisksDamage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @risks_damage }
    end
  end

  # GET /risks_damages/new
  # GET /risks_damages/new.json
  def new
    @risks_damage = RisksDamage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @risks_damage }
    end
  end

  # GET /risks_damages/1/edit
  def edit
    @risks_damage = RisksDamage.find(params[:id])
  end

  # POST /risks_damages
  # POST /risks_damages.json
  def create
    @risks_damage = RisksDamage.new(params[:risks_damage])

    respond_to do |format|
      if @risks_damage.save
        format.html { redirect_to @risks_damage, notice: 'Risks damage was successfully created.' }
        format.json { render json: @risks_damage, status: :created, location: @risks_damage }
      else
        format.html { render action: "new" }
        format.json { render json: @risks_damage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /risks_damages/1
  # PUT /risks_damages/1.json
  def update
    @risks_damage = RisksDamage.find(params[:id])

    respond_to do |format|
      if @risks_damage.update_attributes(params[:risks_damage])
        format.html { redirect_to @risks_damage, notice: 'Risks damage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @risks_damage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /risks_damages/1
  # DELETE /risks_damages/1.json
  def destroy
    @risks_damage = RisksDamage.find(params[:id])
    @risks_damage.destroy

    respond_to do |format|
      format.html { redirect_to risks_damages_url }
      format.json { head :no_content }
    end
  end
end

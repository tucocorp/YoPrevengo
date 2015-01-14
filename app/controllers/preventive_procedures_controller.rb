class PreventiveProceduresController < ApplicationController
  # GET /preventive_procedures
  # GET /preventive_procedures.json
  def index
    @preventive_procedures = PreventiveProcedure.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @preventive_procedures }
    end
  end

  # GET /preventive_procedures/1
  # GET /preventive_procedures/1.json
  def show
    @preventive_procedure = PreventiveProcedure.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @preventive_procedure }
    end
  end

  # GET /preventive_procedures/new
  # GET /preventive_procedures/new.json
  def new
    @preventive_procedure = PreventiveProcedure.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @preventive_procedure }
    end
  end

  # GET /preventive_procedures/1/edit
  def edit
    @preventive_procedure = PreventiveProcedure.find(params[:id])
  end

  # POST /preventive_procedures
  # POST /preventive_procedures.json
  def create
    @preventive_procedure = PreventiveProcedure.new(params[:preventive_procedure])

    respond_to do |format|
      if @preventive_procedure.save
        format.html { redirect_to @preventive_procedure, notice: 'Preventive procedure was successfully created.' }
        format.json { render json: @preventive_procedure, status: :created, location: @preventive_procedure }
      else
        format.html { render action: "new" }
        format.json { render json: @preventive_procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /preventive_procedures/1
  # PUT /preventive_procedures/1.json
  def update
    @preventive_procedure = PreventiveProcedure.find(params[:id])

    respond_to do |format|
      if @preventive_procedure.update_attributes(params[:preventive_procedure])
        format.html { redirect_to @preventive_procedure, notice: 'Preventive procedure was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @preventive_procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preventive_procedures/1
  # DELETE /preventive_procedures/1.json
  def destroy
    @preventive_procedure = PreventiveProcedure.find(params[:id])
    @preventive_procedure.destroy

    respond_to do |format|
      format.html { redirect_to preventive_procedures_url }
      format.json { head :no_content }
    end
  end

  def generar_procedimiento
    #@unitary_task = UnitaryTask.find(params[:id])
    @risk_matrix = RiskMatrix.find(params[:id])
    @risk = Risk.find(@risk_matrix.risk_id)
    @header = MatrixHeader.find(@risk_matrix.matrix_header_id)
    @unitary_task = UnitaryTask.find(@header.unitary_task_id)
    @activity = Activity.find(@unitary_task.activity_id)

  end

  def guardarProcedimiento
    @preventive_procedure = PreventiveProcedure.new
    @unitary_task = UnitaryTask.find(params[:tarea_id])
    @header = MatrixHeader.find(params[:header_id])
    @activity = Activity.find(@unitary_task.activity_id)
    @a = 1
    @i = 0
    @cont = params[:monitoring_time].length
      
    
      @preventive_procedure.monitoring_time = params[:monitoring_time][0]
      @preventive_procedure.control_amount = params[:control_amount][0]
      @preventive_procedure.control_responsable = params[:control_responsable][0]
      @preventive_procedure.control_measure = params[:control_measure][0]
      @preventive_procedure.risk_matrix_id = params[:risk_matrix_id] 
      
      if @preventive_procedure.save
        @i = 1
        @preventive_procedure = PreventiveProcedure.new
        @preventive_procedure.monitoring_time = params[:monitoring_time1][0]
        @preventive_procedure.control_amount = params[:control_amount1][0]
        @preventive_procedure.control_responsable = params[:control_responsable1][0]
        @preventive_procedure.control_measure = params[:control_measure1][0]
        @preventive_procedure.risk_matrix_id = params[:risk_matrix_id]
        @preventive_procedure.save 
      else
        @i = 0
      end
      @a += 1
    
  

    respond_to do |format|
      if @i == 1
        format.html { redirect_to matrix_header_path(@header.id), notice: 'El procedimiento preventivo ha sido creado exitosamente' }
        format.json { render json: @preventive_procedure, status: :created, location: @preventive_procedure }
      else
        format.html { render action: "new" }
        format.json { render json: @preventive_procedure.errors, status: :unprocessable_entity }
      end
  
    end    
  end

  def ver_procedimiento
    @risk_matrix = RiskMatrix.find(params[:id])
    @risk = Risk.find(@risk_matrix.risk_id)
    @header = MatrixHeader.find(@risk_matrix.matrix_header_id)
    @unitary_task = UnitaryTask.find(@header.unitary_task_id)
    @activity = Activity.find(@unitary_task.activity_id)

    @procedimiento = PreventiveProcedure.where(:risk_matrix_id => @risk_matrix.id)
    @i=0

  end

  def actualizar_procedimiento
    @risk_matrix = RiskMatrix.find(params[:id])
    @risk = Risk.find(@risk_matrix.risk_id)
    @header = MatrixHeader.find(@risk_matrix.matrix_header_id)
    @unitary_task = UnitaryTask.find(@header.unitary_task_id)
    @activity = Activity.find(@unitary_task.activity_id)
    @procedimiento = PreventiveProcedure.where(:risk_matrix_id => @risk_matrix.id)
    @procedimiento_ids = []
    @i=0
  end

  def guardar_actualizar_procedimiento
      @risk_matrix = RiskMatrix.find(params[:risk_matrix_id])
      params[:procedimiento_ids] ||= []         
      @procedimiento_ids = params[:procedimiento_ids]
      @a = 0
      @i = 0

      @procedimiento_ids.each do |p|
        if @preventive_procedure = PreventiveProcedure.find(p)          
          @preventive_procedure.update_attributes(:monitoring_time => params[:monitoring_time][@a], :control_amount => params[:control_amount][@a], :control_responsable => params[:control_responsable][@a], :control_measure => params[:control_measure][@a])
          @i = 1
          
        else
          @i = 0
        end
        @a += 1
      end  

      respond_to do |format|
        if @i == 1
          format.html { redirect_to ver_procedimiento_path(@risk_matrix.id), notice: 'El procedimiento se ha actualizado exitosamente.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @preventive_procedure.errors, status: :unprocessable_entity }
        end
      end
  end

end


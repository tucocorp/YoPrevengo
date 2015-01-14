class MatrixHeadersController < ApplicationController
  # GET /matrix_headers
  # GET /matrix_headers.json
  def index
    @matrix_headers = MatrixHeader.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matrix_headers }
    end
  end

  # GET /matrix_headers/1
  # GET /matrix_headers/1.json
  def show
    @header = MatrixHeader.find(params[:id])
    @unitary_task = UnitaryTask.find(@header.unitary_task_id)
    @activity = Activity.find(@unitary_task.activity_id)
    @risk_matrix = RiskMatrix.where(:matrix_header_id => @header.id)
    @company = Company.find(@unitary_task.activity.work_flow.work_area.company_id)
    @evaluation_critery = EvaluationCritery.where(:company_id => @company.id)
    @probabilidad = EvaluationCritery.where(:company_id => @company.id , :criteria_type_id => 2).order(:criteria_type_id)
    @consecuencia = EvaluationCritery.where(:company_id => @company.id , :criteria_type_id => 1).order(:criteria_type_id)
    
    
    # obtener rango de criticidad con numeros repetidos
    @r = []
    @probabilidad.each do |p|      
      @consecuencia.each do |c|
        @r << p.value * c.value
      end  
    end
    # eliminar los numeros rangos repetidos
    @r = @r.uniq 

    # obtener riesgos evaluados y riesgos no evaluados
    @evaluado = []
    @noevaluado = []
    @matrixx = RiskMatrix.where(:matrix_header_id => @header.id)
    @matrixx.each do |m|
     if m.generate == true
      @evaluado << m
      else
       @noevaluado << m
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @matrix_header }
     
      format.html
      format.pdf do
        pdf = MatrixHeaderPdf.new(@header,@risk_matrix)
        send_data pdf.render, filename: "matrix_header_#{@header.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  # GET /matrix_headers/new
  # GET /matrix_headers/new.json
  def new
    @matrix_header = MatrixHeader.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @matrix_header }
    end
  end

  # GET /matrix_headers/1/edit
  def edit
    @matrix_header = MatrixHeader.find(params[:id])
  end

  # POST /matrix_headers
  # POST /matrix_headers.json
  def create
    @matrix_header = MatrixHeader.new(params[:matrix_header])

    respond_to do |format|
      if @matrix_header.save
        format.html { redirect_to @matrix_header, notice: 'Matrix header was successfully created.' }
        format.json { render json: @matrix_header, status: :created, location: @matrix_header }
      else
        format.html { render action: "new" }
        format.json { render json: @matrix_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /matrix_headers/1
  # PUT /matrix_headers/1.json
  def update
    @matrix_header = MatrixHeader.find(params[:id])

    respond_to do |format|
      if @matrix_header.update_attributes(params[:matrix_header])
        format.html { redirect_to @matrix_header, notice: 'Matrix header was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @matrix_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matrix_headers/1
  # DELETE /matrix_headers/1.json
  def destroy
    @matrix_header = MatrixHeader.find(params[:id])
    @matrix_header.destroy

    respond_to do |format|
      format.html { redirect_to matrix_headers_url }
      format.json { head :no_content }
    end
  end


  def new_matriz
    @boton = "Asignar Riesgos a nueva matriz"
    @unitary_task = UnitaryTask.find(params[:id])
    @activity = Activity.find(@unitary_task.activity_id)
    @work_flow = WorkFlow.find(@activity.work_flow_id)
    @header = MatrixHeader.new(:unitary_task_id => @unitary_task.id)
    @header.save
  end

  def borrar_cabecera    
    @header = MatrixHeader.find(params[:id])
    @unitary_task = UnitaryTask.find(@header.unitary_task_id)
    @activity = Activity.find(@unitary_task.activity_id)
    @header.destroy

    respond_to do |format|
      format.html { redirect_to [@activity,@unitary_task] }
      format.json { head :no_content }
    end
  end

  def guardar_new_matriz      
    params[:matrix_header][:risk_ids] ||= []
    @unitary_task = UnitaryTask.find(params[:tarea_id])
    @header = MatrixHeader.find(params[:header_id])
    @activity = Activity.find(@unitary_task.activity_id)
    @work_flow = WorkFlow.find(@activity.work_flow_id)


    respond_to do |format|
      if @header.update_attributes(params[:matrix_header])
        @matrices = RiskMatrix.where(:matrix_header_id => params[:header_id], :generate => nil )
        @matrices.each do |r|
          @matriz = RiskMatrix.find(r.id)
          @matriz.generate = false
          @matriz.save
        end
        format.html { redirect_to generar_nueva_matriz_path(@header.id), notice: 'se modifico exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unitary_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def asignar
    @boton = "Asignar Riesgos"
    @header = MatrixHeader.find(params[:id])
    @unitary_task = UnitaryTask.find(@header.unitary_task_id)
    @activity = Activity.find(@unitary_task.activity_id)
    @work_flow = WorkFlow.find(@activity.work_flow_id)
  end

  def guardarasignar   
    params[:matrix_header][:risk_ids] ||= []
    @unitary_task = UnitaryTask.find(params[:tarea_id])
    @header = MatrixHeader.find(params[:header_id])
    @activity = Activity.find(@unitary_task.activity_id)
    @work_flow = WorkFlow.find(@activity.work_flow_id)


    respond_to do |format| 
      if @header.update_attributes(params[:matrix_header])
        @matrices = RiskMatrix.where(:matrix_header_id => params[:header_id], :generate => nil )
        @matrices.each do |r|
          @matriz = RiskMatrix.find(r.id)
          @matriz.generate = false
          @matriz.save
        end
        format.html { redirect_to matrix_header_path(@header.id), notice: 'se modifico exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unitary_task.errors, status: :unprocessable_entity }
      end
    end
  end

end

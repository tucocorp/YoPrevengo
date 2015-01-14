class RiskMatricesController < ApplicationController
  # GET /risk_matrices
  # GET /risk_matrices.json
  def index
    #@risk_matrices = RiskMatrix.all
    #@risk_matrices = RiskMatrix.search(params[:search])
    @risk_matrices = RiskMatrix.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    #@unitary_task = UnitaryTask.find(@risk_matrices.risk_id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @risk_matrices }
    end
  end

  # GET /risk_matrices/1
  # GET /risk_matrices/1.json
  def show
    @unitary_task = UnitaryTask.find(params[:tarea_id])
    @risk_matrix = RiskMatrix.where(:unitary_task_id => params[:id])
    @company = Company.find(@unitary_task.activity.work_flow.work_area.company_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @risk_matrix }
    end
  end

  # GET /risk_matrices/new
  # GET /risk_matrices/new.json
  def new
    @risk_matrix = RiskMatrix.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @risk_matrix }
    end
  end

  # GET /risk_matrices/1/edit
  def edit
    #@risk_matrix = RiskMatrix.find(params[:id])
  end

  # POST /risk_matrices
  # POST /risk_matrices.json
  def create
    @risk_matrix = RiskMatrix.new(params[:risk_matrix])

    respond_to do |format|
      if @risk_matrix.save
        format.html { redirect_to @risk_matrix, notice: 'Risk matrix was successfully created.' }
        format.json { render json: @risk_matrix, status: :created, location: @risk_matrix }
      else
        format.html { render action: "new" }
        format.json { render json: @risk_matrix.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /risk_matrices/1
  # PUT /risk_matrices/1.json
  def update
    @risk_matrix = RiskMatrix.find(params[:id])

    respond_to do |format|
      if @risk_matrix.update_attributes(params[:risk_matrix])
        format.html { redirect_to @risk_matrix, notice: 'Risk matrix was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @risk_matrix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /risk_matrices/1
  # DELETE /risk_matrices/1.json
  def destroy
    @risk_matrix = RiskMatrix.find(params[:id])
    @risk_matrix.destroy

    respond_to do |format|
      format.html { redirect_to risk_matrices_url }
      format.json { head :no_content }
    end
  end

  def generar_nueva_matriz
    
    @header = MatrixHeader.find(params[:id])
    @unitary_task = UnitaryTask.find(@header.unitary_task_id)
    @activity = Activity.find(@unitary_task.activity_id)
    @risk_matrix = RiskMatrix.where(:matrix_header_id => params[:id], :generate => false)
    @company = Company.find(@unitary_task.activity.work_flow.work_area.company_id)
    @evaluation_critery = EvaluationCritery.where(:company_id => @company.id).order(:criteria_type_id)

    @probabilidad = EvaluationCritery.where(:company_id => @company.id , :criteria_type_id => 2).order(:criteria_type_id)
    @consecuencia = EvaluationCritery.where(:company_id => @company.id , :criteria_type_id => 1).order(:criteria_type_id)
    @max = @consecuencia.last.value
    # obtener rango de criticidad con numeros repetidos
    @r = []
    @probabilidad.each do |p|      
      @consecuencia.each do |c|
        @r << p.value * c.value
      end  
    end
    # eliminar los numeros rangos repetidos
    @r = @r.uniq   
    
  end

  def generar_matriz
    
    @header = MatrixHeader.find(params[:id])
    @unitary_task = UnitaryTask.find(@header.unitary_task_id)
    @activity = Activity.find(@unitary_task.activity_id)
    @risk_matrix = RiskMatrix.where(:matrix_header_id => params[:id], :generate => false)
    @company = Company.find(@unitary_task.activity.work_flow.work_area.company_id)
    @evaluation_critery = EvaluationCritery.where(:company_id => @company.id).order(:criteria_type_id)

    @probabilidad = EvaluationCritery.where(:company_id => @company.id , :criteria_type_id => 2).order(:criteria_type_id)
    @consecuencia = EvaluationCritery.where(:company_id => @company.id , :criteria_type_id => 1).order(:criteria_type_id)
    @max = @consecuencia.last.value
    # obtener rango de criticidad con numeros repetidos
    @r = []
    @probabilidad.each do |p|      
      @consecuencia.each do |c|
        @r << p.value * c.value
      end  
    end
    # eliminar los numeros rangos repetidos
    @r = @r.uniq   
    
  end




  def guardarGenerarMatriz
     @i = 0
      @a = 0
      
      params[:matrix_id] ||= []         
      @matrix_ids = params[:matrix_id]
      @header = params[:header_id]
      @unitary_task = UnitaryTask.find(params[:tarea_id])
      @activity = Activity.find(@unitary_task.activity_id)
      @conse_max = params[:conse_max]
      @cant_criterio = params[:cant_criterio]
      @conse_max = @conse_max.to_i
      @cant_criterio = @cant_criterio.to_i
      
      @matrix_ids.each do |m|
        if @risk_matrix = RiskMatrix.find(m)
          @consecuencia = params[:consequence][@a]
          @probabilidad = params[:probability][@a]
          @magnitud =  @consecuencia.to_i * @probabilidad.to_i
          if @cant_criterio == 3 
            if @consecuencia.to_i ==  @conse_max 
               @clasificacion = "Intolerable"
            else
              if @magnitud < 2 
                 @clasificacion = "Tolerable"
              elsif @magnitud > 2
                  @clasificacion = "Intolerable"
              else
                 @clasificacion = "Moderado"
              end
            end
          elsif @cant_criterio == 5
            if @consecuencia.to_i == @conse_max 
                @clasificacion = "Intolerable"
            else                           
              if @magnitud < 4
                  @clasificacion = "Tolerable"
              elsif @magnitud > 8
                  @clasificacion = "Intolerable"
              elsif @magnitud >= 4 and @magnitud <= 8
                 @clasificacion = "Moderado"
              end
            end
          elsif @cant_criterio == 7
            if @consecuencia.to_i == @conse_max 
               @clasificacion = "Intolerable"
            else
                if @magnitud < 8
                    @clasificacion = "Tolerable"
                elsif @magnitud > 16
                    @clasificacion = "Intolerable"                   
                elsif @magnitud >= 8 and @magnitud <= 16
                   @clasificacion = "Moderado"
                end
             end
          end
          @risk_matrix.update_attributes(:personal_cause => params[:personal_cause][@a], :work_cause => params[:work_cause][@a], :consequence => params[:consequence][@a], :probability => params[:probability][@a], :magnitude => @magnitud, :resposable => current_user.username, :rating => @clasificacion) 
          @i = 1
          @a += 1
        else
          @i = 0
        end
      end      
      
    respond_to do |format|
      if @i == 1
        format.html { redirect_to ver_matriz_path(params[:header_id]), notice: "#{@i} Risk matrix was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit", notice: 'no entro.' }
        format.json { render json: @risk_matrix.errors, status: :unprocessable_entity }
      end
    end
  end #fin def

  def ver_matriz
    @header = MatrixHeader.find(params[:id])
    @unitary_task = UnitaryTask.find(@header.unitary_task_id)
    @activity = Activity.find(@unitary_task.activity_id)
    @risk_matrix = RiskMatrix.where(:matrix_header_id => @header.id)
    @company = Company.find(@unitary_task.activity.work_flow.work_area.company_id)
    @evaluation_critery = EvaluationCritery.where(:company_id => @company.id)
    @probabilidad = EvaluationCritery.where(:company_id => @company.id , :criteria_type_id => 2).order(:criteria_type_id)
    @consecuencia = EvaluationCritery.where(:company_id => @company.id , :criteria_type_id => 1).order(:criteria_type_id)
    
    @max = @consecuencia.last.value

    # obtener rango de criticidad con numeros repetidos
    @r = []
    @probabilidad.each do |p|      
      @consecuencia.each do |c|
        @r << p.value * c.value
      end  
    end
    # eliminar los numeros rangos repetidos
    @r = @r.uniq

    @risk_matrix.each do |rm|
      @matriz = RiskMatrix.find(rm.id)
      @matriz.generate = true
      @matriz.save
    end  

  end

  def actualizar_riesgo_evaluado
    @header = MatrixHeader.find(params[:id])
    @unitary_task = UnitaryTask.find(@header.unitary_task_id)
    @activity = Activity.find(@unitary_task.activity_id)
    @risk_matrix = RiskMatrix.where(:matrix_header_id => params[:id], :generate => true)
    @company = Company.find(@unitary_task.activity.work_flow.work_area.company_id)
    @evaluation_critery = EvaluationCritery.where(:company_id => @company.id).order(:criteria_type_id)

    @probabilidad = EvaluationCritery.where(:company_id => @company.id , :criteria_type_id => 2).order(:criteria_type_id)
    @consecuencia = EvaluationCritery.where(:company_id => @company.id , :criteria_type_id => 1).order(:criteria_type_id)
    @max = @consecuencia.last.value
    # obtener rango de criticidad con numeros repetidos
    @r = []
    @probabilidad.each do |p|      
      @consecuencia.each do |c|
        @r << p.value * c.value
      end  
    end
    # eliminar los numeros rangos repetidos
    @r = @r.uniq   
  end

  def guardarActualizarRiesgoEvaluado
  @i = 0
      @a = 0
      @header = MatrixHeader.find(params[:header_id])
      params[:matrix_id] ||= []         
      @matrix_ids = params[:matrix_id]
      @unitary_task = UnitaryTask.find(params[:tarea_id])
      @conse_max = params[:conse_max]
      @cant_criterio = params[:cant_criterio]
      @conse_max = @conse_max.to_i
      @cant_criterio = @cant_criterio.to_i
      
      @matrix_ids.each do |m|
        if @risk_matrix = RiskMatrix.find(m)
          @consecuencia = params[:consequence][@a]
          @probabilidad = params[:probability][@a]
          @magnitud =  @consecuencia.to_i * @probabilidad.to_i

          if @cant_criterio == 3 
            if @consecuencia.to_i ==  @conse_max 
               @clasificacion = "Intolerable"
            else
              if @magnitud < 2 
                 @clasificacion = "Tolerable"
              elsif @magnitud > 2
                  @clasificacion = "Intolerable"
              else
                 @clasificacion = "Moderado"
              end
            end
          elsif @cant_criterio == 5
            if @consecuencia.to_i == @conse_max 
                @clasificacion = "Intolerable"
            else                           
              if @magnitud < 4
                  @clasificacion = "Tolerable"
              elsif @magnitud > 8
                  @clasificacion = "Intolerable"
              elsif @magnitud >= 4 and @magnitud <= 8
                 @clasificacion = "Moderado"
              end
            end
          elsif @cant_criterio == 7
            if @consecuencia.to_i == @conse_max 
               @clasificacion = "Intolerable"
            else
                if @magnitud < 8
                    @clasificacion = "Tolerable"
                elsif @magnitud > 16
                    @clasificacion = "Intolerable"                   
                elsif @magnitud >= 8 and @magnitud <= 16
                   @clasificacion = "Moderado"
                end
             end
          end
          @risk_matrix.update_attributes(:personal_cause => params[:personal_cause][@a], :work_cause => params[:work_cause][@a], :consequence => params[:consequence][@a], :probability => params[:probability][@a], :magnitude => @magnitud, :resposable => current_user.username, :rating => @clasificacion) 
          @i = 1
          @a += 1
        else
          @i = 0
        end
      end      
      
    respond_to do |format|
      if @i == 1
        format.html { redirect_to matrix_header_path(@header.id), notice: "#{@i} Risk matrix was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit", notice: 'no entro.' }
        format.json { render json: @risk_matrix.errors, status: :unprocessable_entity }
      end
    end
  end

end # fin

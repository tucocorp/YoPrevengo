class MatrixHeaderPdf < Prawn::Document
	def initialize(matrix_header, risk_matrix)
		super(top_margin: 70)
		@matrix_header = matrix_header
		@matriz = risk_matrix
		#text "matrix_header \##{@matrix_header.id}"
		matrix_header_body
	end

	def matrix_header_body
		font("Times-Roman") do
			
			move_down 10
			#text "#{@matrix_header.unitary_task.activity.work_flow.work_area.company.name}",:align => :center, :inline_format => true, size: 24, style: :bold
			#text "DIVISION CODELCO NORTE",:align => :center, :inline_format => true, size: 14, style: :bold
			#text "SISTEMA DE GESTION DE SEGURIDAD Y SALUD OCUPACIONAL",:align => :center, :inline_format => true, size: 14, style: :bold
			#text "IDENTIFICACION DE PELIGROS Y EVALUACION DE LOS RIESGOS",:align => :center, :inline_format => true, size: 14, style: :bold
			
				
			table  ([
				["Compania   ", "Codelco", "", ""],
				["Area", "Produccion", "Proceso", "Preparacion y Manejo de Carga"],
				["Actividad", "Mantencion Mecanica", "Tarea unitaria", "Cambio de bomba tornillo 03-019 y 03-019 a del secador rotatorio N4."]
			]), :width => 550
			move_down 20
			text "Evaluado por: ______________________________________________________________________________"

			move_down 40
			
			
			

	    	data = [
	    				["Peligro", "Riesgo", "Factor personal", "Factor trabajo", "Probabilidad", "Consecuencia", "Magnitud", "Clasificacion"],
						
						["Cargas manuales excesivas", "Sobre esfuerzo fisico al transportar y/o manipular cargas que exceden la capacidad fisica de las personas", "Stress fisico", "Herramientas y equipo inadecuado", 2, 2, 4, "Tolerable"],
						["Superficies irregulares o fuera de Estandar", "Perdida de equilibrio", "Falta de conocimiento", "Ingenieria inadecuada", 2, 8, 16, "Intolerable"],
						["Intervencion Inadecuda de lineas, sistemas, equipos e instalaciones con fluidos o gases a presion", "Golpeado / alcanzado por liberacion de presion", "Falta de conocimiento", "Mantencion inadecuda", 2, 4, 8, "Moderado"],
						["Manipulacion de herramientas y equipos", "Golpeado por mala utilizacion de herramientas y equipos.", "Falta de conocimiento", "Herramientas y equipo inadecuado", 2, 2, 4, "Tolerable"],
						["Manejo de cargas suspendidas y de levante", "Golpeado por caida de equios", "Capacidad mental inadecuada", "Abuso y mal uso", 2, 2, 4, "Tolerable"],
						["Expuesto a ruido estacionario/continuo/de impacto", "Trauma acustico / Sordera profesional progresiva / Irritacion nerviosa", "Capacidad mental inadecuada", "Uso y desgaste", 8, 4, 32, "Intolerable"]
					]

			table(data) do
				values = cells.columns(1..-1).rows(1..-1)

				bad_sales = values.filter do |cell|
					cell.content == "Intolerable"
				end
				bad_sales.background_color = "FF0000"

				bad_sales = values.filter do |cell|
					cell.content == "Moderado"
				end
				bad_sales.background_color = "FFFF00"

				bad_sales = values.filter do |cell|
					cell.content == "Tolerable"
				end
				bad_sales.background_color = "339900"

				
			end
	    	
	    	
		

		end
	end
end


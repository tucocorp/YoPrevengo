class PreventiveProcedure < ActiveRecord::Base
	attr_accessible :monitoring_time, :control_amount, :control_responsable, :control_measure
	belongs_to :risk_matrix
end

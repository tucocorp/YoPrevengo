class MatrixHeader < ActiveRecord::Base
	attr_accessible :unitary_task_id , :risk_ids
	has_many :risk_matrices
	has_many :risks, :through => :risk_matrices
	belongs_to :unitary_task
end

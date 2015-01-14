class RiskMatrix < ActiveRecord::Base
	attr_accessible :magnitude, :probability, :consequence, :work_cause, :personal_cause
	belongs_to :risk 
	belongs_to :matrix_header
	has_one :preventive_procedure, :dependent => :destroy

	def self.search(search)
	  if search
	    find(:all, :conditions => ['rating LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end

	
end

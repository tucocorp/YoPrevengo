class RisksDamage < ActiveRecord::Base
	attr_accessible :risk_id , :damage_id
	
	belongs_to :risk
	belongs_to :damage
end

class Damage < ActiveRecord::Base
	attr_accessible :description
	has_many :risks_damages
	has_many :risk, :through => :risks_damages
end
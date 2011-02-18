class Event < ActiveRecord::Base
	belongs_to :project
	has_many :users, :through => :project
end

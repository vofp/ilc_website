class Event < ActiveRecord::Base
	belongs_to :project
	has_many :attendees, :through => :projects, :source => :user
end

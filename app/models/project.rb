class Project < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :blogs
	has_many :events, :order => "created_at DESC"
end

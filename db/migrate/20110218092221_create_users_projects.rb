class CreateUsersProjects < ActiveRecord::Migration
  def self.up
		create_table :users_projects, :id => false do |t|
			t.integer :user_id
			t.integer :project_id
		end
  end

  def self.down
		drop_table :users_projects
  end
end

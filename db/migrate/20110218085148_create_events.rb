class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :url
      t.datetime :time
			t.integer :project_id
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end

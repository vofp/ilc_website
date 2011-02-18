class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.timestamps
      t.string :name
      t.text :description
	t.string :email
	t.string :hashed_password
	t.string :username
    end
  end

  def self.down
    drop_table :users
  end
end

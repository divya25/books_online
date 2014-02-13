class RemovePublisherIdFromUser < ActiveRecord::Migration
  def self.up
  	remove_column :users, :publisher_id
  end

  def self.down
  	add_column :users, :publisher_id, :integer
  end
end

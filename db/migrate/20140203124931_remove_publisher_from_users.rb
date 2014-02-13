class RemovePublisherFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :publisher
  end

  def self.down
    add_column :users, :publisher, :string
  end
end

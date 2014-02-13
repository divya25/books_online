class RemovePublisherFromBooks < ActiveRecord::Migration
  def self.up
    remove_column :books, :publisher
  end

  def self.down
    add_column :books, :publisher, :string
  end
end

class AddPublisherIdToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :publisher_id, :integer
  end

  def self.down
    remove_column :books, :publisher_id
  end
end

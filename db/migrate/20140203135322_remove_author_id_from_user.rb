class RemoveAuthorIdFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :author_id
  end

  def self.down
    add_column :users, :author_id, :integer
  end
end

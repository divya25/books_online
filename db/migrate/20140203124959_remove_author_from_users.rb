class RemoveAuthorFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :author
  end

  def self.down
    add_column :users, :author, :string
  end
end

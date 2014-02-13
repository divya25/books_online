class AddUserIdToBookshelves < ActiveRecord::Migration
  def self.up
    add_column :bookshelves, :user_id, :integer
  end

  def self.down
    remove_column :bookshelves, :user_id
  end
end

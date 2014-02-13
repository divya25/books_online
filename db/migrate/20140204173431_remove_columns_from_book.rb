class RemoveColumnsFromBook < ActiveRecord::Migration
  def self.up
    remove_column :books, :number_rated
    remove_column :books, :average_rating
  end

  def self.down
    add_column :books, :average_rating, :integer
    add_column :books, :number_rated, :integer
  end
end

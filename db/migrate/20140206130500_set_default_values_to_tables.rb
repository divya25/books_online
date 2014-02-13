class SetDefaultValuesToTables < ActiveRecord::Migration
  def self.up
  	change_column :books, :number_of_pages, :integer, :default => 0
  	change_column :bookshelves, :status, :string, :default => "To read"
  	change_column :bookshelves, :read_count, :integer, :default => 0
  	change_column :ratings, :Rating, :integer, :default => 0
  	change_column :users, :admin, :boolean, :default => false
  end

  def self.down
  end
end

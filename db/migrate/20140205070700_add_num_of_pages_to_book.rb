class AddNumOfPagesToBook < ActiveRecord::Migration
  def self.up
    add_column :books, :number_of_pages, :integer
  end

  def self.down
    remove_column :books, :number_of_pages
  end
end

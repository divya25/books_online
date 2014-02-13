class ChangeBookIdToLikes < ActiveRecord::Migration
  def self.up
  	rename_column :likes, :book_id, :review_id
  end

  def self.down
  	rename_column :likes, :review_id, :book_id
  end
end

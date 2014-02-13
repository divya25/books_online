class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :publisher
      t.string :description
      t.integer :category_id
      t.integer :number_rated
      t.integer :average_rating

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end

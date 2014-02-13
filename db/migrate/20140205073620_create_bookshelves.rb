class CreateBookshelves < ActiveRecord::Migration
  def self.up
    create_table :bookshelves do |t|
      t.integer :book_id
      t.string :status, :default => "To-read"
      t.integer :read_count, :default => 0
      t.string :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :bookshelves
  end
end

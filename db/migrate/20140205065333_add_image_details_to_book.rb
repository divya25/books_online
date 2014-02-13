class AddImageDetailsToBook < ActiveRecord::Migration
  def self.up
    add_column :books, :avatar_file_name, :string
    add_column :books, :avatar_content_type, :string
    add_column :books, :avatar_file_size, :integer
    add_column :books, :avatar_updated_at, :datetime
  end

  def self.down
    remove_column :books, :avatar_updated_at
    remove_column :books, :avatar_file_size
    remove_column :books, :avatar_content_type
    remove_column :books, :avatar_file_name
  end
end

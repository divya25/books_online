class AddAttachmentsAvatarToUser < ActiveRecord::Migration
  def self.up
    execute 'ALTER TABLE users ADD COLUMN avatar_file LONGBLOB'
    execute 'ALTER TABLE users ADD COLUMN avatar_small_file LONGBLOB'
    execute 'ALTER TABLE users ADD COLUMN avatar_thumb_file LONGBLOB'
    add_column :users, :avatar_file_name, :string
    add_column :users, :avatar_content_type, :string
    add_column :users, :avatar_file_size, :integer
    add_column :users, :avatar_updated_at, :datetime
  end

  def self.down
    execute 'ALTER TABLE users REMOVE COLUMN avatar_file LONGBLOB'
    execute 'ALTER TABLE users RE COLUMN avatar_small_file LONGBLOB'
    execute 'ALTER TABLE users ADD COLUMN avatar_thumb_file LONGBLOB'
    remove_column :users, :avatar_file, :LONGBLOB
    remove_column :users, :avatar_small_file, :LONGBLOB
    remove_column :users, :avatar_small_file, :LONGBLOB
    remove_column :users, :avatar_file_name
    remove_column :users, :avatar_content_type
    remove_column :users, :avatar_file_size
    remove_column :users, :avatar_updated_at
  end
end

class AddAttachmentsBlobAvatarToBook < ActiveRecord::Migration
   def self.up
    execute 'ALTER TABLE books ADD COLUMN avatar_file LONGBLOB'
    execute 'ALTER TABLE books ADD COLUMN avatar_small_file LONGBLOB'
    execute 'ALTER TABLE books ADD COLUMN avatar_thumb_file LONGBLOB'
  end

  def self.down
    remove_column :books, :avatar_file
    remove_column :books, :avatar_small_file
    remove_column :books, :avatar_thumb_file
  end
end
